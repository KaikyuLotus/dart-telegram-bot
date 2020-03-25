import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/chat_id.dart';

class SimpleBot extends Bot {
  SimpleBot() : super(Platform.environment['BOT_TOKEN']);
}

void main() {
  SimpleBot().init().then((bot) async {
    ChatID stopFrom;
    bot.onUpdate((u) async {
      if (u.message.text == 'stop') {
        stopFrom = ChatID(u.message.chat.id);
        await bot.sendMessage(ChatID(u.message.chat.id), 'Stopping...');
        bot.stop(true);
      }
    });
    await bot.start(true).then((bot) async {
      await bot.sendMessage(stopFrom, 'Stopped');
      exit(0);
    });
  }).catchError((e,s) {
    print('${e}\n${s}');
    exit(1);
  });
}
