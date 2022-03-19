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
    var tg = Tdlib("$path/libtdjson.so", option);
    tg.on("update", (update) async {
      print(update);
      if (update["@type"] == "updateNewMessage" &&
          update["message"]["@type"] == "message") {
        var msg = update["message"];
        var chatId = msg["chat_id"];
        if (!msg["is_outgoing"]) {
          tg.request("sendMessage", {"chat_id": chatId, "text": "Hello world"});
        }
      }
    });
    await tg.bot("2123043767:AAEY0KTdVYo0JTRmFF5S4QPBnvoCdpe2yPI");
  } catch (e) {
    print(e);
  }
}
