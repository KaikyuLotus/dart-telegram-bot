import 'dart:async';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/src/entities/internal/tgapi_methods.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

class Bot extends TGAPIMethods {
  final log = Logger('Bot');

  final List<Future Function(Bot, Update)> _updateCallbacks = [];
  final Map<String, Future<dynamic> Function(Bot, Update)> _commandCallbacks =
      {};

  final int _timeout;

  bool _isRunning = false;
  int _offset = 0;

  int? _id;
  String? _first_name;
  String? _username;

  bool get isRunning => _isRunning;

  int get offset => _offset;

  int? get timeout => _timeout;

  int? get id => _id;

  String? get first_name => _first_name;

  String? get username => _username;

  Bot._(String token, this._timeout) : super(token);

  static Future<Bot> fromToken(String token, {int timeout = 10}) async {
    var bot = Bot._(token, timeout);
    await bot.updateMe();
    return bot;
  }

  Future updateMe() async {
    var user = await getMe();
    _id = user.id;
    _first_name = user.firstName;
    _username = user.username!;
  }

  Future<bool> _checkCommands(Update update) async {
    var anyExecuted = false;
    if (update.message == null || update.message?.text == null) return false;
    for (var command in _commandCallbacks.keys) {
      var cmdParser = BotCommandParser.fromMessage(update.message!);
      var isMatching = cmdParser?.matchesCommand(
            command,
            targetBotUsername: username,
          ) ??
          false;
      if (!isMatching) continue;
      try {
        await _commandCallbacks[command]?.call(this, update);
      } catch (e, s) {
        log.severe('Failed to execute command callback', e, s);
      }
      anyExecuted = true;
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
      }
    }
  }

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

    _isRunning = true;
    await _eventLoop(allowedUpdates);

    // Clean last read update
    await getUpdates(timeout: 0, offset: _offset);

    // Compatibility
    return this;
  }

  Future _eventLoop(List<UpdateType>? allowedUpdates) async {
    while (_isRunning) {
      try {
        var updates = await getUpdates(timeout: _timeout, offset: _offset);
        for (var update in updates) {
          _offset = update.updateId + 1;
          await _handleUpdate(update);
        }
      } on ClientException catch (e, s) {
        log.severe('Socket error', e, s);
        // Wait for connection to stabilize
        await Future.delayed(Duration(seconds: 1));
      } on APIException catch (e, s) {
        log.severe('API Exception', e, s);
        _offset = e.errorCode + 1; // Here error code is the last update ID
      } catch (e, s) {
        log.severe('Update crashed', e, s);
      }
    }
  }

  /// If restartHttpClient is true, then the client will be closed and re-open
  /// to allow further request,
  /// cleaning up some data
  void stop() {
    if (!_isRunning) {
      throw InvalidBotState('Bot is not running, so it cannot be stopped');
    }
    _isRunning = false;
    closeClient();
  }

  void onUpdate(Future Function(Bot, Update) callback) {
    _updateCallbacks.add(callback);
  }

  void onCommand(String command, Future Function(Bot, Update) callback) {
    _commandCallbacks[command] = callback;
  }
}
