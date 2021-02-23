import 'package:logging/logging.dart';

class EnumHelper {

  static final log = Logger('EnumHelper');

  static String _getEnumClassFromValues<T>(Iterable<T> values) {
    return values.first.runtimeType.toString();
  }

  static String _getEnumValue<T>(T enumType) {
    if (enumType == null) {
      return null;
    }
    return enumType.toString().split('.')[1];
  }

  static T decode<T>(Iterable<T> values, String value) {
    if (value == null) {
      return null;
    }
    var neededEnum = '${_getEnumClassFromValues(values)}.${value.toUpperCase()}';
    try {
      return values.firstWhere((e) => '${e.toString().toUpperCase()}' == neededEnum.toUpperCase());
    } on StateError {
      log.severe('Could not find "$neededEnum" in [${values.join(', ')}]');
      rethrow;
    }
  }

  static String encode<T>(T menum) {
    return _getEnumValue(menum);
  }
}
