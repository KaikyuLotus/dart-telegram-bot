import 'package:dart_telegram_bot/tgapi/bot.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/api_exception.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/invalid_bot_state_exception.dart';
import 'package:test/test.dart';

void main() {
  test('A bot does not start if the token is wrong', () {
    var bot = Bot('Wrongtoken');
    expect(
        () async => {await bot.init()}, throwsA(TypeMatcher<APIException>()));
  });

  test('Cannot start a not initialized bot', () {
    var bot = Bot('Wrongtoken');
    expect(() async => {await bot.start()}, throwsA(TypeMatcher<InvalidBotState>()));
  });

  test('Cannot stop a non-running bot', () {
    var bot = Bot('Wrongtoken');
    expect(() => {bot.stop()}, throwsA(TypeMatcher<InvalidBotState>()));
  });

  // TODO more tests to come
}
