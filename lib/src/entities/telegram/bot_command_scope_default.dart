import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeDefault extends BotCommandScope {
  final String type = 'default';

  BotCommandScopeDefault();

  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
