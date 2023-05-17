import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

void main() async {
  // Add your bot token here
  Bot bot = Bot(token: "BOT_TOKEN");

  bot.onCommand('start', (Bot bot, Update update) async {
    bot.sendMessage(ChatID(update.message!.chat.id), update.message!.text!);
  });

  bot.onUpdate((bot, update) async {
    bot.sendMessage(ChatID(update.message!.chat.id), update.message!.text!);
  });

  /// Set this webhook url to telegram
  /// Import alfred library, or any other library that can handle webhooks
  // final app = Alfred();
  // app.post('/webhook', (req, res) async {
  //   var obj = await req.bodyAsJsonMap;
  //   bot.pushUpdate(Update.fromJson(obj));
  //   res.json({'success': true});
  // });
  // await app.listen();
}
