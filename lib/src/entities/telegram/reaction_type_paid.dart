import 'dart:convert';

import '../../../telegram_entities.dart';

/// The reaction is paid.
class ReactionTypePaid extends ReactionType {
  /// Type of the reaction, always “paid”
  @override
  String type = 'paid';

  /// Basic constructor
  ReactionTypePaid();

  /// Creates an object from a json
  factory ReactionTypePaid.fromJson(Map<String, dynamic> _) {
    return ReactionTypePaid();
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
