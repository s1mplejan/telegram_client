import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexaminate/hexaminate.dart';
import 'dart:isolate';
import 'package:telegram_client/telegram_client.dart';
import 'dart:io';

import 'package:stream_channel/isolate_channel.dart';

String path = Directory.current.path;
void main() async {
  var option = {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory': "$path/bost",
    'files_directory': "$path/bost",
  };

  Tdlib tg = Tdlib("libtdjson.so", {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory': "/data/data/com.example.example/files/bost",
    'files_directory': "/data/data/com.example.example/files/bost",
  });
  tg.initIsolate();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', tg: tg,),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.tg})
      : super(key: key);
  final String title;
  final Tdlib tg;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    widget.tg.on("update", (UpdateTd update) async {
      if (update.message.is_found) {
        if (update.message.text != null) {
          if (update.message.text!.isNotEmpty) {}
          if (RegExp("^/ping", caseSensitive: false)
              .hasMatch(update.message.text ?? "")) {
            widget.tg.requestSendApi("sendMessage", parameters: {
              "chat_id": update.message.chat.id,
              "input_message_content": {
                "@type": "inputMessageText",
                "text": {
                  "@type": "formattedText",
                  "text": "pong",
                  "entitiees": []
                },
                "disableWebPagePreview": false,
                "clearDraft": false
              }
            }, onSucces: (result) {
              print(result);
            });
          }
          if (update.message.text == "/start") {}
        }
      }
    });
    widget.tg.bot("2123043767:AAEY0KTdVYo0JTRmFF5S4QPBnvoCdpe2yPI");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: const Center(child: Text("hello")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("azka");
          widget.tg.requestSendApi("getMe", parameters: {}, onSucces: (result) {
            print(result);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
