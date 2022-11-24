import 'package:telegram_client/telegram_client.dart';

void main() async {
  TelegramBotApi tg =
      TelegramBotApi("5967993492:AAFILKW1NKoYps_2L58m4sLawfVuxEYt7pU");

  var res = await tg.request(
    "sendDocument",
    parameters: {
      "chat_id": 5604530106,
      "document": "file:///install-script.sh",
    },
  );
  print(res);
}
