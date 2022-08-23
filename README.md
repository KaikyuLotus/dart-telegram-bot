# Dart Telegram Bot [![Dart CI/CD](https://github.com/KaikyuLotus/dart-telegram-bot/actions/workflows/dart-dev.yml/badge.svg)](https://github.com/KaikyuLotus/dart-telegram-bot/actions/workflows/dart-dev.yml)

Dart Telegram Bot is a [Dart](https://dart.dev) wrapper for [Telegram](https://telegram.org/)
bot [API](https://core.telegram.org/bots/api). \
It is compatible with Native, Flutter and JS.

[![Bot API Version](https://img.shields.io/badge/Bot%20API-6.2-blue.svg?style=flat-square)](https://core.telegram.org/bots/api)
[![Dart Version](https://img.shields.io/badge/Dart-2.12.0-blue.svg?style=flat-square)](https://dart.dev)

Using Dart Telegram Bot is straightforward, here's an example echo bot:
```dart
import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

void main() {
  Bot(
    // Insert your bot token here
    token: 'BOT_TOKEN',
    // Once the bot is ready this function will be called
    // You can start the bot here
    onReady: (bot) => bot.start(clean: true),
    // Register a new callback for new updates
  ).onUpdate((bot, update) async {
    // Send a message to the update chat with the received message
    bot.sendMessage(ChatID(update.message!.chat.id), update.message!.text!);
  });
}
```

Bot start may fail when bot token is invalid or with network issues.\
To handle such cases follow the next example:
```dart
void main() {
  Bot(
    token: 'BOT_TOKEN',
    onReady: (bot) => bot.start(clean: true),
    // Handle start failure
    onStartFailed: (bot, e, s) => print('Start failed'),
  );
}
```

Also, you may want to disable or allow only certain update types.\
To do so follow the next example:
```dart
void main() {
  Bot(
    token: 'BOT_TOKEN',
    onReady: (bot) => bot.start(clean: true),
    // Either allow all types but some
    allowedUpdates: UpdateType.allBut([UpdateType.channelPost]),
    // OR allow only a list of types
    allowedUpdates: [UpdateType.message, UpdateType.editedMessage],
  );
}
```

Dart Telegram Bot also supports a more OOP approach.
The following example is still an echo bot, this time with OOP approach: 
```dart
class MyBot extends Bot {

  MyBot() : super(token: 'BOT_TOKEN') {
    onUpdate(updateHandler);
  }

  @override
  Future onReady(Bot bot) => bot.start(clean: true);

  @override
  Future onStartFailed(Bot bot, Object err, StackTrace st) async {
    print('Bot failed to start: $err');
  }

  Future updateHandler(Bot bot, Update update) async {
    bot.sendMessage(ChatID(update.message!.chat.id), update.message!.text!);
  }
}
```
Written by Kaikyu Lotus ([Telegram](https://t.me/Kaikyu))