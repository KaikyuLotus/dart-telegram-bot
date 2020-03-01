import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/message.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';

class ExampleBot extends Bot {
  ExampleBot() : super(Platform.environment['BOT_TOKEN']) {
    init().then((bot) => print('Bot @${username} ready!'));
    update(_update);
  }

  Function defaultErrorHandler = (e, s) => print('something failed: $e\n$s');

  void _update(Update update) {
    Message message;

    if (update.message != null) {
      print(
          'Received new message from ${update.message.from.username}: ${update.message.text}');
      message = update.message;
    } else if (update.editedMessage != null) {
      print(
          'Received new edited message from ${update.editedMessage.from.username}: ${update.editedMessage.text}');
      message = update.editedMessage;
    }

    if (message.text != null) {
      if (message.text.startsWith('/snd')) {
        sendMessage(message.chat.id, 'Hello?').catchError(defaultErrorHandler);
      }
    } else if (message.sticker != null) {
      var stkid = message.sticker.fileId;
      sendMessage(message.chat.id, 'ID: $stkid')
          .catchError(defaultErrorHandler);
    } else if (message.photo != null) {
      var bigPhotoId = message.photo.last.fileId;
      var size = '${message.photo.last.width}x${message.photo.last.height}';
      var msg = 'ID: $bigPhotoId\nSize: $size';
      sendMessage(message.chat.id, msg).catchError(defaultErrorHandler);
    }
  }
}

void main(List<String> arguments) {
  ExampleBot()
      .init()
      .then((bot) => bot.start(true))
      .catchError((e) => {print('Cannot start bot: ${e}'), exit(1)});
}
