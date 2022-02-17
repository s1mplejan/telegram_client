import 'package:telegram_client/telegram_client.dart';

void main() {
  var option = {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory':
        "/home/azkadev/Documents/telegram_client/dart/telegram_client/bin/bot",
    'files_directory':
        "/home/azkadev/Documents/telegram_client/dart/telegram_client/bin/bot"
  };
  var tdl = Tdlib("/home/azkadev/Desktop/azkauserrobot/libtdjson.so", option);
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
              "text": update.toString(),
              "entitiees": []
            },
            "disableWebPagePreview": false,
            "clearDraft": false
          }
        };
        var anu = tdl.clientSend(option);
        print(anu);
      }
    }
  });
}
