import 'package:telegram_client/telegram_client.dart';
import 'dart:ffi';
import 'dart:convert';

void main() {
  var tdl = Tdlib("/home/azkadev/Documents/azka-userbot/libtdjson.so");

  var optin = {'@type': 'setTdlibParameters', 'parameters': tdl.optionDefault};
  Pointer client = tdl.client_create();
  tdl.clientSend(
      client, {"@type": "setLogVerbosityLevel", "new_verbosity_level": 0});
  tdl.clientSend(client, optin);
  var jsonend = {'@type': 'checkDatabaseEncryptionKey', 'encryption_key': ""};
  tdl.clientSend(client, jsonend);
  var num = 0;
  /*
  var jsonsnd = {
    '@type': 'setAuthenticationPhoneNumber',
    'phone_number': '',
    'settings': {
      'allow_flash_call': false,
      'is_current_phone_number': false,
      'allow_sms_retriever_api': false
    }
  };
  tdl.clientSend(client, jsonsnd);
  */
  var requestLogin = 0;
  while (num == 0) {
    var update = tdl.clienReceive(client, 10.0);
    if (update.isNotEmpty) {
      var updateMessage = json.decode(update);
      print(updateMessage);
      if (requestLogin == 0) {
        requestLogin++;
        var jsonsnd = {
          '@type': 'checkAuthenticationBotToken',
          'token': 'tokenbot'
        };
        tdl.clientSend(client, jsonsnd);
      }
      if (updateMessage["@type"] == "updateNewMessage" &&
          updateMessage["message"]["@type"] == "message") {
        var msg = updateMessage["message"];
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
          tdl.clientSend(client, option);
        }
      }
    }
  }
  /*
  
  tdl.client_destroy(client);
  
  */
}
