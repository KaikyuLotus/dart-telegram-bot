import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class ExampleBot extends Bot {
  Function defaultErrorHandler = (e, s) => print('something failed: $e\n$s');

  ExampleBot() : super(Platform.environment['BOT_TOKEN']!) {
    onUpdate(_update);

    onCommand('buttons', (update) async {
      var buttons = [
        [InlineKeyboardButton.CallbackData('Button 1', 'btn1')],
        [InlineKeyboardButton.CallbackData('Button 2', 'btn2')]
      ];
      await sendMessage(
        ChatID(update.message!.chat.id),
        'Tap a button...',
        replyMarkup: InlineKeyboardMarkup(buttons),
      );
    });

    onCommand('chatid', (update) async {
      await sendMessage(
        ChatID(update.message!.chat.id),
        '*Chat ID*: `${update.message!.chat.id}`',
        parseMode: ParseMode.MARKDOWN,
      );
    });

    onCommand('msgid', (update) async {
      await sendMessage(
        ChatID(update.message!.chat.id),
        '*Message ID*: `${update.message!.messageId}`',
        parseMode: ParseMode.MARKDOWN,
      );
    });

    onCommand('uid', (update) async {
      await sendMessage(
        ChatID(update.message!.chat.id),
        '*ID*: `${update.message!.from!.id}`',
        parseMode: ParseMode.MARKDOWN,
      );
    });

    onCommand('quid', (update) async {
      if (update.message!.replyToMessage == null) return;
      await sendMessage(
        ChatID(update.message!.chat.id),
        '*ID*: `${update.message!.replyToMessage!.from!.id}`',
        parseMode: ParseMode.MARKDOWN,
      );
    });

    onCommand(
      'poll',
      (update) async => await sendPoll(
        ChatID(update.message!.chat.id),
        'Nani desu ka?',
        ['Hai!', 'Ara ara?', '!'],
        replyToMessageId: update.message!.messageId,
        allowsMultipleAnswers: true,
        isAnonymous: true,
        type: 'quiz',
        correctOptionId: 1,
      ),
    );
  }

  // THIS IS JUST A TEST FUNCTION
  Future _update(Update update) async {
    if (update.callbackQuery != null) {
      var callbackData = update.callbackQuery!.data;
      await sendMessage(ChatID(update.callbackQuery!.message!.chat.id),
          'Tapped: $callbackData');
    }

    if (update.inlineQuery != null) {
      if (update.inlineQuery!.query.isNotEmpty) {
        var text = DateTime.now().toString();
        await answerInlineQuery(
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
      await sendVideo(
        chatId,
        HttpFile.fromToken(fileId),
        caption: 'Video ID: $fileId',
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.sticker != null) {
      await sendMessage(
        chatId,
        'Sticker ID: ${update.message!.sticker!.fileId}',
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.photo != null) {
      var bigPhotoId = update.message!.photo!.last.fileId;
      var size = '${update.message!.photo!.last.width}'
          'x${update.message!.photo!.last.height}';
      var msg = 'Photo ID: $bigPhotoId\nSize: $size';
      await sendPhoto(
        chatId,
        HttpFile.fromToken(bigPhotoId),
        caption: msg,
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.audio != null) {
      var fileId = update.message!.audio!.fileId;
      await sendAudio(
        chatId,
        HttpFile.fromToken(fileId),
        caption: 'Audio ID: $fileId',
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.document != null) {
      var fileId = update.message!.document!.fileId;
      await sendDocument(
        chatId,
        HttpFile.fromToken(fileId),
        caption: 'Document ID: $fileId',
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.voice != null) {
      var fileId = update.message!.voice!.fileId;
      await sendVoice(
        chatId,
        HttpFile.fromToken(fileId),
        caption: 'Voice ID: $fileId',
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.animation != null) {
      var fileId = update.message!.animation!.fileId;
      await sendAnimation(
        chatId,
        HttpFile.fromToken(fileId),
        caption: 'Animation ID: $fileId',
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.location != null) {
      var location = update.message!.location!;
      var resp = 'Longitude: ${location.longitude}'
          '\nLatitude:${location.latitude}';
      await sendMessage(chatId, resp).catchError(defaultErrorHandler);
    }

    if (update.message!.contact != null) {
      var contact = update.message!.contact!;
      await sendContact(
        chatId,
        contact.phoneNumber,
        contact.firstName,
      ).catchError(defaultErrorHandler);
    }

    if (update.message!.forwardFrom != null) {
      var user = update.message!.forwardFrom!;
      var resp = 'Forwarded from ${user.firstName} '
          '(${user.id} / @${user.username})';
      await sendMessage(chatId, resp).catchError(defaultErrorHandler);
    }

    if (update.message!.videoNote != null) {
      var note = update.message!.videoNote!;
      await sendVideoNote(
        chatId,
        HttpFile.fromToken(note.fileId),
      ).catchError(defaultErrorHandler);
    }
  }
}

void main(List<String> arguments) {
  ExampleBot().init().then((bot) {
    print('Bot @${bot.username} ready!');
    bot.start(true);
  }).catchError((e, s) {
    print('Cannot start bot: $e\n$s');
    exit(1);
  });
}
