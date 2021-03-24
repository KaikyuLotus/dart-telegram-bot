import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class MyBot extends Bot {
  MyBot(String token) : super(token: token);

  @override
  Future onStartFailed(Bot bot, Object err, StackTrace st) async {
    print('Bot did not start correctly: $err');
  }

  @override
  Future onReady(Bot bot) async {
    print('Bot ${bot.name} ready');
    await start(clean: true);
  }
}

void main() async {
  var token = Platform.environment['BOT_TOKEN']!;

  /// Either extend Bot and override [onReady] and [onStartFailed]
  MyBot(token);

  /// Or initialize your bot and pass [onReady] and [onStartFailed] as parameters
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
    allowedUpdates: [UpdateType.MESSAGE],
  );
}
