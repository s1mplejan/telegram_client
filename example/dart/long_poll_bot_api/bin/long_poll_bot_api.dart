// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  stdout.write("Token: ");
  var token = stdin.readLineSync().toString();
  if (token.isEmpty) {
    print("please add token bot");
    exit(1);
  }
  TelegramBotApi tg = TelegramBotApi(token);
  print(await tg.request("getMe"));
  tg.on("update", (UpdateApi update_api) async {
    var update = update_api.raw;
    if (update["message"] is Map) {
      var msg = update["message"] as Map;
      var chat_id = msg["chat"]["id"];
      if (msg["text"] is Map) {
        if (RegExp("/start", caseSensitive: false).hasMatch(msg["text"])) {
          return await tg.request("sendMessage", parameters: {
            "chat_id": chat_id,
            "text": "Hello world",
            "reply_markup": {
              "inline_keyboard": [
                [
                  {"text": "Telegram Client", "url": "https://github.com/azkadev/telegram_client"}
                ]
              ]
            }
          });
        }
      }
      return await tg.request("sendMessage", parameters: {"chat_id": chat_id, "text": json.encode(update)});
    }
  });
  await tg.initIsolate();
}
