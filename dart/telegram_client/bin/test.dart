import 'package:telegram_client/telegram_client.dart';

import 'telegram_client.dart';

void main() {
  var tg = Telegram("_token").api;
  print(tg.file("./hay.json"));
}
