import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes Telegram Passport data shared with the bot by the user.
class PassportData {
  /// Array with information about documents and other Telegram Passport
  /// elements that was shared with the bot
  List<EncryptedPassportElement> data;

  /// Encrypted credentials required to decrypt the data
  EncryptedCredentials credentials;

  /// Basic constructor
  PassportData({
    required this.data,
    required this.credentials,
  });

  /// Creates a object from a json
  static PassportData fromJson(Map<String, dynamic> json) {
    return PassportData(
      data: EncryptedPassportElement.listFromJsonArray(json['data']!),
      credentials: EncryptedCredentials.fromJson(json['credentials']!),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'data': data,
      'credentials': credentials,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
