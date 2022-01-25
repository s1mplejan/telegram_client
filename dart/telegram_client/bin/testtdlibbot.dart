import 'package:telegram_client/telegram_client.dart';

void main() {
  var option = {
    'api_id': 94575,
    'api_hash': 'a3406de8d171bb422bb6ddf3bbd800e2',
    'database_directory': "/home/azkadev/Documents/telegram_client/dart/telegram_client/bin",
    'files_directory': "/home/azkadev/Documents/telegram_client/dart/telegram_client/bin"
  };
  var tdl = Tdlib("/home/azkadev/Desktop/azkauserrobot/libtdjson.so", option);
  tdl.on((update) async {
    print(update);
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
