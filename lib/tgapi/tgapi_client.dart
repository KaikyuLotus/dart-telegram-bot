import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'entities/base_response.dart';
import 'entities/chat_member.dart';
import 'entities/file.dart';
import 'entities/internal/http_file.dart';
import 'entities/message.dart';
import 'entities/poll.dart';
import 'entities/sticker_set.dart';
import 'entities/update.dart';
import 'entities/user.dart';
import 'entities/user_profile_photos.dart';
import 'exceptions/api_exception.dart';
import 'exceptions/unknown_api_method.dart';

class TGAPIClient {
  final String BASE_URL = 'api.telegram.org';

  http.Client client = http.Client();

  // TODO improve this part
  static final _userConverter = (j) => BaseResponse<User>.fromJson(j);
  static final _updateListConverter = (j) => BaseResponse<List<Update>>.fromJson(j);
  static final _messageConverter = (j) => BaseResponse<Message>.fromJson(j);
  static final _boolConverter = (j) => BaseResponse<bool>.fromJson(j);
  static final _intConverter = (j) => BaseResponse<int>.fromJson(j);
  static final _stringConverter = (j) => BaseResponse<String>.fromJson(j);
  static final _userProfilePhotosConverter = (j) => BaseResponse<UserProfilePhotos>.fromJson(j);
  static final _fileConverter = (j) => BaseResponse<File>.fromJson(j);
  static final _chatMemberListConverter = (j) => BaseResponse<List<ChatMember>>.fromJson(j);
  static final _chatMemberConverter = (j) => BaseResponse<ChatMember>.fromJson(j);
  static final _pollConverter = (j) => BaseResponse<Poll>.fromJson(j);
  static final _stickerSetConverter = (j) => BaseResponse<StickerSet>.fromJson(j);

  var methods = {
    'getMe': _userConverter,
    'getUpdates': _updateListConverter,
    'sendMessage': _messageConverter,
    'sendPhoto': _messageConverter,
    'sendAudio': _messageConverter,
    'sendDocument': _messageConverter,
    'sendVideo': _messageConverter,
    'sendAnimation': _messageConverter,
    'sendVoice': _messageConverter,
    'sendVideoNote': _messageConverter,
    'sendMediaGroup': _messageConverter,
    'sendLocation': _messageConverter,
    'editMessageLiveLocation': _messageConverter,
    'stopMessageLiveLocation': _messageConverter,
    'sendVenue': _messageConverter,
    'sendContact': _messageConverter,
    'sendPoll': _messageConverter,
    'sendChatAction': _boolConverter,
    'getUserProfilePhotos': _userProfilePhotosConverter,
    'getFile': _fileConverter,
    'kickChatMember': _boolConverter,
    'unbanChatMember': _boolConverter,
    'restrictChatMember': _boolConverter,
    'promoteChatMember': _boolConverter,
    'setChatAdministratorCustomTitle': _boolConverter,
    'setChatPermissions': _boolConverter,
    'exportChatInviteLink': _stringConverter,
    'setChatPhoto': _boolConverter,
    'deleteChatPhoto': _boolConverter,
    'setChatTitle': _boolConverter,
    'setChatDescription': _boolConverter,
    'pinChatMessage': _boolConverter,
    'unpinChatMessage': _boolConverter,
    'leaveChat': _boolConverter,
    'getChat': _boolConverter,
    'getChatAdministrators': _chatMemberListConverter,
    'getChatMembersCount': _intConverter,
    'getChatMember': _chatMemberConverter,
    'setChatStickerSet': _boolConverter,
    'deleteChatStickerSet': _boolConverter,
    'answerCallbackQuery': _boolConverter,
    'stopPoll': _pollConverter,
    'deleteMessage': _boolConverter,
    'getStickerSet': _stickerSetConverter,
    'uploadStickerFile': _fileConverter,
    'createNewStickerSet': _boolConverter,
    'addStickerToSet': _boolConverter,
    'setStickerPositionInSet': _boolConverter,
    'deleteStickerFromSet': _boolConverter,
    'sendSticker': _messageConverter
  };

  Future<String> _readResponse(http.StreamedResponse response) {
    var completer = Completer<String>();
    var contents = StringBuffer();
    response.stream.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }

  Future<Map<String, dynamic>> execute(String token, String method,
      [Map<String, dynamic> query, Map<String, HttpFile> files]) async {
    var path = '/bot${token}/${method}';
    var uri = Uri.https(BASE_URL, path, query != null ? query.cast() : null);

    http.BaseRequest request;
    if (files != null && files.isNotEmpty) {
      var multipartRequest = http.MultipartRequest('POST', uri);
      for (var entry in files.entries) {
        var stream = http.ByteStream.fromBytes(entry.value.bytes);
        var multipartFile = http.MultipartFile(entry.key, stream, entry.value.bytes.length, filename: entry.value.name);
        multipartRequest.files.add(multipartFile);
        request = multipartRequest;
      }
    } else {
      request = http.Request('GET', uri);
    }

    var response = await request.send().timeout(Duration(seconds: 120));
    var stringResponse = await _readResponse(response);
    // print(stringResp); // debug only
    return json.decode(stringResponse);
  }

  Future<T> apiCall<T>(String token, String method, [Map<String, dynamic> query]) async {
    if (!methods.containsKey(method)) throw UnknownAPIMethod(method);

    var files = <String, HttpFile>{};
    if (query != null) {
      // Maybe improve this part
      // Filter out null values and convert entries to string
      query.removeWhere((k, v) => v == null);
      // Take the tokens from HttpFiles with tokens
      query.updateAll((k, v) => v is HttpFile && v.token != null ? v.token : v);
      // Take the HttpFile away from the query
      query.forEach((k, v) => {if (v is HttpFile) files[k] = v});
      // Then remove them
      query.removeWhere((k, v) => v is HttpFile);
      // Convert all lists to json array
      query.updateAll((k, v) => v is List ? json.encode(v) : v.toString());
    }

    var resp = methods[method](await execute(token, method, query, files));
    if (!resp.ok) throw APIException(resp.description, resp.errorCode);

    return resp.result as T;
  }
}
