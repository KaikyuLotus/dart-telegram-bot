import 'dart:convert';

import '../../../telegram_entities.dart';

/// The withdrawal succeeded.
class RevenueWithdrawalStateSucceeded extends RevenueWithdrawalState {
  /// Type of the state, always “succeeded”
  @override
  String type = 'succeeded';

  /// Date the withdrawal was completed in Unix time
  int date;

  /// An HTTPS URL that can be used to see transaction details
  String url;

  /// Basic constructor
  RevenueWithdrawalStateSucceeded({
    required this.date,
    required this.url,
  });

  /// Creates an object from a json
  factory RevenueWithdrawalStateSucceeded.fromJson(Map<String, dynamic> json) {
    return RevenueWithdrawalStateSucceeded(
      date: json['date'],
      url: json['url'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'date': date,
      'url': url,
    };
  }

  @override
  String toString() => json.encode(this);
}
