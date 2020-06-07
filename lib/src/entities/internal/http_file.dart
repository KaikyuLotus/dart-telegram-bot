part of '../../entities.dart';

class HttpFile {
  Uint8List _bytes;
  String _name;
  String _token;

  Uint8List get bytes => _bytes;

  String get name => _name;

  String get token => _token;

  HttpFile.fromBytes(String name, Uint8List bytes) {
    _name = name;
    _bytes = bytes;
  }

  HttpFile.fromFile(io.File file) {
    _name = file.path.split('/').last;
    _bytes = file.readAsBytesSync();
  }

  HttpFile.fromPath(String path) {
    _name = path.split('/').last;
    _bytes = io.File(path).readAsBytesSync();
  }

  HttpFile.fromToken(this._token);
}
