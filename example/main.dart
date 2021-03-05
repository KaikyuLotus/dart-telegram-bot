import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

void main() async {
  var token = Platform.environment['BOT_TOKEN']!;
  var bot = await Bot(token).init();

  Future onUpdate(Update update) async {
    if (update.message?.text == 'stop') {
      await bot.sendMessage(ChatID(update.message!.chat.id), 'Stopping...');
      bot.stop(true);
    }
  }

  bot.onUpdate(onUpdate);

  await bot.start(true);
}
