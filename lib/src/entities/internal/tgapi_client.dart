import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:logging/logging.dart';

import '../../../dart_telegram_bot.dart';
import '../../../telegram_entities.dart';

class TGAPIClient {
  static final log = Logger('TGAPIClient');

  static final baseUrl = 'api.telegram.org';

  // TODO
  //   I can't remove lambdas since some
  //   function have different parameter and return type,
  //   either make two maps, one for lists mappers and one for map mappers
  //   or pass mapper as parameter
  static final _typeFactories = {
    // ignore: unnecessary_lambdas
    'User': (d) => User.fromJson(d),
    // ignore: unnecessary_lambdas
    'List<Update>': (d) => Update.listFromJsonArray(d),
    // ignore: unnecessary_lambdas
    'Message': (d) => Message.fromJson(d),
    // ignore: unnecessary_lambdas
    'List<Message>': (d) => Message.listFromJsonArray(d),
    // ignore: unnecessary_lambdas
    'UserProfilePhotos': (d) => UserProfilePhotos.fromJson(d),
    // ignore: unnecessary_lambdas
    'File': (d) => File.fromJson(d),
    // ignore: unnecessary_lambdas
    'List<ChatMember>': (d) => ChatMember.listFromJsonArray(d),
    // ignore: unnecessary_lambdas
    'List<BotCommand>': (d) => BotCommand.listFromJsonArray(d),
    // ignore: unnecessary_lambdas
    'ChatMember': (d) => ChatMember.fromJson(d),
    // ignore: unnecessary_lambdas
    'Poll': (d) => Poll.fromJson(d),
    // ignore: unnecessary_lambdas
    'StickerSet': (d) => StickerSet.fromJson(d),
    // ignore: unnecessary_lambdas
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
      var converter = _typeFactories[apiType];
      if (converter == null) throw Exception('Unknown API type $apiType');
      return converter(result) as T;
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

  void close() {
    _client.close();
    _coreClient = null;
  }
}
