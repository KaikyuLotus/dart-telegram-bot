import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';

class TGAPIClient {
  static final log = Logger('TGAPIClient');

  static final BASE_URL = 'api.telegram.org';

  static final _typeFactories = {
    'User': (d) => User.fromJson(d),
    'List<Update>': (d) => Update.listFromJsonArray(d),
    'Message': (d) => Message.fromJson(d),
    'List<Message>': (d) => Message.listFromJsonArray(d),
    'UserProfilePhotos': (d) => UserProfilePhotos.fromJson(d),
    'File': (d) => File.fromJson(d),
    'List<ChatMember>': (d) => ChatMember.listFromJsonArray(d),
    'List<BotCommand>': (d) => BotCommand.listFromJsonArray(d),
    'ChatMember': (d) => ChatMember.fromJson(d),
    'Poll': (d) => Poll.fromJson(d),
    'StickerSet': (d) => StickerSet.fromJson(d),
    'Chat': (d) => Chat.fromJson(d),
  };

  Client? _coreClient;

  Client get _client {
    _coreClient ??= Client();
    return _coreClient!;
  }

  MultipartRequest _buildMultipartRequest(
    Uri uri,
    Map<String, HttpFile> files,
  ) {
    var multipartRequest = MultipartRequest('POST', uri);
    var multipartFiles = files.entries.map(
      (e) => MultipartFile(
        e.key,
        ByteStream.fromBytes(e.value.bytes!),
        e.value.bytes!.length,
        filename: e.value.name,
      ),
    );
    multipartRequest.files.addAll(multipartFiles);
    return multipartRequest;
  }

  BaseRequest _getRequest(Uri uri, Map<String, HttpFile>? files) {
    if (files != null && files.isNotEmpty) {
      return _buildMultipartRequest(uri, files);
    }
    return Request('GET', uri);
  }

  Future<Map<String, dynamic>?> _execute(
    String? token,
    String method, [
    Map<String, dynamic>? query,
    Map<String, HttpFile>? files,
  ]) async {
    var uri = Uri.https(
      BASE_URL,
      '/bot$token/$method',
      query != null ? query.cast() : null,
    );
    var response = await _client
        .send(_getRequest(uri, files))
        .timeout(Duration(seconds: 120));
    var stringResponse = await response.stream.bytesToString();
    return json.decode(stringResponse);
  }

  Future<Uint8List> apiDownload(String? token, String? path) async {
    var uri = Uri.https(BASE_URL, '/file/bot$token/$path');
    var response =
        await _client.send(Request('GET', uri)).timeout(Duration(seconds: 120));
    if (response.statusCode != 200) {
      throw APIException(
        'Error while downloading the file with path /$path',
        response.statusCode,
        {},
        'download',
      );
    }
    return response.stream.toBytes();
  }

  Future<T> apiCall<T>(
    String? token,
    String method, [
    Map<String, dynamic>? query,
  ]) async {
    var files = <String, HttpFile>{};
    if (query != null) {
      query
        ..removeWhere((k, v) => v == null)
        ..updateAll((k, v) => v is HttpFile && v.token != null ? v.token : v)
        ..forEach((k, v) {
          if (v is HttpFile) files[k] = v;
        })
        ..removeWhere((k, v) => v is HttpFile)
        ..updateAll((k, v) {
          if (v is List<UpdateType>) {
            return json.encode(v.map(EnumHelper.encode).toList());
          }
          if (v is List) return json.encode(v);
          if ([ParseMode, PollType, ChatAction, UpdateType]
              .contains(v.runtimeType)) {
            return EnumHelper.encode(v);
          }
          return '$v';
        });
    }

    var jsonResp = await _execute(token, method, query, files);
    if (jsonResp == null) {
      throw Exception(
        'Bot API returned null, or could not convert message to a json object',
      );
    }

    if (!jsonResp['ok']) {
      throw APIException(
        jsonResp['description'] ?? 'No description',
        jsonResp['error_code'] ?? -1,
        query,
        method,
      );
    }

    var result = jsonResp['result'];
    if (result is T) return result;

    try {
      var apiType = T.toString();
      var converter = _typeFactories[apiType];
      if (converter == null) throw Exception('Unknown API type $apiType');
      return converter(result) as T;
    } catch (e, s) {
      log.severe(
        'Could not convert Telegram API response to target entity',
        e,
        s,
      );
      throw APIException(
        'Could not convert Telegram API response to target entity: $e',
        result is List ? result.last['update_id'] ?? -1 : -1,
        query,
        method,
      );
    }
  }

  void close() {
    _client.close();
    _coreClient = null;
  }
}
