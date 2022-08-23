import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:logging/logging.dart';

import '../../../dart_telegram_bot.dart';
import '../../../telegram_entities.dart';

// ignore: unnecessary_lambdas
/// TGAPIClient
class TGAPIClient {
  /// Logger
  static final log = Logger('TGAPIClient');

  /// Telegram API BaseUrl
  static final baseUrl = 'api.telegram.org';

  static final _listTypeFactories = <String, Function(List<dynamic>)>{
    'List<Update>': Update.listFromJsonArray,
    'List<Message>': Message.listFromJsonArray,
    'List<ChatMember>': ChatMember.listFromJsonArray,
    'List<BotCommand>': BotCommand.listFromJsonArray,
  };

  static final _typeFactories = <String, Function(Map<String, dynamic>)>{
    'User': User.fromJson,
    'Message': Message.fromJson,
    'UserProfilePhotos': UserProfilePhotos.fromJson,
    'File': File.fromJson,
    'ChatMember': ChatMember.fromJson,
    'Poll': Poll.fromJson,
    'StickerSet': StickerSet.fromJson,
    'Chat': Chat.fromJson,
    'ChatInviteLink': ChatInviteLink.fromJson,
    'MessageId': MessageId.fromJson,
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

  Future<Map<String, dynamic>> _execute(
    String? token,
    String method, [
    Map<String, dynamic>? query,
    Map<String, HttpFile>? files,
  ]) async {
    var uri = Uri.https(
      baseUrl,
      '/bot$token/$method',
      query?.cast(),
    );
    var response = await _client
        .send(_getRequest(uri, files))
        .timeout(Duration(seconds: 120));
    var stringResponse = await response.stream.bytesToString();
    return json.decode(stringResponse);
  }

  /// Download a file from path
  Future<Uint8List> apiDownload(String? token, String? path) async {
    var uri = Uri.https(baseUrl, '/file/bot$token/$path');
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

  /// ApiCall
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
          if (v is List) return json.encode(v);
          return '$v';
        });
    }

    var jsonResp = await _execute(token, method, query, files);
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
      dynamic converter;
      if (apiType.startsWith('List')) {
        converter = _listTypeFactories[apiType];
      } else {
        converter = _typeFactories[apiType];
      }
      if (converter == null) throw Exception('Unknown API type $apiType');
      return converter.call(result) as T;
    } on Exception catch (e, s) {
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

  /// Close the client
  void close() {
    _client.close();
    _coreClient = null;
  }
}
