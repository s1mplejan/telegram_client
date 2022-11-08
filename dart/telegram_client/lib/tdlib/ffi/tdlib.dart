// ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_type_check, void_checks, unnecessary_brace_in_string_interps

// ignore: slash_for_doc_comments
/**
Licensed under the MIT License <http://opensource.org/licenses/MIT>.
SPDX-License-Identifier: MIT
Copyright (c) 2021 Azkadev Telegram Client <http://github.com/azkadev/telegram_client>.
Permission is hereby  granted, free of charge, to any  person obtaining a copy
of this software and associated  documentation files (the "Software"), to deal
in the Software  without restriction, including without  limitation the rights
to  use, copy,  modify, merge,  publish, distribute,  sublicense, and/or  sell
copies  of  the Software,  and  to  permit persons  to  whom  the Software  is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE  IS PROVIDED "AS  IS", WITHOUT WARRANTY  OF ANY KIND,  EXPRESS OR
IMPLIED,  INCLUDING BUT  NOT  LIMITED TO  THE  WARRANTIES OF  MERCHANTABILITY,
FITNESS FOR  A PARTICULAR PURPOSE AND  NONINFRINGEMENT. IN NO EVENT  SHALL THE
AUTHORS  OR COPYRIGHT  HOLDERS  BE  LIABLE FOR  ANY  CLAIM,  DAMAGES OR  OTHER
LIABILITY, WHETHER IN AN ACTION OF  CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE  OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 
**/

import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:convert' as convert;
import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:universal_io/io.dart';
import 'package:ffi/ffi.dart' as pkgffi;
import 'dart:isolate';
import "package:telegram_client/telegram_client.dart";

/// Cheatset
///
/// ```dart
/// Tdlib tg = Tdlib("libtdjson.so", {
///   "api_id": 121315,
///   "api_hash": "saskaspasad"
/// });
/// tg.on("update", (UpdateTd update) async {
///   print(update.raw);
/// });
/// tg.initIsolate();
/// ````
///
class LibTdJson {
  late Map client_option = {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory': "",
    'files_directory': "",
    "use_file_database": true,
    "use_chat_info_database": true,
    "use_message_database": true,
    "use_secret_chats": true,
    'enable_storage_optimizer': true,
    'system_language_code': 'en',
    'new_verbosity_level': 0,
    'application_version': 'v1',
    'device_model': 'Telegram Client HexaMinate @azkadev Galaxeus',
    'system_version': Platform.operatingSystemVersion,
    "database_key": "",
    "start": true,
  };
  final String pathTdl;
  late bool is_android = Platform.isAndroid;
  late List<TdlibClient> clients = [];
  late int client_id = 0;
  late String event_invoke = "invoke";
  late String event_update = "update";
  late EventEmitter event_emitter = EventEmitter();
  late Duration delay_update = Duration(milliseconds: 1);
  late Duration delay_invoke = Duration(milliseconds: 1);
  late double timeOutUpdate;
  LibTdJson(
    this.pathTdl, {
    Map? clientOption,
    this.event_invoke = "invoke",
    this.event_update = "update",
    EventEmitter? eventEmitter,
    Duration? delayUpdate,
    this.timeOutUpdate = 1.0,
    Duration? delayInvoke,
  }) {
    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }

