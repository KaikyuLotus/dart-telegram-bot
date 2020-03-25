import 'dart:async';
import 'dart:io';

import 'entities/update.dart';
import 'entities/user.dart';
import 'exceptions/invalid_bot_state_exception.dart';
import 'tgapi_methods.dart';

class Bot extends TGAPIMethods {
  final List<Future Function(Update)> _updateCallbacks = [];
  final Map<String, Function(Update)> _commandCallbacks = {};

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
    await getMe().then(_ready);
    return this;
  }

  // Internal functions
  void _ready(User user) {
    _id = user.id;
    _first_name = user.firstName;
    _username = user.username;
    _isReady = true;
    _isInitialized = true;
  }

  // TODO move some functions to an utility class
  bool _isCommand(String command, String text) {
    return RegExp('^(/)($command)( .+)?\$').hasMatch(text);
  }

  void _execCommandCallback(Update update, Function(Update) callback) {
    try {
      callback(update);
    } catch (e, s) {
      print('Failed to execute command callback: $e\n$s');
    }
  }

  void _handleUpdate(Update update) async {
    if (update.message != null && update.message.text != null) {
      _commandCallbacks.forEach((k, v) => {if (_isCommand(k, update.message.text)) _execCommandCallback(update, v)});
    }
    for (var callback in _updateCallbacks) {
      try {
        await callback(update);
      } catch (e, s) {
        print('Unhandled exception in callback: $e\n$s');
      }
    }
  }

  void _handleUpdates(List<Update> updates) async {
    for (var update in updates) {
      _offset = update.updateId + 1;
      await _handleUpdate(update);
    }
  }

  Future _cleanUpdates() async {
    var updates = await getUpdates(timeout: 0, offset: -1);
    if (updates.isNotEmpty) {
      _offset = updates[0].updateId + 1;
    }
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

    var sleepTime = 0;
    await Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: sleepTime), () async {
        sleepTime = 0;
        try {
          var updates = await getUpdates(timeout: _timeout, offset: _offset);
          await _handleUpdates(updates);
        } on SocketException catch (_) {
          print('Socket error');
          sleepTime = 5000; // Sleep more on socket error
        } catch (e, s) {
          print('Update crashed: ${e}\n${s}');
        }
        if (!_isRunning) {
          await getUpdates(timeout: 0, offset: _offset);
        }

      });
      return isRunning;
    });
    return this;
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
