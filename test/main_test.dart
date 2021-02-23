import 'dart:io' as io;

import 'package:test/test.dart';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

void main() {
  Bot testBot;

  var chatUserId = int.parse(io.Platform.environment['USER_ID']);
  var groupId = int.parse(io.Platform.environment['GROUP_ID']);
  var groupMsgId = int.parse(io.Platform.environment['GROUP_MSG_ID']);
  var chatId = int.parse(io.Platform.environment['CHAT_ID']);
  var replyId = int.parse(io.Platform.environment['REPLY_TO_MESSAGE_ID']);
  var photoToken = io.Platform.environment['PHOTO_TOKEN'];
  var audioToken = io.Platform.environment['AUDIO_TOKEN'];
  var videoToken = io.Platform.environment['VIDEO_TOKEN'];
  var animationToken = io.Platform.environment['ANIMATION_TOKEN'];
  var documentToken = io.Platform.environment['DOCUMENT_TOKEN'];
  var voiceToken = io.Platform.environment['VOICE_TOKEN'];
  var stickerToken = io.Platform.environment['STICKER_TOKEN'];

  Future<Bot> getValidBot() async {
    var token = io.Platform.environment['BOT_TOKEN'];
    var bot = Bot(token);
    await bot.init();
    return bot;
  }

  setUp(() async {
    if (testBot == null) {
      print('Setting up bot...');
      testBot = await getValidBot();
    }
  });

  test(
    'A bot does not start if the token is wrong',
    () {
      expect(
        () async {
          await Bot('Wrong token').init();
        },
        throwsA(TypeMatcher<APIException>()),
      );
    },
    skip: false,
  );

  test(
    'Cannot start a not initialized bot',
    () {
      expect(
        () async {
          await Bot('Wrong token').start();
        },
        throwsA(TypeMatcher<InvalidBotState>()),
      );
    },
    skip: false,
  );

  test(
    'Cannot stop a non-running bot',
    () {
      expect(
        Bot('Wrongtoken').stop,
        throwsA(TypeMatcher<InvalidBotState>()),
      );
    },
    skip: false,
  );

  test(
    'Send message with all args works',
    () async {
      var message = await testBot.sendMessage(
        ChatID(chatId),
        '*Test*',
        replyToMessageId: replyId,
        disableNotification: true,
        disableWebPagePreview: true,
        parseMode: ParseMode.MARKDOWN,
      );
      expect(message.entities.length, equals(1));
      expect(message.entities.first.type, equals('bold'));
      expect(message.chat.id, equals(chatId));
      expect(message.replyToMessage.messageId, equals(replyId));
      expect(message.text, equals('Test'));
    },
    skip: false,
  );

  test(
    'Send photo from file with all args works',
    () async {
      var message = await testBot.sendPhoto(
        ChatID(chatId),
        HttpFile.fromPath('resources/test.jpg'),
        caption: '*Test*',
        parseMode: ParseMode.MARKDOWN,
        replyToMessageId: replyId,
        disableNotification: true,
      );
      expect(message.captionEntities.length, equals(1));
      expect(message.captionEntities.first.type, equals('bold'));
      expect(message.chat.id, equals(chatId));
      expect(message.replyToMessage.messageId, equals(replyId));
      expect(message.photo, isNotNull);
      expect(message.caption, equals('Test'));
    },
    skip: false,
  );

  test(
    'Send photo with ID',
    () async {
      var message = await testBot.sendPhoto(ChatID(chatId), HttpFile.fromToken(photoToken));
      expect(message.photo, isNotNull);
    },
    skip: false,
  );

  test(
    'Send audio from file with all args works',
    () async {
      var message = await testBot.sendAudio(
        ChatID(chatId),
        HttpFile.fromPath('resources/audio.mp3'),
        caption: '*Test*',
        parseMode: ParseMode.MARKDOWN,
        duration: 1,
        performer: 'Kai',
        title: 'Nya',
        // thumb: HttpFile.fromPath('resources/test.jpg'),
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
    },
    skip: false,
  );

  test(
    'Send audio with ID',
    () async {
      var message = await testBot.sendAudio(ChatID(chatId), HttpFile.fromToken(audioToken));
      expect(message.audio, isNotNull);
    },
    skip: false,
  );

  test(
    'Send document from file with all args works',
    () async {
      var message = await testBot.sendDocument(
        ChatID(chatId),
        HttpFile.fromPath('resources/test.jpg'),
        // thumb: HttpFile.fromPath('resources/test.jpg'),
        caption: '*Test*',
        parseMode: ParseMode.MARKDOWN,
        disableNotification: true,
        replyToMessageId: replyId,
      );
      expect(message.captionEntities.length, equals(1));
      expect(message.captionEntities.first.type, equals('bold'));
      expect(message.chat.id, equals(chatId));
      expect(message.replyToMessage.messageId, equals(replyId));
      expect(message.document, isNotNull);
      expect(message.caption, equals('Test'));
    },
    skip: false,
  );

  test(
    'Send document with ID',
    () async {
      var message = await testBot.sendDocument(
        ChatID(chatId),
        HttpFile.fromToken(documentToken),
      );
      expect(message.document, isNotNull);
    },
    skip: false,
  );

  test('Send video from file with all args works', () async {
    var message = await testBot.sendVideo(
      ChatID(chatId),
      HttpFile.fromPath('resources/video.mp4'),
      // thumb: HttpFile.fromPath('resources/test.jpg'),
      caption: '*Test*',
      parseMode: ParseMode.MARKDOWN,
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
  }, skip: true);

  test(
    'Send video with ID',
    () async {
      var message = await testBot.sendVideo(
        ChatID(chatId),
        HttpFile.fromToken(videoToken),
      );
      expect(message.video, isNotNull);
    },
    skip: false,
  );

  test(
    'Send animation from file with all args works',
    () async {
      var message = await testBot.sendAnimation(
        ChatID(chatId),
        HttpFile.fromPath('resources/gif.gif'),
        width: 220,
        height: 126,
        // thumb: HttpFile.fromPath('resources/test.jpg'),
        caption: '*Test*',
        parseMode: ParseMode.MARKDOWN,
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
    },
    skip: false,
  );

  test(
    'Send animation with ID',
    () async {
      var message = await testBot.sendAnimation(
        ChatID(chatId),
        HttpFile.fromToken(animationToken),
      );
      expect(message.animation, isNotNull);
    },
    skip: false,
  );

  test(
    'Send voice from file with all args works',
    () async {
      var message = await testBot.sendVoice(
        ChatID(chatId),
        HttpFile.fromPath('resources/audio.ogg'),
        caption: '*Test*',
        duration: 1,
        parseMode: ParseMode.MARKDOWN,
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
    },
    skip: false,
  );

  test(
    'Send voice with ID',
    () async {
      var message = await testBot.sendVoice(
        ChatID(chatId),
        HttpFile.fromToken(voiceToken),
      );
      expect(message.voice, isNotNull);
    },
    skip: false,
  );

  test(
    'Send chat action returns true',
    () async {
      var ok = await testBot.sendChatAction(
        ChatID(chatId),
        ChatAction.TYPING,
      );
      expect(ok, isTrue);
    },
    skip: false,
  );

  test(
    'Can delete a sent message',
    () async {
      var message = await testBot.sendMessage(ChatID(chatId), 'Delete me');
      expect(message.text, equals('Delete me'));
      var ok = await testBot.deleteMessage(
        ChatID(chatId),
        message.messageId,
      );
      expect(ok, isTrue);
    },
    skip: false,
  );

  test(
    'sendMessage with ReplyMarkup (InlineKeyboardButton) works',
    () async {
      var buttons = [
        [
          InlineKeyboardButton.CallbackData('Button 1', 'btn1'),
          InlineKeyboardButton.CallbackData('Button 2', 'btn2'),
        ],
        [
          InlineKeyboardButton.CallbackData('Button 3', 'btn3'),
          InlineKeyboardButton.CallbackData('Button 4', 'btn4'),
        ]
      ];
      var message = await testBot.sendMessage(
        ChatID(chatId),
        'Buttons!',
        replyMarkup: InlineKeyboardMarkup(buttons),
      );

      expect(message.text, equals('Buttons!'));
      var markup = message.replyMarkup as InlineKeyboardMarkup;
      expect(markup.inlineKeyboard.length, equals(2));
      expect(markup.inlineKeyboard[0][0].text, equals('Button 1'));
      expect(markup.inlineKeyboard[0][0].callback_data, equals('btn1'));
    },
    skip: false,
  );

  test(
    'sendMessage with ReplyMarkup (InlineKeyboardButton) with mixed buttons types works',
    () async {
      var buttons = [
        [
          InlineKeyboardButton.CallbackData('Button 1', 'cbd1'),
          InlineKeyboardButton.URL('URL', 'https://www.google.com/'),
        ],
        [
          InlineKeyboardButton.SwitchInlineQuery('Button 3', 'dart-telegram-bot!'),
          InlineKeyboardButton.SwitchInlineQueryCurrentChat('Button 4', 'dart-telegram-bot in current chat!'),
        ]
      ];
      var message = await testBot.sendMessage(
        ChatID(chatId),
        'Buttons!',
        replyMarkup: InlineKeyboardMarkup(buttons),
      );

      expect(message.text, equals('Buttons!'));
      var markup = message.replyMarkup as InlineKeyboardMarkup;
      expect(markup.inlineKeyboard.length, equals(2));
      expect(markup.inlineKeyboard[0][0].text, equals('Button 1')); // Just check first button text

      expect(markup.inlineKeyboard[0][0].callback_data, equals('cbd1'));
      expect(markup.inlineKeyboard[0][1].url, equals('https://www.google.com/'));
      expect(markup.inlineKeyboard[1][0].switch_inline_query, equals('dart-telegram-bot!'));
      expect(
          markup.inlineKeyboard[1][1].switch_inline_query_current_chat, equals('dart-telegram-bot in current chat!'));
    },
    skip: false,
  );

  test(
    'sendMessage with ReplyMarkup (ReplyKeyboardMarkup) with mixed buttons types works',
    () async {
      var buttons = [
        [
          KeyboardButton.RequestContact('Contact', true),
          KeyboardButton.RequestLocation('Location', true),
        ],
        [
          KeyboardButton.RequestPoll('Poll (Quitz)', KeyboardButtonPollType(type: PollType.QUIZ)),
          KeyboardButton.RequestPoll('Poll (Regular)', KeyboardButtonPollType(type: PollType.REGULAR))
        ]
      ];
      var message = await testBot.sendMessage(
        ChatID(chatId),
        'Buttons!',
        replyMarkup: ReplyKeyboardMarkup(buttons),
      );

      expect(message.text, equals('Buttons!'));
      // Telegram does not send back ReplyKeyboardMarkup?
    },
    skip: false,
  );

  test(
    'sendMessage with ReplyMarkup (ReplyKeyboardRemove) works',
    () async {
      var buttons = [
        [KeyboardButton.RequestLocation('Location', true)]
      ];
      await testBot.sendMessage(
        ChatID(chatId),
        'Keyboard',
        replyMarkup: ReplyKeyboardMarkup(buttons),
      );
      await testBot.sendMessage(
        ChatID(chatId),
        'Remove keyboard',
        replyMarkup: ReplyKeyboardRemove(true),
      );
      // TODO maybe some checks here?
    },
    skip: false,
  );

  test(
    'sendMessage with ReplyMarkup (ForceReply) works',
    () async {
      var buttons = [
        [KeyboardButton.RequestLocation('Location', true)]
      ];
      await testBot.sendMessage(
        ChatID(chatId),
        'Keyboard',
        replyMarkup: ReplyKeyboardMarkup(buttons),
      );
      await testBot.sendMessage(
        ChatID(chatId),
        'Remove',
        replyToMessageId: replyId,
        replyMarkup: ForceReply(true, selective: true),
      );
      // TODO maybe some checks here?
    },
    skip: false,
  );

  test(
    'setChatTitle works',
    () async {
      var ok = await testBot.setChatTitle(
        ChatID(groupId),
        'Test ${DateTime.now().millisecondsSinceEpoch}',
      );
      expect(ok, isTrue);
    },
    skip: false,
  );

  test(
    'getChat works',
    () async {
      var title = 'Test ${DateTime.now().millisecondsSinceEpoch}';
      await testBot.setChatTitle(ChatID(groupId), title);
      var chat = await testBot.getChat(ChatID(groupId));
      expect(chat.title, equals(title));
    },
    skip: false,
  );

  test(
    'setChatDescription works',
    () async {
      var description = 'Test ${DateTime.now().millisecondsSinceEpoch}';
      var ok = await testBot.setChatDescription(ChatID(groupId), description);
      expect(ok, isTrue);
      var chat = await testBot.getChat(ChatID(groupId));
      expect(chat.description, equals(description));
    },
    skip: false,
  );

  test(
    'setChatPhoto works',
    () async {
      var ok = await testBot.setChatPhoto(ChatID(groupId), HttpFile.fromPath('resources/test.jpg'));
      expect(ok, isTrue);
    },
    skip: false,
  );

  test(
    'deleteChatPhoto works',
    () async {
      var ok = await testBot.setChatPhoto(ChatID(groupId), HttpFile.fromPath('resources/test.jpg'));
      expect(ok, isTrue);
      ok = await testBot.deleteChatPhoto(ChatID(groupId));
      expect(ok, isTrue);
    },
    skip: false,
  );

  test(
    'exportChatInviteLink works',
    () async {
      var link = await testBot.exportChatInviteLink(ChatID(groupId));
      expect(link, isNotNull);
      expect(link, isNotEmpty);
    },
    skip: false,
  );

  test(
    'pinChatMessage and unpinChatMessage works',
    () async {
      var ok = await testBot.pinChatMessage(ChatID(groupId), groupMsgId, disableNotification: true);
      expect(ok, isTrue);
      var chat = await testBot.getChat(ChatID(groupId));
      expect(chat.pinnedMessage.messageId, groupMsgId);
      ok = await testBot.unpinChatMessage(ChatID(groupId));
      expect(ok, isTrue);
      chat = await testBot.getChat(ChatID(groupId));
      expect(chat.pinnedMessage, isNull);
    },
    skip: false,
  );

  test(
    'Can promote and demote an user',
    () async {
      var ok = await testBot.promoteChatMember(
        ChatID(groupId),
        chatUserId,
        canChangeInfo: true,
        canDeleteMessages: true,
        canInviteUsers: true,
        canPinMessages: true,
        canPromoteMembers: true,
        canRestrictMembers: true,
      );
      expect(ok, isTrue);
      var user = await testBot.getChatMember(ChatID(groupId), chatUserId);
      expect(user.canChangeInfo, isTrue);
      expect(user.canDeleteMessages, isTrue);
      expect(user.canInviteUsers, isTrue);
      expect(user.canInviteUsers, isTrue);
      expect(user.canPinMessages, isTrue);
      expect(user.canPromoteMembers, isTrue);
      expect(user.canRestrictMembers, isTrue);
      ok = await testBot.promoteChatMember(
        ChatID(groupId),
        chatUserId,
        canChangeInfo: false,
        canDeleteMessages: false,
        canInviteUsers: false,
        canPinMessages: false,
        canPromoteMembers: false,
        canRestrictMembers: false,
      );
      expect(ok, isTrue);
      user = await testBot.getChatMember(ChatID(groupId), chatUserId);
      expect(user.canChangeInfo, isNull);
      expect(user.canDeleteMessages, isNull);
      expect(user.canInviteUsers, isNull);
      expect(user.canInviteUsers, isNull);
      expect(user.canPinMessages, isNull);
      expect(user.canPromoteMembers, isNull);
      expect(user.canRestrictMembers, isNull);
    },
    skip: false,
  );

  test(
    'setChatAdministratorCustomTitle works',
    () async {
      var title = 'u${DateTime.now().millisecondsSinceEpoch}';
      var ok = await testBot.promoteChatMember(ChatID(groupId), chatUserId, canChangeInfo: true);
      expect(ok, isTrue);
      ok = await testBot.setChatAdministratorCustomTitle(ChatID(groupId), chatUserId, title);
      expect(ok, isTrue);
      var user = await testBot.getChatMember(ChatID(groupId), chatUserId);
      expect(user.customTitle, equals(title));
      ok = await testBot.promoteChatMember(ChatID(groupId), chatUserId, canChangeInfo: false);
      expect(ok, isTrue);
    },
    skip: false,
  );

  test(
    'getChatMembersCount works',
    () async {
      var count = await testBot.getChatMembersCount(ChatID(groupId));
      expect(count, greaterThan(1));
    },
    skip: false,
  );

  test('Can download a file', () async {
    var chat = await testBot.getChat(ChatID(chatUserId));
    var file = await testBot.getFile(chat.photo.bigFileId);
    var bytes = await testBot.download(file.filePath);
    io.File('test.jpg').writeAsBytesSync(bytes);
    await testBot.sendPhoto(ChatID(chatId), HttpFile.fromBytes('test.photo', bytes));
    // Nothing should fail
  });

  test(
    'Can send stickers',
    () async {
      var message = await testBot.sendSticker(ChatID(groupId), HttpFile.fromToken(stickerToken));
      expect(message.sticker.fileId, equals(stickerToken));
    },
    skip: false,
  );
}
