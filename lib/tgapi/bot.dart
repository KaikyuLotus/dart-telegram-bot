import 'dart:async';
import 'dart:io';

import 'package:dart_telegram_bot/tgapi/exceptions/invalid_bot_state_exception.dart';
import 'package:dart_telegram_bot/tgapi/tgapi_methods.dart';

import 'entities/update.dart';
import 'entities/user.dart';

class Bot extends TGAPIMethods {
  final List<Function(Update)> _updateCallbacks = [];

  bool _isReady = false;
  bool _isRunning = false;
  bool _isInitialized = false;

  int _offset = 0;
  int _timeout = 120;

  int id;
  String first_name;
  String username;

  Bot(String token) : super(token);

  Future<Bot> init() async {
    await getMe().then(_ready);
    return this;
  }

  // Internal functions
  void _ready(User user) {
    id = user.id;
    first_name = user.firstName;
    username = user.username;
    _isReady = true;
    _isInitialized = true;
  }

  void _handleUpdate(Update update) async {
    for (var callback in _updateCallbacks) {
      try {
        callback(update);
      } catch (e, s) {
        print('Unhandled exception in callback: $e\n$s');
      }
    }
  }

  void _handleUpdates(List<Update> updates) {
    for (var update in updates) {
      _offset = update.update_id + 1;
      _handleUpdate(update);
    }
  }

  void _cleanUpdates() async {
    var updates = await getUpdates(0, -1);
    if (updates.isNotEmpty) {
      _offset = updates[0].update_id + 1;
    }
  }

  // Public API
  Future<void> start([bool clean = false]) async {
    if (!_isInitialized) {
      throw InvalidBotState('You must call Bot.init() first.');
    }

    if (!_isReady) {
      throw InvalidBotState(
          "The bot is not ready, something failed or you're executing code too early.\nUse .ready() callback instead or check .error()");
    }

    try {
      if (clean) await _cleanUpdates();
    } catch (e, s) {
      print('Cannot clean updates: $e\n$s');
    }

    _isRunning = true;
    while (_isRunning) {
      try {
        await getUpdates(_timeout, _offset).then(_handleUpdates);
      } catch (e, s) {
        print('Something went wrong while getting updates: $e\n$s');
        await sleep(Duration(seconds: 1));
      }
    }
  }

  void stop() {
    if (!_isRunning) {
      throw InvalidBotState('Bot is not running, so it canno be stopped');
    }
    _isRunning = false;
    // TODO do something more?
  }

  // Public API events
  Bot update(Function(Update) callback) {
    _updateCallbacks.add(callback);
    return this;
  }
}
