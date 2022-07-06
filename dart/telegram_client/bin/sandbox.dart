import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  TelegramBotApi tg = TelegramBotApi("token");
  tg.on("update", (UpdateApi update, TelegramBotApi ctx) {
    print(update.raw);
  });
  await tg.initIsolate();
  await tg.initIsolate(tokenBot: "new_token_bot");
}
