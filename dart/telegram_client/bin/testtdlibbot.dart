import 'package:telegram_client/telegram_client.dart';
import 'dart:io';

void main() async {
  try {
    var path = Directory.current.path;
    print(path);
    var option = {
      'api_id': 1917085,
      'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
      'database_directory': "$path/bot",
      'files_directory': "$path/bot",
    };
    Tdlib tg = Tdlib(
        "/home/azkadev/Downloads/azkauserrobot-1.0.1/libtdjson.so", option);
    tg.on("update", (UpdateTd update) async {
      if (update.message.is_found) {
        var msg = update.message;
        if (!msg.is_outgoing) {
          if (msg.text == "/start") {
            update.tg.request("sendMessage", {
              "chat_id": msg.chat.id,
              "text": "start message"
            });
          } else {
            update.tg.request("sendMessage", {
              "chat_id": msg.chat.id,
              "text": "Echo ${msg.text ?? "undefined"}"
            });
          }
        }
      }
    });
    await tg.bot("2123043767:AAEY0KTdVYo0JTRmFF5S4QPBnvoCdpe2yPI");
  } catch (e) {
    print(e);
  }
}
