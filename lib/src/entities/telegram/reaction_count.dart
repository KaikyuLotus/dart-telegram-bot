import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a reaction added to a message along with the number of times
/// it was added.
class ReactionCount {
  /// Type of the reaction
  ReactionType type;

  /// Number of times the reaction was added
  int totalCount;

  /// Basic constructor
  ReactionCount(
    this.type,
    this.totalCount,
  );

  /// Creates a object from a json
  factory ReactionCount.fromJson(Map<String, dynamic> json) {
    return ReactionCount(
      ReactionType.fromJson(json['type']),
      json['total_count'],
    );
  }

  /// Creates a list of object from a json array
  static List<ReactionCount> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => ReactionCount.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'total_count': totalCount,
    };
  }

  @override
  String toString() => json.encode(this);
}
