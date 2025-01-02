import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes a transaction with a user.
class TransactionPartnerUser extends TransactionPartner {
  /// Type of the transaction partner, always “user”
  @override
  String type = 'user';

  /// Information about the user
  User user;

  /// Bot-specified invoice payload
  String? invoicePayload;

  /// The duration of the paid subscription
  int? subscriptionPeriod;

  /// Information about the paid media bought by the user
  List<PaidMedia>? paidMedia;

  /// Bot-specified paid media payload
  String? paidMediaPayload;

  /// The gift sent to the user by the bot
  String? gift;

  /// Basic constructor
  TransactionPartnerUser({
    required this.user,
    this.invoicePayload,
    this.subscriptionPeriod,
    this.paidMedia,
    this.paidMediaPayload,
    this.gift,
  });

  /// Creates an object from a json
  factory TransactionPartnerUser.fromJson(Map<String, dynamic> json) {
    return TransactionPartnerUser(
      user: User.fromJson(json['user']),
      invoicePayload: json['invoice_payload'],
      subscriptionPeriod: json['subscription_period'],
      paidMedia: callIfNotNull(
        PaidMedia.listFromJsonArray,
        json['paid_media'],
      ),
      paidMediaPayload: json['paid_media_payload'],
      gift: json['gift'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'user': user,
      'invoice_payload': invoicePayload,
      'subscription_period': subscriptionPeriod,
      'paid_media': paidMedia,
      'paid_media_payload': paidMediaPayload,
      'gift': gift,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
