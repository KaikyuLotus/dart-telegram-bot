import 'dart:convert';

class EncryptedCredentials {
  String data;
  String hash;
  String secret;

  EncryptedCredentials({
    required this.data,
    required this.hash,
    required this.secret,
  });

  static EncryptedCredentials fromJson(Map<String, dynamic> json) {
    return EncryptedCredentials(
      data: json['data']!,
      hash: json['hash']!,
      secret: json['secret']!,
    );
  }

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
