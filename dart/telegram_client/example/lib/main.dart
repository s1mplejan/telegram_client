import 'package:example/tdlib/core.dart';
import 'package:flutter/material.dart';
import 'package:telegram_client/telegram_client.dart';
import 'dart:convert';
import 'package:switchscript/switchscript.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Azka Dev",
      home: SplashSreen(),
    ),
  );
}

class SplashSreen extends StatefulWidget {
  const SplashSreen({Key? key}) : super(key: key);
  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<SplashSreen> {
  bool hashAccount = false;
  bool hashSign = false;
  var anuText = "hlo";
  var updateTotal = 0;
  var tdl = Tdlib("/home/azkadev/Documents/azka-userbot/libtdjson.so", {
    'api_id': 0,
    'api_hash': 'api',
    'database_directory': "/home/azkadev/tdl/bin/test",
    'files_directory': "/home/azkadev/tdl/bin/test",
    "database_key": "azka"
  });

  @override
  void initState() {
    super.initState();
    tdl.clientSend({
      "@type": "checkAuthenticationBotToken",
      "token": "token"
    });
    setState(() {
      hashSign = true;
    });
  }

  Stream<dynamic> api() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 10));
      var d = tdl.clienReceive();
      yield d;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<dynamic>(
        stream: api(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("No Connections");
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (ifjs(snapshot.data)) {
                  var update = json.decode(snapshot.data);
                  if (update["@type"] == "updateNewMessage" &&
                      update["message"]["@type"] == "message") {
                    var msg = update["message"];
                    var chatId = msg["chat_id"];
                    if (!msg["is_outgoing"]) {
                      if (msg["content"]["@type"] == "messageText" &&
                          msg["content"]["text"]["@type"] == "formattedText") {
                        var text = msg["content"]["text"]["text"].toString();
                        anuText = text;
                        if (text == "/jsondump") {
                          var option = {
                            "@type": "sendMessage",
                            "chat_id": chatId,
                            "input_message_content": {
                              "@type": "inputMessageText",
                              "text": {
                                "@type": "formattedText",
                                "text": JSON.stringify(msg, null, 2),
                                "entitiees": []
                              },
                              "disableWebPagePreview": false,
                              "clearDraft": false
                            }
                          };
                          tdl.clientSend(option);
                        }
                        var option = {
                          "@type": "sendMessage",
                          "chat_id": chatId,
                          "input_message_content": {
                            "@type": "inputMessageText",
                            "text": {
                              "@type": "formattedText",
                              "text": text,
                              "entitiees": []
                            },
                            "disableWebPagePreview": false,
                            "clearDraft": false
                          }
                        };
                        tdl.clientSend(option);
                      }
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
                      tdl.clientSend(option);
                    }
                  }
                }
                break;
              default:
            }
          }
          return Text(anuText);
        },
      ),
    );
  }
}
