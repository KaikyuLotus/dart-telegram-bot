import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';

class ExampleBot extends Bot {
  Function defaultErrorHandler = (e, s) => print('something failed: $e\n$s');

  ExampleBot() : super(Platform.environment['BOT_TOKEN']) {
    onUpdate(_update);

    // Here all tested and testable API methods
    onCommand(
        'sendPhoto',
        (update) async => {
              await sendPhoto(update.message.chat.id, HttpFile.fromPath('resources/test.jpg'),
                  replyToMessageId: update.message.messageId)
            });

    onCommand(
        'sendPhotoID',
        (update) async => await sendPhoto(update.message.chat.id,
            'AgACAgQAAxkBAANcXlwny-lsbPGFU415fFoQcc8i2fkAAtWxMRvdTOFS8UED4N8te2T3M7YbAAQBAAMCAANtAAPy2AMAARgE',
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendMessage',
        (update) async =>
            await sendMessage(update.message.chat.id, 'Hello?', replyToMessageId: update.message.messageId));

    onCommand(
        'sendSticker',
        (update) async => {
              await sendSticker(update.message.chat.id, HttpFile.fromPath('resources/sticker.webp'),
                  replyToMessageId: update.message.messageId)
            });

    onCommand(
        'sendStickerID',
        (update) async => await sendSticker(
            update.message.chat.id, 'CAACAgUAAxkBAANhXlwpFbzobNWpVLXFqk7lRmFfRzsAApwEAAL4xsUKytdXbzXByeYYBA',
            replyToMessageId: update.message.messageId));
  }

  // THIS IS JUST A TEST FUNCTION
  void _update(Update update) {
    if (update.editedMessage != null) return; // Ignore edited messages
    if (update.message.sticker != null) {
      var stkid = update.message.sticker.fileId;
      sendMessage(update.message.chat.id, 'ID: $stkid').catchError(defaultErrorHandler);
    } else if (update.message.photo != null) {
      var bigPhotoId = update.message.photo.last.fileId;
      var size = '${update.message.photo.last.width}x${update.message.photo.last.height}';
      var msg = 'ID: $bigPhotoId\nSize: $size';
      sendPhoto(update.message.chat.id, bigPhotoId, caption: msg).catchError(defaultErrorHandler);
    }
  }
}

void main(List<String> arguments) {
  ExampleBot()
      .init()
      .then((bot) => {print('Bot @${bot.username} ready!'), bot.start(true)})
      .catchError((e, s) => {print('Cannot start bot: ${e}\n${s}'), exit(1)});
}
