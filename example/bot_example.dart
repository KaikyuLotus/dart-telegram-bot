import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

void main(List<String> arguments) async {
  var token = Platform.environment['BOT_TOKEN']!;

  var bot = await Bot.fromToken(token);
  print('Bot @${bot.username} ready!');

  bot.onUpdate(_update);

  bot.onCommand('buttons', (bot, update) async {
    var buttons = [
      [InlineKeyboardButton.CallbackData('Button 1', 'btn1')],
      [InlineKeyboardButton.CallbackData('Button 2', 'btn2')]
    ];
    await bot.sendMessage(
      ChatID(update.message!.chat.id),
      'Tap a button...',
      replyMarkup: InlineKeyboardMarkup(buttons),
    );
  });

  bot.onCommand('chatid', (bot, update) async {
    await bot.sendMessage(
      ChatID(update.message!.chat.id),
      '*Chat ID*: `${update.message!.chat.id}`',
      parseMode: ParseMode.MARKDOWN,
    );
  });

  bot.onCommand('msgid', (bot, update) async {
    await bot.sendMessage(
      ChatID(update.message!.chat.id),
      '*Message ID*: `${update.message!.messageId}`',
      parseMode: ParseMode.MARKDOWN,
    );
  });

  bot.onCommand('uid', (bot, update) async {
    await bot.sendMessage(
      ChatID(update.message!.chat.id),
      '*ID*: `${update.message!.from!.id}`',
      parseMode: ParseMode.MARKDOWN,
    );
  });

  bot.onCommand('quid', (bot, update) async {
    if (update.message!.replyToMessage == null) return;
    await bot.sendMessage(
      ChatID(update.message!.chat.id),
      '*ID*: `${update.message!.replyToMessage!.from!.id}`',
      parseMode: ParseMode.MARKDOWN,
    );
  });

  bot.onCommand('poll', (bot, update) async {
    await bot.sendPoll(
      ChatID(update.message!.chat.id),
      'Nani desu ka?',
      ['Hai!', 'Ara ara?', '!'],
      replyToMessageId: update.message!.messageId,
      allowsMultipleAnswers: true,
      isAnonymous: true,
      type: 'quiz',
      correctOptionId: 1,
    );
  });

  await bot.start(
    clean: true,
    allowedUpdates: [UpdateType.MESSAGE],
  );
}

Function defaultErrorHandler = (e, s) => print('something failed: $e\n$s');

// THIS IS JUST A TEST FUNCTION
Future _update(Bot bot, Update update) async {
  if (update.callbackQuery != null) {
    var callbackData = update.callbackQuery!.data;
    await bot.sendMessage(
      ChatID(update.callbackQuery!.message!.chat.id),
      'Tapped: $callbackData',
    );
  }

  if (update.inlineQuery != null) {
    if (update.inlineQuery!.query.isNotEmpty) {
      var text = DateTime.now().toString();
      await bot.answerInlineQuery(
        update.inlineQuery!.id,
        [
          InlineQueryResultArticle(
            id: '1',
            title: text,
            inputMessageContent: InputTextMessageContent(
              '[$text](https://www.youtube.com'
              '/results?search_query=Zekk+-+TOMOYO)',
              parseMode: ParseMode.MARKDOWN,
            ),
          )
        ],
        cacheTime: 0,
      );
    }
    return;
  }

  // Those will be converted into tests
  if (update.message == null) return;
  if (update.editedMessage != null) return; // Ignore edited messages

  var chatId = ChatID(update.message!.chat.id);
  print('$chatId - ${update.message!.messageId}');

  if (update.message!.video != null) {
    var fileId = update.message!.video!.fileId;
    await bot.sendVideo(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Video ID: $fileId',
    );
  }

  if (update.message!.sticker != null) {
    await bot.sendMessage(
      chatId,
      'Sticker ID: ${update.message!.sticker!.fileId}',
    );
  }

  if (update.message!.photo != null) {
    var bigPhotoId = update.message!.photo!.last.fileId;
    var size = '${update.message!.photo!.last.width}'
        'x${update.message!.photo!.last.height}';
    var msg = 'Photo ID: $bigPhotoId\nSize: $size';
    await bot.sendPhoto(
      chatId,
      HttpFile.fromToken(bigPhotoId),
      caption: msg,
    );
  }

  if (update.message!.audio != null) {
    var fileId = update.message!.audio!.fileId;
    await bot.sendAudio(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Audio ID: $fileId',
    );
  }

  if (update.message!.document != null) {
    var fileId = update.message!.document!.fileId;
    await bot.sendDocument(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Document ID: $fileId',
    );
  }

  if (update.message!.voice != null) {
    var fileId = update.message!.voice!.fileId;
    await bot.sendVoice(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Voice ID: $fileId',
    );
  }

  if (update.message!.animation != null) {
    var fileId = update.message!.animation!.fileId;
    await bot.sendAnimation(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Animation ID: $fileId',
    );
  }

  if (update.message!.location != null) {
    var location = update.message!.location!;
    var resp = 'Longitude: ${location.longitude}'
        '\nLatitude:${location.latitude}';
    await bot.sendMessage(chatId, resp);
  }

  if (update.message!.contact != null) {
    var contact = update.message!.contact!;
    await bot.sendContact(
      chatId,
      contact.phoneNumber,
      contact.firstName,
    );
  }

  if (update.message!.forwardFrom != null) {
    var user = update.message!.forwardFrom!;
    var resp = 'Forwarded from ${user.firstName} '
        '(${user.id} / @${user.username})';
    await bot.sendMessage(chatId, resp);
  }

  if (update.message!.videoNote != null) {
    var note = update.message!.videoNote!;
    await bot.sendVideoNote(
      chatId,
      HttpFile.fromToken(note.fileId),
    );
  }
}
