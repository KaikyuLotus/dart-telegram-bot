import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes documents or other Telegram Passport elements shared with the bot
/// by the user.
class EncryptedPassportElement {
  /// Element type.
  /// One of “personal_details”, “passport”, “driver_license”, “identity_card”,
  /// “internal_passport”, “address”, “utility_bill”, “bank_statement”,
  /// “rental_agreement”, “passport_registration”, “temporary_registration”,
  /// “phone_number”, “email”.
  String type;

  /// Optional.
  /// Base64-encoded encrypted Telegram Passport element data provided by the
  /// user, available for “personal_details”, “passport”, “driver_license”,
  /// “identity_card”, “internal_passport” and “address” types.
  /// Can be decrypted and verified using the accompanying EncryptedCredentials.
  String? data;

  /// Optional.
  /// User's verified phone number, available only for “phone_number” type
  String? phoneNumber;

  /// Optional.
  /// User's verified email address, available only for “email” type
  String? email;

  /// Optional.
  /// Array of encrypted files with documents provided by the user, available
  /// for “utility_bill”, “bank_statement”, “rental_agreement”,
  /// “passport_registration” and “temporary_registration” types.
  /// Files can be decrypted and verified using the accompanying
  /// EncryptedCredentials.
  List<PassportFile>? files;

  /// Optional.
  /// Encrypted file with the front side of the document, provided by the user.
  /// Available for “passport”, “driver_license”, “identity_card” and
  /// “internal_passport”.
  /// The file can be decrypted and verified using the accompanying
  /// EncryptedCredentials.
  PassportFile? frontSide;

  /// Optional.
  /// Encrypted file with the reverse side of the document,
  /// provided by the user.
  /// Available for “driver_license” and “identity_card”.
  /// The file can be decrypted and verified using the accompanying
  /// EncryptedCredentials.
  PassportFile? reverseSide;

  /// Optional.
  /// Encrypted file with the selfie of the user holding a document,
  /// provided by the user; available for “passport”, “driver_license”,
  /// “identity_card” and “internal_passport”.
  /// The file can be decrypted and verified using the accompanying
  /// EncryptedCredentials.
  PassportFile? selfie;

  /// Optional.
  /// Array of encrypted files with translated versions of documents provided
  /// by the user. Available if requested for “passport”, “driver_license”,
  /// “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”,
  /// “rental_agreement”, “passport_registration” and “temporary_registration”
  /// types.
  /// Files can be decrypted and verified using the accompanying
  /// EncryptedCredentials.
  List<PassportFile>? translation;

  /// Base64-encoded element hash for using in PassportElementErrorUnspecified
  String hash;

  /// Basic constructor
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

  /// Creates a object from a json
  static EncryptedPassportElement fromJson(Map<String, dynamic> json) {
    return EncryptedPassportElement(
      type: json['type']!,
      data: json['data'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      files: callIfNotNull(PassportFile.listFromJsonArray, json['files']),
      frontSide: callIfNotNull(PassportFile.fromJson, json['front_side']),
      reverseSide: callIfNotNull(PassportFile.fromJson, json['reverse_side']),
      selfie: callIfNotNull(PassportFile.fromJson, json['selfie']),
      translation: callIfNotNull(
        PassportFile.listFromJsonArray,
        json['translation'],
      ),
      hash: json['hash']!,
    );
  }

  /// Creates a list of object from a json array
  static List<EncryptedPassportElement> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => EncryptedPassportElement.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
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
