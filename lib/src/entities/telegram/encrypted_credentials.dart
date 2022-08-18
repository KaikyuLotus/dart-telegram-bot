import 'dart:convert';

/// Describes data required for decrypting and authenticating
/// EncryptedPassportElement.
/// See the Telegram Passport Documentation for a complete description of the
/// data decryption and authentication processes.
class EncryptedCredentials {
  /// Base64-encoded encrypted JSON-serialized data with unique user's payload,
  /// data hashes and secrets required for EncryptedPassportElement decryption
  /// and authentication
  String data;

  /// Base64-encoded data hash for data authentication
  String hash;

  /// Base64-encoded secret, encrypted with the bot's public RSA key, required
  /// for data decryption
  String secret;

  /// Basic constructor
  EncryptedCredentials({
    required this.data,
    required this.hash,
    required this.secret,
  });

  /// Creates a object from a json
  static EncryptedCredentials fromJson(Map<String, dynamic> json) {
    return EncryptedCredentials(
      data: json['data']!,
      hash: json['hash']!,
      secret: json['secret']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'data': data,
      'hash': hash,
      'secret': secret,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
