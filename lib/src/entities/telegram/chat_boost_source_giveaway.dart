import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';

import '../../../telegram_entities.dart';

/// The boost was obtained by the creation of a Telegram Premium giveaway.
/// This boosts the chat 4 times for the duration of the corresponding
/// Telegram Premium subscription.
class ChatBoostSourceGiveaway extends ChatBoostSource {
  /// Source of the boost, always “giveaway”
  @override
  final String source = 'giveaway';

  /// Identifier of a message in the chat with the giveaway;
  /// the message could have been deleted already.
  /// May be 0 if the message isn't sent yet.
  int giveawayMessageId;

  /// Optional.
  /// User that won the prize in the giveaway if any
  User? user;

  /// Optional.
  /// True, if the giveaway was completed, but there was no user to win the prize
  bool? isUnclaimed;

  /// Basic constructor
  ChatBoostSourceGiveaway({
    required this.giveawayMessageId,
    this.user,
    this.isUnclaimed,
  });

  /// Creates a object from a json
  factory ChatBoostSourceGiveaway.fromJson(Map<String, dynamic> json) {
    return ChatBoostSourceGiveaway(
      giveawayMessageId: json['giveaway_message_id'],
      user: callIfNotNull(User.fromJson, json['user']),
      isUnclaimed: json['is_unclaimed'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'source': source,
      'giveaway_message_id': giveawayMessageId,
      'user': user,
      'is_unclaimed': isUnclaimed,
    };
  }

  @override
  String toString() => toJson().toString();
}
