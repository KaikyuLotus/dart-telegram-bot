import 'dart:async';

import 'package:http/http.dart';
import 'package:logging/logging.dart';

import '../../../dart_telegram_bot.dart';
import '../../../telegram_entities.dart';
import 'tgapi_methods.dart';

class Bot with TGAPIMethods {
  final int _timeout;

  final _updateCallbacks = <Future Function(Bot, Update)>[];
  final _commandCallbacks = <String, Future Function(Bot, Update)>{};

  final FutureOr Function(Bot)? _onReadyEvent;
  final FutureOr Function(Bot, Object, StackTrace)? _onStartFailedEvent;

  Future Function(Bot, Update, Object, StackTrace)? errorHandler;

  Future Function(Bot, Object, StackTrace)? connectionErrorHandler;

  bool _isRunning = false;
  int _offset = 0;
  int? _id;
  String? _name;
  String? _username;

  var _log = Logger('Bot');

  /// List of alloed updates to be received<br>
  /// Can be changed while the bot is running
  List<UpdateType>? allowedUpdates;

  /// Returns current bot id, may be null if
  /// [onReady] has not been called already
  int? get id => _id;

  /// Returns current bot name, may be null if
  /// [onReady] has not been called already
  String? get name => _name;

  /// Returns current bot username, may be null if
  /// [onReady] has not been called already
  String? get username => _username;

  /// Returns true if the bot is currently getting updates, false otherwise
  bool get isRunning => _isRunning;

  /// Create a new bot with the given [token].
  /// As soon as bot is created, a getMe is called
  /// to validate the given [token].
  ///
  /// If the [token] is valid, [id], [username], [name]
  /// will be not nullable anymore.
  ///
  /// Also, if the [token] is valid, [onReady] gets called.
  /// Otherwise [onStartFailed] gets called instead.
  ///
  /// If [onReady] or [onStartFailed] throws an exception, it is currently only
  /// logged in the logger, make sure to catch exception if something may file
  Bot({
    required String token,
    int timeout = 10,
    FutureOr Function(Bot)? onReady,
    FutureOr Function(Bot, Object, StackTrace)? onStartFailed,
    this.allowedUpdates,
  })  : _onReadyEvent = onReady,
        _timeout = timeout,
        _onStartFailedEvent = onStartFailed {
    this.token = token;
    _setup();
  }

  /// Override this method when extending this class
  ///
  /// Gets called when bot token is validated with a getMe
  ///
  /// When this method is called, [username], [name] and [id] are
  /// guaranteed to be not null
  Future onReady(Bot bot) async {}

  /// Override this method when extending this class
  ///
  /// Gets called when token validation through getMe fails
  Future onStartFailed(Bot bot, Object err, StackTrace st) async {}

  Future _onReady() async {
    _runProtectedSimple(() => onReady(this));
    _runProtectedSimple(() => _onReadyEvent?.call(this));
  }

  Future _onStartFailed(Object err, StackTrace st) async {
    _runProtectedSimple(() => onStartFailed(this, err, st));
    _runProtectedSimple(() => _onStartFailedEvent?.call(this, err, st));
  }

  /// Update bot info, useful if bot info are changed from
  /// BotFather while the bot is running
  Future updateMe() async {
    var user = await getMe();
    _id = user.id;
    _name = user.firstName;
    _username = user.username!;
    _log = Logger(_name!);
  }

  /// Start getting updates, if [clean] is true,
  /// previous updates will be dropped
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
  /// which will be executed when the given command is received
  ///
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
    _log.severe('An exception occurred during an exception handling');
    _log.severe(e, st);
  }

  Future _onConnectionError(Bot bot, Object error, StackTrace st) async {
    _log.severe('Connection error', error, st);
    _runProtectedSimple(() {
      connectionErrorHandler?.call(bot, error, st);
    });
  }

  Future _onError(Bot bot, Update update, Object error, StackTrace st) async {
    _log.severe('Update crashed', error, st);
    _runProtected(
      () => errorHandler?.call(bot, update, error, st),
      update,
      customErrHandler: (b, u, e, s) => _criticalErrorHandler(e, s),
    );
  }

  Future _setup() async {
    try {
      await updateMe();
    } on Exception catch (e, s) {
      await _onStartFailed(e, s);
      closeClient();
      return;
    }
    await _onReady();
  }

  void _runProtectedSimple(Function foo) {
    runZonedGuarded(
      () {
        foo();
      },
      _criticalErrorHandler,
    );
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

  Future _cleanUpdates() => deleteWebhook(dropPendingUpdates: true);

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
    } on ClientException catch (e, s) {
      await _onConnectionError(this, e, s);
      await Future.delayed(Duration(seconds: 1));
    } on Exception catch (e, s) {
      _log.severe('Loop body error', e, s);
    }
  }

  Future _eventLoop() async {
    _isRunning = true;
    while (_isRunning) {
      await _loopBody();
    }
  }
}
