import 'dart:typed_data';

/// HttpFile
class HttpFile {
  Uint8List? _bytes;
  String? _name;
  String? _token;

  /// HttpFile Bytes
  Uint8List? get bytes => _bytes;

  /// HttpFile Name
  String? get name => _name;

  /// HttpFile Token
  String? get token => _token;

  /// FromBytes constructor
  HttpFile.fromBytes(String name, Uint8List bytes) {
    _name = name;
    _bytes = bytes;
  }

  /// FromUrl constructor
  HttpFile.fromUrl(String url) {
    _token = url;
  }

  /// FromToken constructor
  HttpFile.fromToken(String token) {
    _token = token;
  }
}
