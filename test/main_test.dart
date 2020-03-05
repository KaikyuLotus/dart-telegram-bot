import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/chat_id.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/enums/chat_action.dart';
import 'package:dart_telegram_bot/tgapi/enums/parse_mode.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/api_exception.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/invalid_bot_state_exception.dart';
import 'package:test/test.dart';

void main() {
  var chatId = int.parse(Platform.environment['CHAT_ID']);
  var replyId = int.parse(Platform.environment['REPLY_TO_MESSAGE_ID']);
  var photoToken = Platform.environment['PHOTO_TOKEN'];
  var audioToken = Platform.environment['AUDIO_TOKEN'];
  var videoToken = Platform.environment['VIDEO_TOKEN'];
  var animationToken = Platform.environment['ANIMATION_TOKEN'];
  var documentToken = Platform.environment['DOCUMENT_TOKEN'];
  var voiceToken = Platform.environment['VOICE_TOKEN'];

  Future<Bot> getValidBot() async {
    var token = Platform.environment['BOT_TOKEN'];
    var bot = Bot(token);
    await bot.init();
    return bot;
  }

  test('A bot does not start if the token is wrong', () {
    expect(() async => {await Bot('Wrongtoken').init()}, throwsA(TypeMatcher<APIException>()));
  }, skip: false);

  test('Cannot start a not initialized bot', () {
    expect(() async => {await Bot('Wrongtoken').start()}, throwsA(TypeMatcher<InvalidBotState>()));
  }, skip: false);

  test('Cannot stop a non-running bot', () {
    expect(Bot('Wrongtoken').stop, throwsA(TypeMatcher<InvalidBotState>()));
  }, skip: false);

  test('Send message with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendMessage(ChatID(chatId), '*Test*',
        replyToMessageId: replyId,
        disableNotification: true,
        disableWebPagePreview: true,
        parseMode: ParseMode.Markdown());
    expect(message.entities.length, equals(1));
    expect(message.entities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.text, equals('Test'));
  }, skip: false);

  test('Send photo from file with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendPhoto(ChatID(chatId), HttpFile.fromPath('resources/test.jpg'),
        caption: '*Test*', parseMode: ParseMode.Markdown(), replyToMessageId: replyId, disableNotification: true);
    expect(message.captionEntities.length, equals(1));
    expect(message.captionEntities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.photo, isNotNull);
    expect(message.caption, equals('Test'));
  }, skip: false);

  test('Send photo with ID', () async {
    var bot = await getValidBot();
    var message = await bot.sendPhoto(ChatID(chatId), HttpFile.fromToken(photoToken));
    expect(message.photo, isNotNull);
  }, skip: false);

  test('Send audio from file with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendAudio(
      ChatID(chatId),
      HttpFile.fromPath('resources/audio.mp3'),
      caption: '*Test*',
      parseMode: ParseMode.Markdown(),
      duration: 1,
      performer: 'Kai',
      title: 'Nya',
      thumb: HttpFile.fromPath('resources/test.jpg'),
      disableNotification: true,
      replyToMessageId: replyId,
    );
    expect(message.captionEntities.length, equals(1));
    expect(message.captionEntities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.audio, isNotNull);
    expect(message.caption, equals('Test'));
    expect(message.audio.duration, equals(1));
    expect(message.audio.performer, equals('Kai'));
    expect(message.audio.title, equals('Nya'));
  }, skip: false);

  test('Send audio with ID', () async {
    var bot = await getValidBot();
    var message = await bot.sendAudio(ChatID(chatId), HttpFile.fromToken(audioToken));
    expect(message.audio, isNotNull);
  }, skip: false);

  test('Send document from file with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendDocument(
      ChatID(chatId),
      HttpFile.fromPath('resources/test.jpg'),
      thumb: HttpFile.fromPath('resources/test.jpg'),
      caption: '*Test*',
      parseMode: ParseMode.Markdown(),
      disableNotification: true,
      replyToMessageId: replyId,
    );
    expect(message.captionEntities.length, equals(1));
    expect(message.captionEntities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.document, isNotNull);
    expect(message.caption, equals('Test'));
  }, skip: false);

  test('Send document with ID', () async {
    var bot = await getValidBot();
    var message = await bot.sendDocument(ChatID(chatId), HttpFile.fromToken(documentToken));
    expect(message.document, isNotNull);
  }, skip: false);

  test('Send video from file with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendVideo(
      ChatID(chatId),
      HttpFile.fromPath('resources/video.mp4'),
      thumb: HttpFile.fromPath('resources/test.jpg'),
      caption: '*Test*',
      parseMode: ParseMode.Markdown(),
      disableNotification: true,
      replyToMessageId: replyId,
    );
    expect(message.captionEntities.length, equals(1));
    expect(message.captionEntities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.video, isNotNull);
    expect(message.video.fileUniqueId, isNotNull);
    expect(message.caption, equals('Test'));
  }, skip: false);

  test('Send video with ID', () async {
    var bot = await getValidBot();
    var message = await bot.sendVideo(ChatID(chatId), HttpFile.fromToken(videoToken));
    expect(message.video, isNotNull);
  }, skip: false);

  test('Send animation from file with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendAnimation(
      ChatID(chatId),
      HttpFile.fromPath('resources/gif.gif'),
      width: 220,
      height: 126,
      thumb: HttpFile.fromPath('resources/test.jpg'),
      caption: '*Test*',
      parseMode: ParseMode.Markdown(),
      disableNotification: true,
      replyToMessageId: replyId,
    );
    expect(message.captionEntities.length, equals(1));
    expect(message.captionEntities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.animation, isNotNull);
    expect(message.animation.fileUniqueId, isNotNull);
    expect(message.caption, equals('Test'));
    expect(message.animation.width, equals(220));
    expect(message.animation.height, equals(126));
  }, skip: false);

  test('Send animation with ID', () async {
    var bot = await getValidBot();
    var message = await bot.sendAnimation(ChatID(chatId), HttpFile.fromToken(animationToken));
    expect(message.animation, isNotNull);
  }, skip: false);

  test('Send voice from file with all args works', () async {
    var bot = await getValidBot();
    var message = await bot.sendVoice(
      ChatID(chatId),
      HttpFile.fromPath('resources/audio.ogg'),
      caption: '*Test*',
      duration: 1,
      parseMode: ParseMode.Markdown(),
      disableNotification: true,
      replyToMessageId: replyId,
    );
    expect(message.captionEntities.length, equals(1));
    expect(message.captionEntities.first.type, equals('bold'));
    expect(message.chat.id, equals(chatId));
    expect(message.replyToMessage.messageId, equals(replyId));
    expect(message.voice, isNotNull);
    expect(message.voice.fileUniqueId, isNotNull);
    expect(message.caption, equals('Test'));
    expect(message.voice.duration, equals(1));
  }, skip: false);

  test('Send voice with ID', () async {
    var bot = await getValidBot();
    var message = await bot.sendVoice(ChatID(chatId), HttpFile.fromToken(voiceToken));
    expect(message.voice, isNotNull);
  }, skip: false);

  test('Send chat action returns true', () async {
    var bot = await getValidBot();
    var ok = await bot.sendChatAction(ChatID(chatId), ChatAction.TYPING);
    expect(ok, isTrue);
  }, skip: false);

  test('Can delete a sent message', () async {
    var bot = await getValidBot();
    var message = await bot.sendMessage(ChatID(chatId), 'Delete me');
    expect(message.text, equals('Delete me'));
    var ok = await bot.deleteMessage(ChatID(chatId), message.messageId);
    expect(ok, isTrue);
  }, skip: false);

  // TODO more tests to come
}
