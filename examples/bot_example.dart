import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/chat_id.dart';
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
              await sendPhoto(ChatID(update.message.chat.id), HttpFile.fromPath('resources/test.jpg'),
                  replyToMessageId: update.message.messageId)
            });

    onCommand(
        'sendPhotoID',
        (update) async => await sendPhoto(
            ChatID(update.message.chat.id),
            HttpFile.fromToken(
                'AgACAgQAAxkBAANcXlwny-lsbPGFU415fFoQcc8i2fkAAtWxMRvdTOFS8UED4N8te2T3M7YbAAQBAAMCAANtAAPy2AMAARgE'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendMessage',
        (update) async =>
            await sendMessage(ChatID(update.message.chat.id), 'Hello?', replyToMessageId: update.message.messageId));

    onCommand(
        'sendSticker',
        (update) async => {
              await sendSticker(ChatID(update.message.chat.id), HttpFile.fromPath('resources/sticker.webp'),
                  replyToMessageId: update.message.messageId)
            });

    onCommand(
        'sendStickerID',
        (update) async => await sendSticker(
            ChatID(update.message.chat.id), HttpFile.fromToken('CAACAgUAAxkBAANhXlwpFbzobNWpVLXFqk7lRmFfRzsAApwEAAL4xsUKytdXbzXByeYYBA'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAudio',
        (update) async => await sendAudio(ChatID(update.message.chat.id), HttpFile.fromPath('resources/audio.ogg'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAudioID',
        (update) async => await sendAudio(
            ChatID(update.message.chat.id), HttpFile.fromToken('CQACAgQAAxkBAAN7Xl14yuEVWXyX_r3AqLcYZcPSjiwAAgYHAALdTPFS8kg5mtTG0ZEYBA'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendDocument',
        (update) async => await sendDocument(ChatID(update.message.chat.id), HttpFile.fromPath('resources/test.jpg'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendDocumentID',
        (update) async => await sendDocument(ChatID(update.message.chat.id),
            HttpFile.fromToken('BQACAgQAAxkBAAOFXl19i1mq3SO-VpfjCQX1HfSLMjAAAgsHAALdTPFS41USB9o9Y3gYBA'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVideo',
        (update) async => await sendVideo(ChatID(update.message.chat.id), HttpFile.fromPath('resources/video.mp4'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVideoID',
        (update) async => await sendVideo(
            ChatID(update.message.chat.id), HttpFile.fromToken('BAACAgQAAxkBAAOUXl2AgwO3z0asO3xyYJF0MjLe-dgAAnoHAALU_eFSEvgAAblxPJewGAQ'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAnimation',
        (update) async => await sendAnimation(ChatID(update.message.chat.id), HttpFile.fromPath('resources/idk.idk'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendAnimationID',
        (update) async =>
            await sendAnimation(ChatID(update.message.chat.id), HttpFile.fromToken(''), replyToMessageId: update.message.messageId));

    onCommand(
        'sendVoice',
        (update) async => await sendVoice(ChatID(update.message.chat.id), HttpFile.fromPath('resources/audio.ogg'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'sendVoiceID',
        (update) async => await sendVoice(
            ChatID(update.message.chat.id), HttpFile.fromToken('AwACAgQAAxkBAAOZXl2Clb1_SXygYtyZgLKxv2mCGJgAAhUHAALdTPFSQlA8ZluVk6MYBA'),
            replyToMessageId: update.message.messageId));

    onCommand(
        'poll',
        (update) async => await sendPoll(ChatID(update.message.chat.id), 'Nani desu ka?', ['Hai!', 'Ara ara?', '!'],
            replyToMessageId: update.message.messageId,
            allowsMultipleAnswers: true,
            isAnonymous: true,
            type: 'quiz',
            correctOptionId: 1));
  }

  // THIS IS JUST A TEST FUNCTION
  void _update(Update update) {
    // Those will be converted into tests
    if (update.message == null) return;
    if (update.editedMessage != null) return; // Ignore edited messages

    var chatId = ChatID(update.message.chat.id);
    print('${chatId} - ${update.message.messageId}');

    if (update.message.video != null) {
      var fileId = update.message.video.fileId;
      sendVideo(chatId, HttpFile.fromPath(fileId), caption: 'Video ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.sticker != null) {
      sendMessage(chatId, 'Sticker ID: ${update.message.sticker.fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.photo != null) {
      var bigPhotoId = update.message.photo.last.fileId;
      var size = '${update.message.photo.last.width}x${update.message.photo.last.height}';
      var msg = 'Photo ID: $bigPhotoId\nSize: $size';
      sendPhoto(chatId, HttpFile.fromToken(bigPhotoId), caption: msg).catchError(defaultErrorHandler);
    }

    if (update.message.audio != null) {
      var fileId = update.message.audio.fileId;
      sendAudio(chatId, HttpFile.fromPath(fileId), caption: 'Audio ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.document != null) {
      var fileId = update.message.document.fileId;
      sendDocument(chatId, HttpFile.fromToken(fileId), caption: 'Document ID: ${fileId}')
          .catchError(defaultErrorHandler);
    }

    if (update.message.voice != null) {
      var fileId = update.message.voice.fileId;
      sendVoice(chatId, HttpFile.fromPath(fileId), caption: 'Voice ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.animation != null) {
      var fileId = update.message.animation.fileId;
      sendAnimation(chatId, HttpFile.fromPath(fileId), caption: 'Animation ID: ${fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.location != null) {
      var location = update.message.location;
      var resp = 'Longitude: ${location.longitude}\nLatitude:${location.latitude}';
      sendMessage(chatId, resp).catchError(defaultErrorHandler);
    }

    if (update.message.contact != null) {
      var contact = update.message.contact;
      sendContact(chatId, contact.phoneNumber, contact.firstName).catchError(defaultErrorHandler);
    }

    if (update.message.forwardFrom != null) {
      var user = update.message.forwardFrom;
      var resp = 'Forwarded from ${user.firstName} (${user.id} / @${user.username})';
      sendMessage(chatId, resp).catchError(defaultErrorHandler);
    }

    if (update.message.videoNote != null) {
      var note = update.message.videoNote;
      sendVideoNote(chatId, HttpFile.fromPath(note.fileId)).catchError(defaultErrorHandler);
    }
  }
}

void main(List<String> arguments) {
  ExampleBot()
      .init()
      .then((bot) => {print('Bot @${bot.username} ready!'), bot.start(true)})
      .catchError((e, s) => {print('Cannot start bot: ${e}\n${s}'), exit(1)});
}
