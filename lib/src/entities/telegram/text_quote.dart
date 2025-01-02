import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about the quoted part of a message that is
/// replied to by the given message.
class TextQuote {
  /// Text of the quoted part of a message that is replied to
  /// by the given message
  String text;

  /// Optional.
  /// Special entities that appear in the quote. Currently, only bold, italic,
  /// underline, strikethrough, spoiler, and custom_emoji entities are kept
  /// in quotes.
  List<MessageEntity>? entities;

  /// Approximate quote position in the original message in UTF-16 code units
  /// as specified by the sender
  int position;

  /// Optional.
  /// True, if the quote was chosen manually by the message sender.
  /// Otherwise, the quote was added automatically by the server.
  bool? isManual;

  /// Basic constructor
  TextQuote({
    required this.text,
    this.entities,
    required this.position,
    this.isManual,
  });

  /// Creates an object from a json
  factory TextQuote.fromJson(Map<String, dynamic> json) {
    return TextQuote(
      text: json['text'],
      entities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['entities'],
      ),
      position: json['position'],
      isManual: json['is_manual'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'entities': entities?.map((e) => e.toJson()).toList(),
      'position': position,
      'is_manual': isManual,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
