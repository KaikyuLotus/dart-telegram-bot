import 'dart:typed_data';

class HttpFile {
  Uint8List? _bytes;
  String? _name;
  String? _token;

  Uint8List? get bytes => _bytes;

  String? get name => _name;

  String? get token => _token;

  HttpFile.fromBytes(String name, Uint8List bytes) {
    _name = name;
    _bytes = bytes;
  }

  HttpFile.fromUrl(String url) {
    _token = url;
  }

  HttpFile.fromToken(String token) {
    _token = token;
  }
}
