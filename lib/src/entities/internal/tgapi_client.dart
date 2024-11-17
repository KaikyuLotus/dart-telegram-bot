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
  static const baseUrl = 'api.telegram.org';

  static final _listTypeFactories = <String, Function(List<dynamic>)>{
    'List<BotCommand>': BotCommand.listFromJsonArray,
    'List<ChatMember>': ChatMember.listFromJsonArray,
    'List<Message>': Message.listFromJsonArray,
    'List<Update>': Update.listFromJsonArray,
  };

  static final _typeFactories = <String, Function(Map<String, dynamic>)>{
    'Chat': Chat.fromJson,
    'ChatFullInfo': ChatFullInfo.fromJson,
    'ChatInviteLink': ChatInviteLink.fromJson,
    'ChatMember': ChatMember.fromJson,
    'File': File.fromJson,
    'Message': Message.fromJson,
    'MessageId': MessageId.fromJson,
    'Poll': Poll.fromJson,
    'StickerSet': StickerSet.fromJson,
    'User': User.fromJson,
    'UserChatBoosts': UserChatBoosts.fromJson,
    'UserProfilePhotos': UserProfilePhotos.fromJson,
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
        .timeout(const Duration(seconds: 120));
    var stringResponse = await response.stream.bytesToString();
    return json.decode(stringResponse);
  }

  /// Download a file from path
  Future<Uint8List> apiDownload(String? token, String? path) async {
    var uri = Uri.https(baseUrl, '/file/bot$token/$path');
    var response = await _client.send(Request('GET', uri)).timeout(
          const Duration(seconds: 120),
        );
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
      var updatedQuery = <String, dynamic>{};

      for (var param in query.entries) {
        if (param.value == null) continue;

        switch (param.value.runtimeType) {
          case List<InputMedia> _:
            updatedQuery[param.key] = param.value.map((InputMedia inputMedia) {
              if (inputMedia.media is! HttpFile) {
                return inputMedia;
              }

              if (inputMedia.media.token != null) {
                inputMedia.media = inputMedia.media.token;
              } else {
                files[inputMedia.media.name] = inputMedia.media;
                inputMedia.media = 'attach://${inputMedia.media.name}';
              }

              return inputMedia;
            }).toList();
          case HttpFile _:
            if (param.value.token != null) {
              updatedQuery[param.key] = param.value.token;
            } else {
              files[param.key] = param.value;
            }
          default:
            updatedQuery[param.key] = param.value;
            break;
        }
      }

      updatedQuery.updateAll((k, v) => (v is List) ? json.encode(v) : '$v');
      query = updatedQuery;
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
