import '../../../telegram_entities.dart';

/// This object describes the type of a reaction.
///
/// Currently, it can be one of:
/// [ReactionTypeEmoji],
/// [ReactionTypeCustomEmoji],
/// [ReactionTypePaid]
abstract class ReactionType {
  abstract final String type;

  /// Creates a object from a json
  static ReactionType fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'emoji':
        return ReactionTypeEmoji.fromJson(json);
      case 'custom_emoji':
        return ReactionTypeCustomEmoji.fromJson(json);
      case 'paid':
        return ReactionTypePaid.fromJson(json);
      default:
        throw Exception('ReactionType type not recognized');
    }
  }

  /// Creates a list of object from a json array
  static List<ReactionType> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => ReactionType.fromJson(json[i]),
    );
  }
}
