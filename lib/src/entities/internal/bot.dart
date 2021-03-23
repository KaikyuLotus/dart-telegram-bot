import 'dart:async';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/src/entities/internal/tgapi_methods.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

class Bot with TGAPIMethods {
  final List<Future Function(Bot, Update)> _updateCallbacks = [];
  final Map<String, Future Function(Bot, Update)> _commandCallbacks = {};

  final int _timeout;

  bool _isRunning = false;
  int _offset = 0;
  int? _id;
  String? _firstName;
  String? _username;

  var log = Logger('Bot');

  bool get isRunning => _isRunning;

  int get offset => _offset;

  int? get timeout => _timeout;

  int? get id => _id;

  String? get firstName => _firstName;

  String? get username => _username;

  Future Function(Bot, Update, Object, StackTrace)? errorHandler;

  Future Function(Bot, Object, StackTrace)? connectionErrorHandler;

  final FutureOr Function(Bot)? _onReady;

  final FutureOr Function(Bot, Object, StackTrace)? _onStartFailed;

  Bot({
    required String token,
    int timeout = 10,
    FutureOr Function(Bot)? onReady,
    FutureOr Function(Bot, Object, StackTrace)? onStartFailed,
  })  : _onReady = onReady,
        _timeout = timeout,
        _onStartFailed = onStartFailed {
    setup(token);
    _setup();
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
  Future<Bot> start({
    bool clean = false,
    List<UpdateType>? allowedUpdates,
  }) async {
    if (clean) {
      var updates = await getUpdates(timeout: 0, offset: -1);
      if (updates.isNotEmpty) {
        _offset = updates[0].updateId + 1;
      }
    }

    await _eventLoop(allowedUpdates);

    // Clean last read update
    await getUpdates(timeout: 0, offset: _offset);

    // Compatibility
    return this;
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

  /// Stops bot if it's running, only closes the client if not
  void stop() {
    _isRunning = false;
    closeClient();
  }

  Future _onConnectionError(
    Bot bot,
    Object error,
    StackTrace stackTrace,
  ) async {
    var handler = connectionErrorHandler;
    if (handler == null) {
      return log.severe('A connection error occurred', error, stackTrace);
    }
    await handler(bot, error, stackTrace);
  }

  Future _onError(
    Bot bot,
    Update update,
    Object error,
    StackTrace stackTrace,
  ) async {
    var handler = errorHandler;
    if (handler == null) {
      return log.severe('An update crashed', error, stackTrace);
    }
    await handler(bot, update, error, stackTrace);
  }

  Future<bool> _checkCommands(Update update) async {
    var message = update.message;
    if (message == null || message.text == null) return false;
    var cmdParser = BotCommandParser.fromMessage(message);
    if (cmdParser == null) return false;

    var anyExecuted = false;
    for (var command in _commandCallbacks.keys) {
      var isMatching = cmdParser.matchesCommand(command, username: username);
      if (isMatching) {
        try {
          await _commandCallbacks[command]?.call(this, update);
        } catch (e, s) {
          await _onError(this, update, e, s);
        }
        anyExecuted = true;
      }
    }
    return anyExecuted;
  }

  Future _handleUpdate(Update update) async {
    if (await _checkCommands(update)) return;
    for (var callback in _updateCallbacks) {
      try {
        await callback(this, update);
      } catch (e, s) {
        log.severe('Unhandled exception in callback', e, s);
        await _onError(this, update, e, s);
      }
    }
  }

  Future _loopBody() async {
    var updates = await getUpdates(timeout: _timeout, offset: _offset);
    if (updates.isEmpty) return;

    _offset = updates.last.updateId + 1;

    for (var update in updates) {
      runZonedGuarded(
        () {
          _handleUpdate(update);
        },
        (e, s) => _onError(this, update, e, s),
      );
    }
  }

  Future _eventLoop(List<UpdateType>? allowedUpdates) async {
    _isRunning = true;
    while (_isRunning) {
      try {
        await _loopBody();
      } catch (e, s) {
        if (e is ClientException) {
          // Delay to avoid spam
          await Future.delayed(Duration(seconds: 1));
        }
        await _onConnectionError(this, e, s);
      }
    }
  }
}
