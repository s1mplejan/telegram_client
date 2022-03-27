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
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ReceivePort port;
  late Isolate isolate;
  SendPort? _isolateSendPort;

  @override
  void initState() {
    super.initState();
    port = ReceivePort();
    Isolate.spawn((SendPort sendPort) async {
      if (Platform.isAndroid) {
        path = "/data/data/com.example.example/files";
      }
      ReceivePort receivePort = ReceivePort();
      sendPort.send(receivePort.sendPort);
      receivePort.listen((message) {});


      var option = {
        'api_id': 1917085,
        'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
        'database_directory': "$path/bost",
        'files_directory': "$path/bost",
      };
      Tdlib tg = Tdlib("libtdjson.so", option);
      tg.on("update", (UpdateTd update) async {
        if (update.message.is_found) {
          if (update.message.text != null) {
            if (update.message.text!.isNotEmpty) {
              sendPort.send(update.message.text);
            }
            if (RegExp("^/ping", caseSensitive: false)
                .hasMatch(update.message.text ?? "")) {
              tg.emitter.emit("update", null, {"@type": "azka"});
              return await tg.request("sendMessage",
                  {"chat_id": update.message.chat.id, "text": "Pong!!"});
            }
            if (update.message.text == "/start") {
              return await tg.request("sendMessage", {
                "chat_id": update.message.chat.id,
                "text": "Hello saya adalah bot"
              });
            }
          }
        }
      });
      await tg.bot("2123043767:AAEY0KTdVYo0JTRmFF5S4QPBnvoCdpe2yPI");
      
    }, port.sendPort)
        .then((value) {
      setState(() {
        isolate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: port,
          initialData: "NoData",
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data is SendPort) {
              _isolateSendPort = snapshot.data;
            }
            print(snapshot.data is SendPort);
            return Container(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