    if (clientOption != null) {
      client_option.addAll(clientOption);
      if (clientOption["is_android"] == true) {
        is_android = true;
      }
    }
  }

  Future<void> init() async {
    return;
  }

  DynamicLibrary get tdLib {
    if (Platform.isIOS || Platform.isMacOS) {
      return DynamicLibrary.process();
    } else {
      return DynamicLibrary.open(pathTdl);
    }
  }

  /// create client id for multi client
  int client_create() {
    return tdLib
        .lookupFunction<ffi.Pointer Function(), ffi.Pointer Function()>(
            '${is_android ? "_" : ""}td_json_client_create')
        .call()
        .address;
  }

  /// client_send
  void client_send(int clientId, [Map? parameters]) {
    return tdLib
        .lookupFunction<
                ffi.Void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>),
                void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>(
            '${is_android ? "_" : ""}td_json_client_send')
        .call(ffi.Pointer.fromAddress(clientId),
            convert.json.encode(parameters).toNativeUtf8());
  }

  /// client_execute
  Map<String, dynamic> client_execute(int clientId, [Map? parameters]) {
    return convert.json.decode(tdLib
        .lookupFunction<
                ffi.Pointer<pkgffi.Utf8> Function(
                    ffi.Pointer, ffi.Pointer<pkgffi.Utf8>),
                ffi.Pointer<pkgffi.Utf8> Function(
                    ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>(
            '${is_android ? "_" : ""}td_json_client_execute')
        .call(ffi.Pointer.fromAddress(clientId),
            convert.json.encode(parameters).toNativeUtf8())
        .toDartString());
  }

  /// client_destroy
  void client_destroy(int clientId) {
    return tdLib
        .lookupFunction<
            ffi.Void Function(ffi.Pointer),
            void Function(
                ffi.Pointer)>('${is_android ? "_" : ""}td_json_client_destroy')
        .call(ffi.Pointer.fromAddress(clientId));
  }

  /// fetch update
  Map<String, dynamic>? client_receive(int clientId, [double timeout = 1.0]) {
    try {
      Pointer<pkgffi.Utf8> update = tdLib
          .lookupFunction<
              ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Double),
              ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer,
                  double)>('${is_android ? "_" : ""}td_json_client_receive')
          .call(ffi.Pointer.fromAddress(clientId), timeout);
      if (update.address != 0 &&
          update.toDartString() is String &&
          update.toDartString().toString().isNotEmpty) {
        Map<String, dynamic>? updateOrigin;
        try {
          updateOrigin = convert.json.decode(update.toDartString());
        } catch (e) {}
        if (updateOrigin != null) {
          return updateOrigin;
        }
      }
    } catch (e) {}
    return null;
  }

  /// add this for multithread on flutter apps
  Future<void> initIsolate({
    int? clientId,
    Map? clientOption,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    clientId ??= client_id;
    var client_new_option = client_option;
    if (clientOption != null) {
      client_new_option.addAll(clientOption);
    }
    ReceivePort receivePort = ReceivePort();
    receivePort.listen((message) async {
      try {
        if (message[0] is Map && message[0]["@extra"] is String) {
          event_emitter.emit(event_invoke, null, message);
        } else {
          event_emitter.emit(event_update, null, message);
        }
      } catch (e) {
        event_emitter.emit(event_update, null, message);
      }
    });

    Isolate isolate = await Isolate.spawn(
      (List args) async {
        SendPort sendPortToMain = args[0];
        Map option = args[1];
        int clientId = args[2];
        String pathTdl = args[3];
        Duration duration = args[5];
        double timeout = args[6];
        Tdlib tg = Tdlib(pathTdl, clientOption: option, clientId: clientId);
        while (true) {
          await Future.delayed(duration);
          var updateOrigin = tg.client_receive(clientId, timeout);
          if (updateOrigin != null) {
            sendPortToMain.send([updateOrigin, clientId, option]);
          }
        }
      },
      [
        receivePort.sendPort,
        client_new_option,
        clientId,
        pathTdl,
        is_android,
        delay_update,
        timeOutUpdate,
      ],
      onExit: receivePort.sendPort,
      onError: receivePort.sendPort,
    ).catchError((onError) {
      print("eror");
    });
    clients.add(TdlibClient(
      client_id: clientId,
      isolate: isolate,
      receive_port: receivePort,
    ));
  }

  // // exit
  // bool exitClient(
  //   int clientId, {
  //   bool isClose = false,
  //   String? extra,
  // }) {
  //   for (var i = 0; i < clients.length; i++) {
  //     TdlibClient tdlibClient = clients[i];
  //     if (tdlibClient.client_id == clientId) {
  //       // if (isClose) {
  //       //   invoke(
  //       //     "close",
  //       //     clientId: clientId,
  //       //     extra: extra,
  //       //   ).catchError((onError) {});
  //       // }
  //       tdlibClient.close();
  //       clients.removeAt(i);
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  /// add this for multithread new client on flutter apps
  Future<void> initIsolateNewClient(
      {required int clientId, required Map clientOption}) async {
    await Future.delayed(Duration(seconds: 2));
    client_option.addAll(clientOption);
    await initIsolate(clientId: clientId, clientOption: client_option);
  }
}

/// add state data
class TdlibClient {
  late int client_id;
  late Isolate isolate;
  late ReceivePort receive_port;
  late DateTime join_date = DateTime.now();

  /// state add data
  TdlibClient({
    required this.client_id,
    required this.isolate,
    required this.receive_port,
  });

  /// close
  void close() {
    isolate.kill();
    try {
      receive_port.close();
    } catch (e) {}
  }
}
