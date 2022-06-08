import 'dart:io';
import 'dart:isolate';

import 'package:easy_isolate/easy_isolate.dart';
import 'package:telegram_client/telegram_client.dart';

String path = Directory.current.path;

void main() async {
  final worker = Worker();
  await worker.init(mainHandler, isolateHandler, exitHandler: (data) {
    print(data);
  });

  Tdlib tg = Tdlib("libtdjson.so", {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory':
        /*"/data/data/com.example.example/files/bost"*/ "$path/bost",
    'files_directory':
        /*"/data/data/com.example.example/files/bost"*/ "$path/bost",
  }); 
  worker.sendMessage(tg.clien.address);
}

void mainHandler(dynamic data, SendPort isolateSendPort) {
  print("Main: $data");
}

void isolateHandler(
    dynamic data, SendPort mainSendPort, SendErrorFunction onSendError) {
  print("isolate: $data");
}
