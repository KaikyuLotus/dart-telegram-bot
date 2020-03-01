import 'dart:convert';

import 'package:dart_telegram_bot/tgapi/entities/base_response.dart';
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
    'sendMessage': (j) => BaseResponse<Message>.fromJson(j)
  };

  Future<Map<String, dynamic>> execute(String token, String method,
      [Map<String, dynamic> query]) async {
    var uri;
    var path = '/bot${token}/${method}';
    if (query != null) {
      query.removeWhere((k, v) => v == null); // Filter out null values
      query
          .updateAll((k, v) => v.toString()); // Convert all entries to a string
      uri = Uri.https(BASE_URL, path, query.cast());
    } else {
      uri = Uri.https(BASE_URL, path);
    }
    var stringResp =
        (await client.post(uri).timeout(Duration(seconds: 120))).body;
    // print(stringResp); // debug only
    return json.decode(stringResp);
  }

  Future<T> apiCall<T>(String token, String method,
      [Map<String, dynamic> query]) async {
    if (!methods.containsKey(method)) {
      throw UnknownAPIMethod(method);
    }

    BaseResponse<dynamic> resp =
        methods[method](await execute(token, method, query));

    if (!resp.ok) {
      throw APIException(resp.description, resp.errorCode);
    }

    return resp.result as T;
  }
}
