# Telegram Bot Api

## cheat sheet

- Multiple clone bot long poll update
```dart
  if (msg["text"] is String) {
    if (RegExp(r"^[0-9]{8,10}:[a-zA-Z0-9_-]{35}$", caseSensitive: false).hasMatch(msg["text"])) {
      var tokenBot = msg["text"];
      var message = "Succes Clone\n";
      try {
        var getMe = await tg.request("getMe", tokenBot: tokenBot);
        if (getMe is Map && getMe["ok"] is bool && getMe["ok"] && getMe["result"] is Map) {
          await tg.initIsolate(tokenBot: msg["text"]);
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
```