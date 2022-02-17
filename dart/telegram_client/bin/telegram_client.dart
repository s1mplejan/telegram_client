import 'package:telegram_client/telegram_client.dart';
import 'dart:io';

void main() async {
  stdout.write("Paste your token bot from @botfather here: ");
  var tokenBot = stdin.readLineSync().toString();
  if (tokenBot.isNotEmpty) {
    var tg = Telegram(tokenBot);
    stdout.write("Enter your chat_id : ");
    var chatId = stdin.readLineSync();
    if (chatId.toString().isNotEmpty) {
      // ignore: non_constant_identifier_names
      var chat_id = chatId;
      // request raw auto update library latest
      var options = {
        "chat_id": chat_id,
        "text": "hello world",
        "protect_content": true,
        "reply_markup": {
          "inline_keyboard": [
            [
              {"text": "form data nih bos", "url": "google.com"}
            ]
          ]
        }
      };
      try {
        await tg.api.request("sendMessage", options, true);

        await tg.api.sendMessage(chat_id, "hello world", {
          "reply_markup": {
            "inline_keyboard": [
              [
                {"text": "hewlo", "url": "google.com"}
              ]
            ]
          }
        });
        var request = await tg.api.request("getMe");
        print(request);
      } catch (e) {
        try {
          await tg.api.sendMessage(chat_id, e.toString());
        } catch (e) {
          print(e);
        }
      }
    } else {
      print("silahkan ulangin lagi dari awal");
    }
  } else {
    print("silahkan ulangin lagi dari awal");
  }
}
