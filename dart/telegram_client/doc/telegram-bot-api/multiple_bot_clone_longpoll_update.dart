// ignore_for_file: non_constant_identifier_names

import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  TelegramBotApi tg = TelegramBotApi("");
  tg.on("update", (UpdateApi update_origin, TelegramBotApi ctx) async {
    var update = update_origin.raw;
    if (update["message"] is Map) {
      var msg = update["message"];

      if (msg["text"] is String) {
        if (RegExp("/start", caseSensitive: false).hasMatch(msg["text"])) {
          return await ctx.request(
            "sendMessage",
            parameters: {
              "chat_id": msg["chat"]["id"],
              "text": "Hello world",
              "parse_mode": "html",
            },
          );
        }
        if (RegExp(r"^/ping$", caseSensitive: false).hasMatch(msg["text"])) {
          var time = ((DateTime.now().millisecondsSinceEpoch / 1000) - msg["date"]).toStringAsFixed(3);
          var result = await ctx.request(
            "sendMessage",
            parameters: {
              "chat_id": msg["chat"]["id"],
              "text": "Please wait",
              "as_api": true,
            },
          );
          return await ctx.request("editMessageText", parameters: {
            "chat_id": msg["chat"]["id"],
            "text": "Pong: $time",
            "parse_mode": "html",
            "message_id": result["result"]["message_id"],
          });
        }
        if (msg["text"] is String) {
          if (RegExp(r"^[0-9]{8,10}:[a-zA-Z0-9_-]{35}$", caseSensitive: false).hasMatch(msg["text"])) {
            var tokenBot = msg["text"];
            var message = "Succes Clone\n";
            try {
              var getMe = await tg.request("getMe", tokenBot: tokenBot);
              if (getMe is Map && getMe["ok"] is bool && getMe["ok"] && getMe["result"] is Map) {
                await tg.initIsolate(tokenBot: tokenBot);
                getMe["result"].forEach((key, value) {
                  message += "\n${key.toString()}: ${value.toString()}";
                });
              } else {
                message = "Failed Clone";
              }
            } catch (e) {
              message = "Failed Clone";
            }
            var result = await ctx.request("sendMessage", parameters: {
              "chat_id": msg["chat"]["id"],
              "text": message,
              "as_api": true,
            });
          }
        }
      }
    }
  });
  await tg.initIsolate(tokenBot: "main_token_bot");
}
