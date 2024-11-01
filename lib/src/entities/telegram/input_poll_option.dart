import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about one answer option in a poll to be
/// sent.
class InputPollOption {
  /// Option text, 1-100 characters
  String text;

  /// Optional.
  /// Mode for parsing entities in the text.
  /// See formatting options for more details.
  /// Currently, only custom emoji entities are allowed
  ParseMode? textParseMode;

  /// Optional.
  /// A JSON-serialized list of special entities that appear in the
  /// poll option text.
  /// It can be specified instead of text_parse_mode
  List<MessageEntity>? textEntities;

  /// Basic constructor
  InputPollOption({
    required this.text,
    this.textParseMode,
    this.textEntities,
  });

  /// Creates a object from a json
  factory InputPollOption.fromJson(Map<String, dynamic> json) {
    return InputPollOption(
      text: json['text'],
      textParseMode: callIfNotNull(
        ParseMode.forValue,
        json['text_parse_mode'],
      ),
      textEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['text_entities'],
      ),
    );
  }

  /// Creates a list of object from a json array
  static List<InputPollOption> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => InputPollOption.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'text': text,
      'text_parse_mode': textParseMode,
      'text_entities': textEntities,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
