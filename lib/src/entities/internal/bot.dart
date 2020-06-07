import 'dart:async';
import 'dart:io';

import '../../../dart_telegram_bot.dart';
import 'tgapi_methods.dart';

class Bot extends TGAPIMethods {
  final List<Future Function(Update)> _updateCallbacks = [];
  final Map<String, Future<dynamic> Function(Update)> _commandCallbacks = {};

  bool _isReady = false;
  bool _isRunning = false;
  bool _isInitialized = false;
  int _offset = 0;
  int _timeout;
  int _id;
  String _first_name;
  String _username;

  bool get isReady => _isReady;

  bool get isRunning => _isRunning;

  bool get isInitialized => _isInitialized;

  int get offset => _offset;

  int get timeout => _timeout;

  int get id => _id;

  String get first_name => _first_name;

  String get username => _username;

  Bot(String token, [int timeout = 10]) : super(token) {
    _timeout = timeout;
  }

  Future<Bot> init() async {
    return getMe().then(_ready).then((v) => this);
  }

  // Internal functions
  void _ready(User user) {
    _id = user.id;
    _first_name = user.firstName;
    _username = user.username;
    _isReady = true;
    _isInitialized = true;
  }

  bool _checkCommands(Update update) {
    var anyExecuted = false;
    if (update.message == null || update.message.text == null) return false;
    for (var command in _commandCallbacks.keys) {
      var commandIntance = BotCommandParser.fromMessage(update.message);
      var isMatching = commandIntance != null && commandIntance.matchesCommand(command, targetBotUsername: username);
      if (!isMatching) continue;
      print('Matched a command');
      _commandCallbacks[command](update).catchError((e, s) => print('Failed to execute command callback: $e\n$s'));
      anyExecuted = true;
    }
    return anyExecuted;
  }

  void _handleUpdate(Update update) {
    if (_checkCommands(update)) return;
    for (var callback in _updateCallbacks) {
      callback(update).catchError((e, s) => print('Unhandled exception in callback: $e\n$s'));
    }
  }

  void _handleUpdates(List<Update> updates) {
    for (var update in updates) {
      _offset = update.updateId + 1;
      _handleUpdate(update);
    }
  }

  Future _cleanUpdates() {
    return getUpdates(timeout: 0, offset: -1).then((updates) {
      if (updates.isNotEmpty) {
        _offset = updates[0].updateId + 1;
      }
    });
  }

  // Public API
  Future<Bot> start([bool clean = false]) async {
    if (!_isInitialized) {
      throw InvalidBotState('You must call Bot.init() first.');
    }

    if (!_isReady) {
      throw InvalidBotState(
          "The bot is not ready, something failed or you're executing code too early.\nUse .ready() callback instead or check .error()");
    }

    if (clean) await _cleanUpdates().catchError((e, s) => print('Cannot clean updates: $e\n$s'));

    _isRunning = true;

    var hadError = false;
    await Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: hadError ? 5000 : 0), () async => hadError = await eventLoop());
      return isRunning;
    });

    return getUpdates(timeout: 0, offset: _offset).then((u) => this);
  }

  Future<bool> eventLoop() async {
    try {
      var updates = await getUpdates(timeout: _timeout, offset: _offset);
      _handleUpdates(updates);
      return false;
    } on SocketException catch (_) {
      print('Socket error');
    } catch (e, s) {
      print('Update crashed: ${e}\n${s}');
      if (e is APIException) {
        _offset = e.errorCode + 1; // Here error code is the last update ID
      }
    }
    return true;
  }

  /// If restartHttpClient is true, then the client will be closed and re-open to allow further request,
  /// cleaning up some data
  void stop([bool restartHttpClient = false]) {
    if (!_isRunning) {
      throw InvalidBotState('Bot is not running, so it cannot be stopped');
    }
    _isRunning = false;
    closeClient(restartHttpClient);
  }

  // Public API events
  Bot onUpdate(Future Function(Update) callback) {
    _updateCallbacks.add(callback);
    return this;
  }

  Bot onCommand(String command, Function(Update) callback) {
    _commandCallbacks[command] = callback;
    return this;
  }
}
