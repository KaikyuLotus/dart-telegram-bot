import 'package:dart_telegram_bot/tgapi/entities/message.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';
import 'package:dart_telegram_bot/tgapi/entities/user.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/unsupported_api_type.dart';

class BaseResponse<T> {
  static var factories = {
    'User': (json) => User.fromJson(json),
    'List<Update>': (array) =>
        List.generate(array.length, (i) => Update.fromJson(array.elementAt(i))),
    'Message': (json) => Message.fromJson(json)
  };

  bool ok;
  int errorCode;
  T result;
  String description;

  BaseResponse({this.ok, this.errorCode, this.result, this.description});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (!factories.containsKey(T.toString())) {
      throw UnsupportedAPIType(
          'Type ${T.toString()} has no factory defined in BaseResponse');
    }
    return BaseResponse(
        ok: json['ok'],
        errorCode: json['error_code'],
        result: json['ok'] ? factories[T.toString()](json['result']) : null,
        description: json['description']);
  }
}
