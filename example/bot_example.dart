import 'dart:io';

import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/entities/inline/inline_query_result_article.dart';
import 'package:dart_telegram_bot/tgapi/entities/inline_keyboard_button.dart';
import 'package:dart_telegram_bot/tgapi/entities/inline_keyboard_markup.dart';
import 'package:dart_telegram_bot/tgapi/entities/input_text_message_content.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/chat_id.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';
import 'package:dart_telegram_bot/tgapi/enums/parse_mode.dart';

class ExampleBot extends Bot {
  Function defaultErrorHandler = (e, s) => print('something failed: $e\n$s');

  ExampleBot() : super(Platform.environment['BOT_TOKEN']) {
    onUpdate(_update);

    onCommand('buttons', (update) async {
      var buttons = [
        [InlineKeyboardButton.CallbackData('Button 1', 'btn1')],
        [InlineKeyboardButton.CallbackData('Button 2', 'btn2')]
      ];
      var ok = await sendMessage(ChatID(update.message.chat.id), 'Tap a button...',
          replyMarkup: InlineKeyboardMarkup(buttons));
    });

    onCommand('chatid', (update) async {
      await sendMessage(ChatID(update.message.chat.id), '*Chat ID*: `${update.message.chat.id}`',
          parseMode: ParseMode.Markdown());
    });

    onCommand('msgid', (update) async {
      await sendMessage(ChatID(update.message.chat.id), '*Message ID*: `${update.message.messageId}`',
          parseMode: ParseMode.Markdown());
    });

    onCommand('uid', (update) async {
      await sendMessage(ChatID(update.message.chat.id), '*ID*: `${update.message.from.id}`',
          parseMode: ParseMode.Markdown());
    });

    onCommand('quid', (update) async {
      if (update.message.replyToMessage == null) return;
      await sendMessage(ChatID(update.message.chat.id), '*ID*: `${update.message.replyToMessage.from.id}`',
          parseMode: ParseMode.Markdown());
    });

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
  Future _update(Update update) async {
    if (update.callbackQuery != null) {
      var callbackData = update.callbackQuery.data;
      await sendMessage(ChatID(update.callbackQuery.message.chat.id), 'Tapped: ${callbackData}');
    }

    if (update.inlineQuery != null) {
      if (update.inlineQuery.query.isNotEmpty) {
        var text = DateTime.now().toString();
        await answerInlineQuery(
            update.inlineQuery.id, [InlineQueryResultArticle('1', text, InputTextMessageContent('[${text}](https://www.youtube.com/results?search_query=Zekk+-+TOMOYO)', parseMode: 'Markdown'))], cacheTime: 0);
      }
      return;
    }

    // Those will be converted into tests
    if (update.message == null) return;
    if (update.editedMessage != null) return; // Ignore edited messages

    var chatId = ChatID(update.message.chat.id);
    print('${chatId} - ${update.message.messageId}');

    if (update.message.video != null) {
      var fileId = update.message.video.fileId;
      await sendVideo(chatId, HttpFile.fromPath(fileId), caption: 'Video ID: ${fileId}')
          .catchError(defaultErrorHandler);
    }

    if (update.message.sticker != null) {
      await sendMessage(chatId, 'Sticker ID: ${update.message.sticker.fileId}').catchError(defaultErrorHandler);
    }

    if (update.message.photo != null) {
      var bigPhotoId = update.message.photo.last.fileId;
      var size = '${update.message.photo.last.width}x${update.message.photo.last.height}';
      var msg = 'Photo ID: $bigPhotoId\nSize: $size';
      await sendPhoto(chatId, HttpFile.fromToken(bigPhotoId), caption: msg).catchError(defaultErrorHandler);
    }

    if (update.message.audio != null) {
      var fileId = update.message.audio.fileId;
      await sendAudio(chatId, HttpFile.fromPath(fileId), caption: 'Audio ID: ${fileId}')
          .catchError(defaultErrorHandler);
    }

    if (update.message.document != null) {
      var fileId = update.message.document.fileId;
      await sendDocument(chatId, HttpFile.fromToken(fileId), caption: 'Document ID: ${fileId}')
          .catchError(defaultErrorHandler);
    }

    if (update.message.voice != null) {
      var fileId = update.message.voice.fileId;
      await sendVoice(chatId, HttpFile.fromPath(fileId), caption: 'Voice ID: ${fileId}')
          .catchError(defaultErrorHandler);
    }

    if (update.message.animation != null) {
      var fileId = update.message.animation.fileId;
      await sendAnimation(chatId, HttpFile.fromPath(fileId), caption: 'Animation ID: ${fileId}')
          .catchError(defaultErrorHandler);
    }

    if (update.message.location != null) {
      var location = update.message.location;
      var resp = 'Longitude: ${location.longitude}\nLatitude:${location.latitude}';
      await sendMessage(chatId, resp).catchError(defaultErrorHandler);
    }

    if (update.message.contact != null) {
      var contact = update.message.contact;
      await sendContact(chatId, contact.phoneNumber, contact.firstName).catchError(defaultErrorHandler);
    }

    if (update.message.forwardFrom != null) {
      var user = update.message.forwardFrom;
      var resp = 'Forwarded from ${user.firstName} (${user.id} / @${user.username})';
      await sendMessage(chatId, resp).catchError(defaultErrorHandler);
    }

    if (update.message.videoNote != null) {
      var note = update.message.videoNote;
      await sendVideoNote(chatId, HttpFile.fromPath(note.fileId)).catchError(defaultErrorHandler);
    }
  }
}

void main(List<String> arguments) {
  ExampleBot()
      .init()
      .then((bot) => {print('Bot @${bot.username} ready!'), bot.start(true)})
      .catchError((e, s) => {print('Cannot start bot: ${e}\n${s}'), exit(1)});
}
