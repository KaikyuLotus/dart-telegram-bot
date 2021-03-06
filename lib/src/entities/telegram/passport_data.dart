import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class PassportData {
  List<EncryptedPassportElement> data;
  EncryptedCredentials credentials;

  PassportData({
    required this.data,
    required this.credentials,
  });

  static PassportData fromJson(Map<String, dynamic> json) {
    return PassportData(
      data: EncryptedPassportElement.listFromJsonArray(json['data']!),
      credentials: EncryptedCredentials.fromJson(json['credentials']!),
    );
  }

  Map toJson() {
    return {
      'data': data,
      'credentials': credentials,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
