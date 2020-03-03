import '../exceptions/unsupported_api_type.dart';
import 'chat_member.dart';
import 'file.dart';
import 'message.dart';
import 'poll.dart';
import 'sticker_set.dart';
import 'update.dart';
import 'user.dart';
import 'user_profile_photos.dart';

class BaseResponse<T> {
  static var factories = {
    'User': (json) => User.fromJson(json),
    'List<Update>': (array) => List.generate(array.length, (i) => Update.fromJson(array.elementAt(i))),
    'Message': (json) => Message.fromJson(json),
    'bool': (data) => data,
    'int': (data) => data,
    'String': (data) => data,
    'UserProfilePhotos': (json) => UserProfilePhotos.fromJson(json),
    'File': (json) => File.fromJson(json),
    'List<ChatMember>': (array) => List.generate(array.length, (i) => ChatMember.fromJson(array.elementAt(i))),
    'ChatMember': (json) => ChatMember.fromJson(json),
    'Poll': (json) => Poll.fromJson(json),
    'StickerSet': (json) => StickerSet.fromJson(json)
  };

  bool ok;
  int errorCode;
  T result;
  String description;

  BaseResponse({this.ok, this.errorCode, this.result, this.description});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (!factories.containsKey(T.toString())) {
      throw UnsupportedAPIType('Type ${T.toString()} has no factory defined in BaseResponse');
    }
    return BaseResponse(
        ok: json['ok'],
        errorCode: json['error_code'],
        result: json['ok'] ? factories[T.toString()](json['result']) : null,
        description: json['description']);
  }
}
