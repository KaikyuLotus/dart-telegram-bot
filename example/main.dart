import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

Future onUpdate(Bot bot, Update update) async {
  if (update.message?.text == 'stop') {
    await bot.sendMessage(ChatID(update.message!.chat.id), 'Stopping...');
    bot.stop();
  }
}

void main() async {
  Future onReady(Bot bot) async {
    print('Bot ${bot.firstName} ready');

    bot.onUpdate(onUpdate);

    await bot.start(clean: true);
  }

  Bot(
    token: Platform.environment['BOT_TOKEN']!,
    onReady: onReady,
    onStartFailed: (bot, e, s) => print('Start failed'),
    allowedUpdates: [UpdateType.MESSAGE],
  );
}
