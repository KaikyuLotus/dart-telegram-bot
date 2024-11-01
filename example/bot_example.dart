import 'dart:async';
import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:logging/logging.dart';

void main(List<String> arguments) async {
  Logger.root.level = Level.FINE; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print(
      '[${record.level.name}] ${record.time}: ${record.message}',
    );
    if (record.error != null) {
      print(record.error);
    }
    if (record.stackTrace != null) {
      print(record.stackTrace);
    }
  });

  var token = Platform.environment['BOT_TOKEN']!;

  Bot(
    token: token,
    onReady: onReady,
    onStartFailed: onStartFailed,
    allowedUpdates: UpdateType.allBut([UpdateType.editedMessage]),
  )
    ..errorHandler = defaultErrorHandler
    ..onUpdate(_onUpdate)
    ..onCommand('buttons', (bot, update) async {
      var buttons = [
        [InlineKeyboardButton.callbackData('Button 1', 'btn1')],
        [InlineKeyboardButton.callbackData('Button 2', 'btn2')],
      ];
      await bot.sendMessage(
        ChatID(update.message!.chat.id),
        'Tap a button...',
        replyMarkup: InlineKeyboardMarkup(buttons),
      );
    })
    ..onCommand('chatid', (bot, update) async {
      await bot.sendMessage(
        ChatID(update.message!.chat.id),
        '*Chat ID*: `${update.message!.chat.id}`',
        parseMode: ParseMode.markdown,
      );
    })
    ..onCommand('msgid', (bot, update) async {
      await bot.sendMessage(
        ChatID(update.message!.chat.id),
        '*Message ID*: `${update.message!.messageId}`',
        parseMode: ParseMode.markdown,
      );
    })
    ..onCommand('uid', (bot, update) async {
      await bot.sendMessage(
        ChatID(update.message!.chat.id),
        '*ID*: `${update.message!.from!.id}`',
        parseMode: ParseMode.markdown,
      );
    })
    ..onCommand('quid', (bot, update) async {
      if (update.message!.replyToMessage == null) return;
      await bot.sendMessage(
        ChatID(update.message!.chat.id),
        '*ID*: `${update.message!.replyToMessage!.from!.id}`',
        parseMode: ParseMode.markdown,
      );
    })
    ..onCommand('poll', (bot, update) async {
      await bot.sendPoll(
        ChatID(update.message!.chat.id),
        'Nani desu ka?',
        ['Hai!', 'Ara ara?', '!'].map((t) => InputPollOption(text: t)).toList(),
        replyParameters: ReplyParameters(update.message!.messageId),
        allowsMultipleAnswers: true,
        isAnonymous: true,
        type: 'quiz',
        correctOptionId: 1,
      );
    });
}

Future defaultErrorHandler(_, __, Object e, StackTrace s) async {
  print('Something failed: $e\n$s');
}

void onStartFailed(Bot bot, Object err, StackTrace st) {
  print('Failed to start: $err\n$st');
}

Future onReady(Bot bot) async {
  print('Bot @${bot.username} ready!');
  await bot.start(clean: true);
}

Future _onUpdate(Bot bot, Update update) async {
  if (update.callbackQuery != null) {
    var callbackData = update.callbackQuery!.data;
    return bot.sendMessage(
      ChatID(update.callbackQuery!.message!.chat.id),
      'Tapped: $callbackData',
    );
  }

  if (update.editedMessage != null) {
    return bot.sendMessage(
      ChatID(update.editedMessage!.chat.id),
      'A message has been edited',
    );
  }

  if (update.inlineQuery != null) {
    if (update.inlineQuery!.query.isNotEmpty) {
      var text = DateTime.now().toString();
      return bot.answerInlineQuery(
        update.inlineQuery!.id,
        [
          InlineQueryResultArticle(
            id: '1',
            title: text,
            inputMessageContent: InputTextMessageContent(
              '[$text](https://www.youtube.com'
              '/results?search_query=Zekk+-+TOMOYO)',
              parseMode: ParseMode.markdown,
            ),
          ),
        ],
        cacheTime: 0,
      );
    }
    return;
  }

  // Those will be converted into tests
  if (update.message == null) return;

  var chatId = ChatID(update.message!.chat.id);
  print('$chatId - ${update.message!.messageId}');

  if (update.message!.video != null) {
    var fileId = update.message!.video!.fileId;
    return bot.sendVideo(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Video ID: $fileId',
    );
  }

  if (update.message!.sticker != null) {
    return bot.sendMessage(
      chatId,
      'Sticker ID: ${update.message!.sticker!.fileId}',
    );
  }

  if (update.message!.photo != null) {
    var bigPhotoId = update.message!.photo!.last.fileId;
    var size = '${update.message!.photo!.last.width}'
        'x${update.message!.photo!.last.height}';
    var msg = 'Photo ID: $bigPhotoId\nSize: $size';
    return bot.sendPhoto(
      chatId,
      HttpFile.fromToken(bigPhotoId),
      caption: msg,
    );
  }

  if (update.message!.audio != null) {
    var fileId = update.message!.audio!.fileId;
    return bot.sendAudio(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Audio ID: $fileId',
    );
  }

  if (update.message!.document != null) {
    var fileId = update.message!.document!.fileId;
    return bot.sendDocument(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Document ID: $fileId',
    );
  }

  if (update.message!.voice != null) {
    var fileId = update.message!.voice!.fileId;
    return bot.sendVoice(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Voice ID: $fileId',
    );
  }

  if (update.message!.animation != null) {
    var fileId = update.message!.animation!.fileId;
    return bot.sendAnimation(
      chatId,
      HttpFile.fromToken(fileId),
      caption: 'Animation ID: $fileId',
    );
  }

  if (update.message!.location != null) {
    var location = update.message!.location!;
    var resp = 'Longitude: ${location.longitude}'
        '\nLatitude:${location.latitude}';
    return bot.sendMessage(chatId, resp);
  }

  if (update.message!.contact != null) {
    var contact = update.message!.contact!;
    return bot.sendContact(
      chatId,
      contact.phoneNumber,
      contact.firstName,
    );
  }

  if (update.message!.forwardOrigin != null) {
    var forwardOrigin = update.message!.forwardOrigin!;
    if (forwardOrigin is MessageOriginUser) {
      var resp = 'Forwarded from ${forwardOrigin.senderUser.firstName} '
          '(${forwardOrigin.senderUser.id} / @${forwardOrigin.senderUser.username})';
      return bot.sendMessage(chatId, resp);
    }
  }

  if (update.message!.videoNote != null) {
    var note = update.message!.videoNote!;
    return bot.sendVideoNote(
      chatId,
      HttpFile.fromToken(note.fileId),
    );
  }
}
