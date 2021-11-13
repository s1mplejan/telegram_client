import 'package:telegram_client/telegram_bot_api.dart';

void main(List<String> arguments) {
  var tg = Telegram("saa", { "azka" : "oke", "api": "http://localhost:9000"});
  tg.opt();
}
