import 'dart:async';
import 'dart:convert';

import 'package:dart_telegram_bot/tgapi/exceptions/unsupported_type_exception.dart';
import 'package:http/http.dart';

import 'entities/chat.dart';
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

class TGAPIClient {
  static final String BASE_URL = 'api.telegram.org';

  static final _typeFactories = {
    'User': (j) => User.fromJson(j),
    'List<Update>': (j) => Update.listFromJsonArray(j),
    'Message': (j) => Message.fromJson(j),
    'UserProfilePhotos': (j) => UserProfilePhotos.fromJson(j),
    'File': (j) => File.fromJson(j),
    'List<ChatMember>': (j) => ChatMember.listFromJsonArray,
    'ChatMember': (j) => ChatMember.fromJson(j),
    'Poll': (j) => Poll.fromJson(j),
    'StickerSet': (j) => StickerSet.fromJson(j),
    'Chat': (j) => Chat.fromJson(j)
  };

  Client client = Client();

  MultipartRequest _buildMultipartRequest(Uri uri, Map<String, HttpFile> files) {
    var multipartRequest = MultipartRequest('POST', uri);
    var multipartFiles = files.entries.map(
        (e) => MultipartFile(e.key, ByteStream.fromBytes(e.value.bytes), e.value.bytes.length, filename: e.value.name));
    multipartRequest.files.addAll(multipartFiles);
    return multipartRequest;
  }

  BaseRequest _getRequest(Uri uri, Map<String, HttpFile> files) {
    if (files != null && files.isNotEmpty) {
      return _buildMultipartRequest(uri, files);
    }
    return Request('GET', uri);
  }

  Future<Map<String, dynamic>> _execute(String token, String method,
      [Map<String, dynamic> query, Map<String, HttpFile> files]) async {
    var uri = Uri.https(BASE_URL, '/bot${token}/${method}', query != null ? query.cast() : null);
    var response = await _getRequest(uri, files).send().timeout(Duration(seconds: 120));
    var stringResponse = await response.stream.bytesToString();
    // print(stringResp); // debug only
    return json.decode(stringResponse);
  }

  Future<T> apiCall<T>(String token, String method, [Map<String, dynamic> query]) async {
    var files = <String, HttpFile>{};
    if (query != null) {
      // Maybe improve this part
      query.removeWhere((k, v) => v == null); // Filter out null values and convert entries to string
      query.updateAll((k, v) => v is HttpFile && v.token != null ? v.token : v); // Take the tokens from HttpFiles
      query.forEach((k, v) => {if (v is HttpFile) files[k] = v}); // Take the HttpFile away from the query
      query.removeWhere((k, v) => v is HttpFile); // Then remove them
      query.updateAll((k, v) => v is List ? json.encode(v) : '${v}'); // Convert all lists to json array
    }

    var jsonResp = await _execute(token, method, query, files);
    if (!jsonResp['ok']) {
      throw APIException(jsonResp['description'], jsonResp['error_code']);
    }

    var result = jsonResp['result'];
    if (result is T) {
      return result;
    }

    if (!_typeFactories.containsKey('${T}')) {
      throw UnsupportedTypeException('Type ${T} is not supported yet');
    }

    // print('Mapping type ${T.toString()} with found mapper');
    return _typeFactories[T.toString()](jsonResp['result']);
  }
}
