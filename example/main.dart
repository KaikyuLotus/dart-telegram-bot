import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class MyBot extends Bot {
  MyBot(String token) : super(token: token);

  Future onBotCommand(Bot bot, Update update) async {
    var args = BotCommandParser.fromMessage(update.message!)!.args;
    if (args.isEmpty) {
      return bot.sendMessage(
        ChatID(update.message!.chat.id),
        'No arguments provided',
      );
    }

    if (args.length < 2) {
      return bot.sendMessage(
        ChatID(update.message!.chat.id),
        'No enough arguments provided',
      );
    }

    // Do stuff with correct arguments provided
  }

  @override
  Future onReady(Bot bot) async {
    print('Bot ${bot.name} ready');
    onCommand('my_command', onBotCommand);
    await start(clean: true);
  }
}

void main() async {
  var token = Platform.environment['BOT_TOKEN']!;

  /// Either extend Bot and override [onReady] and [onStartFailed]
  MyBot(token);

  /// Or initialize your bot and pass [onReady] and
  /// [onStartFailed] as parameters
  Future onUpdate(Bot bot, Update update) async {
    if (update.message?.text == 'stop') {
      await bot.sendMessage(ChatID(update.message!.chat.id), 'Stopping...');
      bot.stop();
    }
  }

  Future onReady(Bot bot) async {
    print('Bot ${bot.name} ready');
    bot.onUpdate(onUpdate);
    await bot.start(clean: true);
  }

  Bot(
    token: token,
    onReady: onReady,
    onStartFailed: (bot, e, s) => print('Start failed'),
    allowedUpdates: UpdateType.allBut([UpdateType.channelPost]),
  );
}
