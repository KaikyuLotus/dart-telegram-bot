import 'dart:io';
import 'dart:typed_data';

class HttpFile {
  Uint8List bytes;
  String name;

  String token;
  
  HttpFile.fromBytes(String name, Uint8List bytes) {
    this.name = name;
    this.bytes = bytes;
  }

  HttpFile.fromFile(File file) {
    name = file.path.split('/').last;
    bytes = file.readAsBytesSync();
  }

  HttpFile.fromPath(String path) {
    name = path.split('/').last;
    bytes = File(path).readAsBytesSync();
  }
  
  HttpFile.fromToken(this.token);
  
}
