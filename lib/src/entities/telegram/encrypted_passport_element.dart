import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class EncryptedPassportElement {
  String type;
  String? data;
  String? phoneNumber;
  String? email;
  List<PassportFile>? files;
  PassportFile? frontSide;
  PassportFile? reverseSide;
  PassportFile? selfie;
  List<PassportFile>? translation;
  String hash;

  EncryptedPassportElement({
    required this.type,
    this.data,
    this.phoneNumber,
    this.email,
    this.files,
    this.frontSide,
    this.reverseSide,
    this.selfie,
    this.translation,
    required this.hash,
  });

  static EncryptedPassportElement fromJson(Map<String, dynamic> json) {
    return EncryptedPassportElement(
      type: json['type']!,
      data: json['data'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      files: PassportFile.listFromJsonArray(json['files']),
      frontSide: PassportFile.fromJson(json['front_side']),
      reverseSide: PassportFile.fromJson(json['reverse_side']),
      selfie: PassportFile.fromJson(json['selfie']),
      translation: PassportFile.listFromJsonArray(json['translation']),
      hash: json['hash']!,
    );
  }

  static List<EncryptedPassportElement> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => EncryptedPassportElement.fromJson(json[i]),
    );
  }

  Map toJson() {
    return {
      'type': type,
      'data': data,
      'phone_number': phoneNumber,
      'email': email,
      'files': files,
      'front_side': frontSide,
      'reverse_side': reverseSide,
      'selfie': selfie,
      'translation': translation,
      'hash': hash,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
