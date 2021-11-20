import 'package:telegram_client/telegram_client.dart';

void main() {
  var option = {
    'api_id': 0,
    'api_hash': '',
    'database_directory': "",
    'files_directory': ""
  };
  var tdl = Tdlib("/home/azkadev/Documents/azka-userbot/libtdjson.so", option);
  tdl.on((update) async {
    if (update["@type"] == "updateNewMessage" &&
        update["message"]["@type"] == "message") {
      var msg = update["message"];
      var chatId = msg["chat_id"];
      if (!msg["is_outgoing"]) {
        var option = {
          "@type": "sendMessage",
          "chat_id": chatId,
          "input_message_content": {
            "@type": "inputMessageText",
            "text": {
              "@type": "formattedText",
              "text": "hello world",
              "entitiees": []
            },
            "disableWebPagePreview": false,
            "clearDraft": false
          }
        };
        return tdl.clientSend(option);
      }
    }
  });
}
