import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the content of an invoice message to be sent as the result of an
/// inline query.
class InputInvoiceMessageContent extends InputMessageContent {
  /// Product name, 1-32 characters
  String title;

  /// Product description, 1-255 characters
  String description;

  /// Bot-defined invoice payload, 1-128 bytes.
  ///
  /// This will not be displayed to the user, use for your internal processes.
  String payload;

  /// Payment provider token, obtained via [@BotFather](https://t.me/botfather).
  ///
  /// Pass an empty string for payments in
  /// [Telegram Stars](https://t.me/BotNews/90).
  String? providerToken;

  /// Three-letter ISO 4217 currency code,
  /// see [more on currencies](https://core.telegram.org/bots/payments#supported-currencies).
  ///
  /// Pass “XTR” for payments in [Telegram Stars](https://t.me/BotNews/90).
  String currency;

  /// Price breakdown, a JSON-serialized list of components (e.g. product price,
  /// tax, discount, delivery cost, delivery tax, bonus, etc.).
  ///
  /// Must contain exactly one item for payments in
  /// [Telegram Stars](https://t.me/BotNews/90).
  List<LabeledPrice> prices;

  /// The maximum accepted amount for tips in the smallest units of the currency
  /// (integer, not float/double).
  ///
  /// For example, for a maximum tip of `US$ 1.45` pass `max_tip_amount = 145`.
  ///
  /// See the exp parameter in
  /// [currencies.json](https://core.telegram.org/bots/payments/currencies.json),
  /// it shows the number of digits past the decimal point for each currency
  /// (2 for the majority of currencies).
  ///
  /// Defaults to 0. Not supported for payments in Telegram Stars.
  int? maxTipAmount;

  /// A JSON-serialized array of suggested amounts of tip in the smallest units
  /// of the currency (integer, not float/double).
  ///
  /// At most 4 suggested tip amounts can be specified.
  ///
  /// The suggested tip amounts must be positive, passed in a strictly increased
  /// order and must not exceed max_tip_amount.
  List<int>? suggestedTipAmounts;

  /// A JSON-serialized object for data about the invoice,
  /// which will be shared with the payment provider.
  ///
  /// A detailed description of the required fields should be provided by the
  /// payment provider.
  String? providerData;

  /// URL of the product photo for the invoice.
  ///
  /// Can be a photo of the goods or a marketing image for a service.
  String? photoUrl;

  /// Photo size in bytes
  int? photoSize;

  /// Photo width
  int? photoWidth;

  /// Photo height
  int? photoHeight;

  /// Pass `true` if you require the user's full name to complete the order.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? needName;

  /// Pass `true` if you require the user's phone number to complete the order.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? needPhoneNumber;

  /// Pass `true` if you require the user's email address to complete the order.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? needEmail;

  /// Pass `true` if you require the user's shipping address to complete the
  /// order.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? needShippingAddress;

  /// Pass `true` if the user's phone number should be sent to the provider.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? sendPhoneNumberToProvider;

  /// Pass `true` if the user's email address should be sent to the provider.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? sendEmailToProvider;

  /// Pass `true` if the final price depends on the shipping method.
  ///
  /// Ignored for payments in [Telegram Stars](https://t.me/BotNews/90).
  bool? isFlexible;

  /// Basic constructor
  InputInvoiceMessageContent({
    required this.title,
    required this.description,
    required this.payload,
    required this.currency,
    required this.prices,
    this.maxTipAmount,
    this.suggestedTipAmounts,
    this.providerToken,
    this.providerData,
    this.photoUrl,
    this.photoSize,
    this.photoWidth,
    this.photoHeight,
    this.needName,
    this.needPhoneNumber,
    this.needEmail,
    this.needShippingAddress,
    this.sendPhoneNumberToProvider,
    this.sendEmailToProvider,
    this.isFlexible,
  });

  /// Custom constructor for payments in [Telegram Stars](https://t.me/BotNews/90)
  InputInvoiceMessageContent.stars({
    required this.title,
    required this.description,
    required this.payload,
    required LabeledPrice price,
    this.providerData,
    this.photoUrl,
    this.photoSize,
    this.photoWidth,
    this.photoHeight,
  })  : currency = 'XTR',
        prices = [price];

  /// Creates a object from a json
  factory InputInvoiceMessageContent.fromJson(Map<String, dynamic> json) {
    return InputInvoiceMessageContent(
      title: json['title'],
      description: json['description'],
      payload: json['payload'],
      currency: json['currency'],
      prices: LabeledPrice.listFromJsonArray(json['prices']),
      maxTipAmount: json['max_tip_amount'],
      suggestedTipAmounts: List.from(json['suggested_tip_amounts'] ?? []),
      providerToken: json['provider_token'],
      providerData: json['provider_data'],
      photoUrl: json['photo_url'],
      photoSize: json['photo_size'],
      photoWidth: json['photo_width'],
      photoHeight: json['photo_height'],
      needName: json['need_name'],
      needPhoneNumber: json['need_phone_number'],
      needEmail: json['need_email'],
      needShippingAddress: json['need_shipping_address'],
      sendPhoneNumberToProvider: json['send_phone_number_to_provider'],
      sendEmailToProvider: json['send_email_to_provider'],
      isFlexible: json['is_flexible'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': providerToken,
      'currency': currency,
      'prices': prices,
      'max_tip_amount': maxTipAmount,
      'suggested_tip_amounts': suggestedTipAmounts,
      'provider_data': providerData,
      'photo_url': photoUrl,
      'photo_size': photoSize,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
      'need_name': needName,
      'need_phone_number': needPhoneNumber,
      'need_email': needEmail,
      'need_shipping_address': needShippingAddress,
      'send_phone_number_to_provider': sendPhoneNumberToProvider,
      'send_email_to_provider': sendEmailToProvider,
      'is_flexible': isFlexible,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
