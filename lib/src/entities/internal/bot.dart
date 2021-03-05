import 'dart:async';
import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/src/entities/internal/tgapi_methods.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:logging/logging.dart';

class Bot extends TGAPIMethods {
  final log = Logger('Bot');

  final List<Future Function(Update)> _updateCallbacks = [];
  final Map<String, Future<dynamic> Function(Update)> _commandCallbacks = {};

  final int _timeout;

  bool _isReady = false;
  bool _isRunning = false;
  bool _isInitialized = false;
  int _offset = 0;

  int _id = 0;
  String _first_name = '';
  String _username = '';

  bool get isReady => _isReady;

  bool get isRunning => _isRunning;

  bool get isInitialized => _isInitialized;

  int get offset => _offset;

  int? get timeout => _timeout;

  int? get id => _id;

  String? get first_name => _first_name;

  String? get username => _username;

  Bot(String token, [this._timeout = 10]) : super(token);

  Future<Bot> init() async {
    var user = await getMe();
    _ready(user);
    return this;
  }

  void _ready(User user) {
    _id = user.id;
    _first_name = user.firstName;
    _username = user.username!;
    _isReady = true;
    _isInitialized = true;
  }

  bool _checkCommands(Update update) {
    var anyExecuted = false;
    if (update.message == null || update.message!.text == null) return false;
    for (var command in _commandCallbacks.keys) {
      var commandInstance = BotCommandParser.fromMessage(update.message!);
      var isMatching = commandInstance != null &&
          commandInstance.matchesCommand(command, targetBotUsername: username);
      if (!isMatching) continue;
      _commandCallbacks[command]!(update).catchError((e, s) {
        log.severe('Failed to execute command callback', e, s);
      });
      anyExecuted = true;
    }
    return anyExecuted;
  }

  void _handleUpdate(Update update) {
    if (_checkCommands(update)) return;
    for (var callback in _updateCallbacks) {
      callback(update).catchError((e, s) {
        log.severe('Unhandled exception in callback', e, s);
      });
    }
  }

  Future<Bot> start([bool clean = false]) async {
    if (!_isInitialized) {
      throw InvalidBotState('You must call Bot.init() first.');
    }

    if (!_isReady) {
      throw InvalidBotState(
        "The bot is not ready, something failed or you're executing code too early.\n"
        'Use .ready() callback instead or check .error()',
      );
    }

    if (clean) {
      try {
        var updates = await getUpdates(timeout: 0, offset: -1);
        if (updates.isNotEmpty) {
          _offset = updates[0].updateId + 1;
        }
      } catch (e, s) {
        log.severe('Cannot clean updates', e, s);
      }
    }

    _isRunning = true;

    await Future.doWhile(() async {
      await eventLoop();
      return _isRunning;
    });

    return getUpdates(timeout: 0, offset: _offset).then((u) => this);
  }

  Future eventLoop() async {
    try {
      var updates = await getUpdates(timeout: _timeout, offset: _offset);
      for (var update in updates) {
        _offset = update.updateId + 1;
        _handleUpdate(update);
      }
    } on SocketException catch (_) {
      log.severe('Socket error');
    } catch (e, s) {
      log.severe('Update crashed', e, s);
      if (e is APIException) {
        _offset = e.errorCode + 1; // Here error code is the last update ID
      }
    }
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

  void onUpdate(Future Function(Update) callback) {
    _updateCallbacks.add(callback);
  }

  void onCommand(String command, Future Function(Update) callback) {
    _commandCallbacks[command] = callback;
  }
}
