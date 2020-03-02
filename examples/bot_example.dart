import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';

class ExampleBot extends Bot {
  Function defaultErrorHandler = (e, s) => print('something failed: $e\n$s');

  ExampleBot() : super(Platform.environment['BOT_TOKEN']) {
    onUpdate(_update);

    // Here all tested and testable API methods
    // These will be converted into tests
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

    onCommand(
        'sendAudio',
        (update) async => await sendAudio(update.message.chat.id, HttpFile.fromPath('resources/audio.ogg'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAudioID',
        (update) async => await sendAudio(
            update.message.chat.id, 'CQACAgQAAxkBAAN7Xl14yuEVWXyX_r3AqLcYZcPSjiwAAgYHAALdTPFS8kg5mtTG0ZEYBA',
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendDocument',
            (update) async => await sendDocument(update.message.chat.id, HttpFile.fromPath('resources/test.jpg'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendDocumentID',
            (update) async => await sendDocument(
            update.message.chat.id, 'BQACAgQAAxkBAAOFXl19i1mq3SO-VpfjCQX1HfSLMjAAAgsHAALdTPFS41USB9o9Y3gYBA',
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVideo',
            (update) async => await sendVideo(update.message.chat.id, HttpFile.fromPath('resources/video.mp4'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVideoID',
            (update) async => await sendVideo(
            update.message.chat.id, 'BAACAgQAAxkBAAOUXl2AgwO3z0asO3xyYJF0MjLe-dgAAnoHAALU_eFSEvgAAblxPJewGAQ',
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAnimation',
            (update) async => await sendAnimation(update.message.chat.id, HttpFile.fromPath('resources/idk.idk'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAnimationID',
            (update) async => await sendAnimation(
            update.message.chat.id, '',
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVoice',
            (update) async => await sendVoice(update.message.chat.id, HttpFile.fromPath('resources/audio.ogg'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVoiceID',
            (update) async => await sendVoice(
            update.message.chat.id, 'AwACAgQAAxkBAAOZXl2Clb1_SXygYtyZgLKxv2mCGJgAAhUHAALdTPFSQlA8ZluVk6MYBA',
            replyToMessageId: update.message.messageId));
  }

  // THIS IS JUST A TEST FUNCTION
  void _update(Update update) {
    // Those will be converted into tests

    if (update.editedMessage != null) return; // Ignore edited messages

    var chatId = update.message.chat.id;

    if (update.message.video != null) {
      var fileId = update.message.video.fileId;
      sendVideo(chatId, fileId, caption: 'Video ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.sticker != null) {
      sendMessage(chatId, 'Sticker ID: ${update.message.sticker.fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.photo != null) {
      var bigPhotoId = update.message.photo.last.fileId;
      var size = '${update.message.photo.last.width}x${update.message.photo.last.height}';
      var msg = 'Photo ID: $bigPhotoId\nSize: $size';
      sendPhoto(chatId, bigPhotoId, caption: msg).catchError(defaultErrorHandler);
    }

    if (update.message.audio != null) {
      var fileId = update.message.audio.fileId;
      sendAudio(chatId, fileId, caption: 'Audio ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.document != null) {
      var fileId = update.message.document.fileId;
      sendDocument(chatId, fileId, caption: 'Document ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.voice != null) {
      var fileId = update.message.voice.fileId;
      sendVoice(chatId, fileId, caption: 'Voice ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.animation != null) {
      var fileId = update.message.animation.fileId;
      sendAnimation(chatId, fileId, caption: 'Animation ID: ${fileId}').catchError(defaultErrorHandler);
    }

  }
}

void main(List<String> arguments) {
  ExampleBot()
      .init()
      .then((bot) => {print('Bot @${bot.username} ready!'), bot.start(true)})
      .catchError((e, s) => {print('Cannot start bot: ${e}\n${s}'), exit(1)});
}
