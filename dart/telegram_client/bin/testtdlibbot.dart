import 'package:telegram_client/telegram_client.dart';
import 'package:telegram_client/telegram_client.dart' as client;

void main() {
  var option = {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory':
        "/home/azkadev/Documents/telegram_client/dart/telegram_client/bin/bot",
    'files_directory':
        "/home/azkadev/Documents/telegram_client/dart/telegram_client/bin/bot"
  };
  var tg =
      Tdlib("/home/azkadev/Downloads/azkauserrobot-1.0.1/libtdjson.so", option);
  tg.on("update", (update) async {
    if (update["@type"] == "updateNewMessage" &&
        update["message"]["@type"] == "message") {
      var msg = update["message"];
      var chatId = msg["chat_id"];
      if (!msg["is_outgoing"]) {
        tg.request(
            "sendMessage", {"chat_id": chatId, "text": "Hello world"});
      }
    }
  });
  tg.bot("5141871612:AAGKvhsIdiKkCDOQ7bjIOhZ3-F1BWtnuYfk");
}
