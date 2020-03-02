import 'dart:async';
import 'dart:convert';

import 'package:dart_telegram_bot/tgapi/entities/base_response.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/entities/message.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';
import 'package:dart_telegram_bot/tgapi/entities/user.dart';
import 'package:http/http.dart' as http;

import 'exceptions/api_exception.dart';
import 'exceptions/unknown_api_method.dart';

class TGAPIClient {
  final String BASE_URL = 'api.telegram.org';

  http.Client client = http.Client();

  var methods = {
    'getMe': (j) => BaseResponse<User>.fromJson(j),
    'getUpdates': (j) => BaseResponse<List<Update>>.fromJson(j),
    'sendMessage': (j) => BaseResponse<Message>.fromJson(j),
    'sendPhoto': (j) => BaseResponse<Message>.fromJson(j),
    'sendSticker': (j) => BaseResponse<Message>.fromJson(j),
    'sendAudio': (j) => BaseResponse<Message>.fromJson(j),
    'sendDocument': (j) => BaseResponse<Message>.fromJson(j),
    'sendVideo': (j) => BaseResponse<Message>.fromJson(j),
    'sendAnimation': (j) => BaseResponse<Message>.fromJson(j),
    'sendVoice': (j) => BaseResponse<Message>.fromJson(j)
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
        var multipartFile = http.MultipartFile(
            entry.key, stream, entry.value.bytes.length,
            filename: entry.value.name);
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

  Future<T> apiCall<T>(String token, String method,
      [Map<String, dynamic> query]) async {
    if (!methods.containsKey(method)) throw UnknownAPIMethod(method);

    var files = <String, HttpFile>{};
    if (query != null) {
      // Maybe improve this part
      // Filter out null values and convert entries to string
      query.removeWhere((k, v) => v == null);
      query.forEach((k, v) => {if (v is HttpFile) files[k] = v});
      query.removeWhere((k, v) => v is HttpFile);
      query.updateAll((k, v) => v.toString());
    }

    var resp = methods[method](await execute(token, method, query, files));
    if (!resp.ok) throw APIException(resp.description, resp.errorCode);

    return resp.result as T;
  }
}
