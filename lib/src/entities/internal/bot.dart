import 'dart:async';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/src/entities/internal/tgapi_methods.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

class Bot with TGAPIMethods {
  final int _timeout;

  final _updateCallbacks = <Future Function(Bot, Update)>[];
  final _commandCallbacks = <String, Future Function(Bot, Update)>{};

  final FutureOr Function(Bot)? _onReady;
  final FutureOr Function(Bot, Object, StackTrace)? _onStartFailed;

  Future Function(Bot, Update, Object, StackTrace)? errorHandler;

  Future Function(Bot, Object, StackTrace)? connectionErrorHandler;

  bool _isRunning = false;
  int _offset = 0;
  int? _id;
  String? _firstName;
  String? _username;

  List<UpdateType>? allowedUpdates;

  var log = Logger('Bot');

  int? get id => _id;

  String? get firstName => _firstName;

  String? get username => _username;

  bool get isRunning => _isRunning;

  Bot({
    required String token,
    int timeout = 10,
    FutureOr Function(Bot)? onReady,
    FutureOr Function(Bot, Object, StackTrace)? onStartFailed,
    this.allowedUpdates,
  })  : _onReady = onReady,
        _timeout = timeout,
        _onStartFailed = onStartFailed {
    setup(token);
    _setup();
  }

  /// Update bot info, useful if bot info are changed from
  /// BotFather while the bot is running
  Future updateMe() async {
    var user = await getMe();
    _id = user.id;
    _firstName = user.firstName;
    _username = user.username!;
    log = Logger(_firstName!);
  }

  /// Start getting updates
  Future start({bool clean = false}) async {
    if (clean) {
      await _cleanUpdates();
    }
    await _eventLoop();
    // Clean last read update
    await getUpdates(timeout: 0, offset: _offset);
  }

  /// Adds a new update handler
  /// which is executed on each update<br>
  /// If an handler throws an error, [errorHandler] is called
  /// and the next handler/update is elaborated
  void onUpdate(Future Function(Bot, Update) callback) {
    _updateCallbacks.add(callback);
  }

  /// Adds a new command callback
  /// which will be executed when the given command is received<br>
  /// If a command callback throws an error, [errorHandler] is called
  void onCommand(String command, Future Function(Bot, Update) callback) {
    _commandCallbacks[command] = callback;
  }

  /// Stops bot if it's running, only closes the http client if not
  void stop() {
    _isRunning = false;
    closeClient();
  }

  Future _criticalErrorHandler(Object e, StackTrace st) async {
    log.severe('An exception occurred during an exception handling');
    log.severe(e, st);
  }

  Future _onConnectionError(Bot bot, Object error, StackTrace st) async {
    log.severe('Connection error', error, st);
    runZonedGuarded(
      () {
        connectionErrorHandler?.call(bot, error, st);
      },
      _criticalErrorHandler,
    );
  }

  Future _onError(Bot bot, Update update, Object error, StackTrace st) async {
    log.severe('Update crashed', error, st);
    _runProtected(
      () => errorHandler?.call(bot, update, error, st),
      update,
      customErrHandler: (b, u, e, s) => _criticalErrorHandler(e, s),
    );
  }

  Future _setup() async {
    try {
      await updateMe();
    } catch (e, s) {
      await _onStartFailed?.call(this, e, s);
      closeClient();
      return;
    }
    await _onReady?.call(this);
  }

  void _runProtected(
    dynamic Function() foo,
    Update update, {
    Future Function(Bot, Update, Object, StackTrace)? customErrHandler,
  }) {
    runZonedGuarded(
      foo,
      (e, s) => (customErrHandler ?? _onError)(this, update, e, s),
    );
  }

  Future _cleanUpdates() async {
    var updates = await getUpdates(timeout: 0, offset: -1);
    if (updates.isNotEmpty) {
      _offset = updates[0].updateId + 1;
    }
  }

  Future<bool> _checkCommands(Update update) async {
    var message = update.message;
    if (message == null || message.text == null) return false;
    var cmdParser = BotCommandParser.fromMessage(message);
    if (cmdParser == null) return false;

    var anyExecuted = false;
    for (var commandEntry in _commandCallbacks.entries) {
      var isMatching = cmdParser.matchesCommand(
        commandEntry.key,
        username: username,
      );
      if (!isMatching) continue;
      anyExecuted = true;
      _runProtected(() => commandEntry.value.call(this, update), update);
    }
    return anyExecuted;
  }

  Future _handleUpdate(Update update) async {
    if (await _checkCommands(update)) return;
    for (var callback in _updateCallbacks) {
      _runProtected(() => callback(this, update), update);
    }
  }

  Future _loopBody() async {
    try {
      var updates = await getUpdates(
        timeout: _timeout,
        offset: _offset,
        allowedUpdates: allowedUpdates,
      );
      if (updates.isEmpty) return;

      _offset = updates.last.updateId + 1;

      for (var update in updates) {
        _runProtected(() => _handleUpdate(update), update);
      }
    } catch (e, s) {
      if (e is ClientException) {
        // Delay to avoid spam
        await Future.delayed(Duration(seconds: 1));
      }
      await _onConnectionError(this, e, s);
    }
  }

  Future _eventLoop() async {
    _isRunning = true;
    while (_isRunning) {
      await _loopBody();
    }
  }
}
