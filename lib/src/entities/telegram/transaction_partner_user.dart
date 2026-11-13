import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes a transaction with a user.
class TransactionPartnerUser extends TransactionPartner {
  /// Type of the transaction partner, always “user”
  @override
  String type = 'user';

  /// Type of the transaction, currently one of "invoice_payment" for payments
  /// via invoices, "paid_media_payment" for payments for paid media,
  /// "gift_purchase" for gifts sent by the bot, "premium_purchase" for
  /// Telegram Premium subscriptions gifted by the bot,
  /// "business_account_transfer" for direct transfers from managed business
  /// accounts
  String transactionType;

  /// Information about the user
  User user;

  /// Optional.
  /// Information about the affiliate that received a commission via this
  /// transaction. Can be available only for "invoice_payment" and
  /// "paid_media_payment" transactions.
  AffiliateInfo? affiliate;

  /// Optional.
  /// Bot-specified invoice payload. Can be available only for "invoice_payment"
  /// transactions.
  String? invoicePayload;

  /// Optional.
  /// The duration of the paid subscription. Can be available only for
  /// "invoice_payment" transactions.
  int? subscriptionPeriod;

  /// Optional.
  /// Information about the paid media bought by the user; for
  /// "paid_media_payment" transactions only
  List<PaidMedia>? paidMedia;

  /// Optional.
  /// Bot-specified paid media payload. Can be available only for
  /// "paid_media_payment" transactions.
  String? paidMediaPayload;

  /// Optional.
  /// The gift sent to the user by the bot; for "gift_purchase" transactions
  /// only
  Gift? gift;

  /// Optional.
  /// Number of months the gifted Telegram Premium subscription will be active
  /// for; for "premium_purchase" transactions only
  int? premiumSubscriptionDuration;

  /// Basic constructor
  TransactionPartnerUser({
    required this.transactionType,
    required this.user,
    this.affiliate,
    this.invoicePayload,
    this.subscriptionPeriod,
    this.paidMedia,
    this.paidMediaPayload,
    this.gift,
    this.premiumSubscriptionDuration,
  });

  /// Creates an object from a json
  factory TransactionPartnerUser.fromJson(Map<String, dynamic> json) {
    return TransactionPartnerUser(
      transactionType: json['transaction_type'],
      user: User.fromJson(json['user']),
      affiliate: callIfNotNull(AffiliateInfo.fromJson, json['affiliate']),
      invoicePayload: json['invoice_payload'],
      subscriptionPeriod: json['subscription_period'],
      paidMedia: callIfNotNull(
        PaidMedia.listFromJsonArray,
        json['paid_media'],
      ),
      paidMediaPayload: json['paid_media_payload'],
      gift: callIfNotNull(Gift.fromJson, json['gift']),
      premiumSubscriptionDuration: json['premium_subscription_duration'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'transaction_type': transactionType,
      'user': user,
      'affiliate': affiliate,
      'invoice_payload': invoicePayload,
      'subscription_period': subscriptionPeriod,
      'paid_media': paidMedia,
      'paid_media_payload': paidMediaPayload,
      'gift': gift,
      'premium_subscription_duration': premiumSubscriptionDuration,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
