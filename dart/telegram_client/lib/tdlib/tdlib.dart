// ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_type_check, void_checks

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

import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:math';
import 'dart:isolate';
import 'dart:convert' as convert;
import 'package:universal_io/io.dart';
import 'package:ffi/ffi.dart' as pkgffi;
import 'package:hexaminate/hexaminate.dart';

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
class Tdlib {
  final String pathTdl;

  late Map client_option = {
    '@type': 'tdlibParameters',
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
    'device_model': 'Telegram Client HexaMinate',
    'system_version': Platform.operatingSystemVersion,
    "database_key": "",
    "start": true,
  };
  late int client_id = 0;
  bool is_stop = false;
  bool is_android = Platform.isAndroid;
  EventEmitter emitter = EventEmitter();
  late int count_request_loop = 0;
  late Duration delay_update = Duration(milliseconds: 1);
  late double timeOutUpdate;
  bool starting = false;
  Completer? stopping;
  bool running = false;
  bool get isRunning => running;
  late List state_data = [];
  late ffi.DynamicLibrary TdlibPathFile = ffi.DynamicLibrary.process();

  /// Cheatset
  ///
  /// ```dart
  /// Tdlib tg = Tdlib("libtdjson.so", {
  ///   "api_id": 121315,
  ///   "api_hash": "saskaspasad"
  ///   'api_id': 1917085,
  ///   'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
  ///   'database_directory': "",
  ///   'files_directory': "",
  ///   "use_file_database": true,
  ///   "use_chat_info_database": true,
  ///   "use_message_database": true,
  ///   "use_secret_chats": true,
  ///   'enable_storage_optimizer': true,
  ///   'system_language_code': 'en',
  ///   'new_verbosity_level': 0,
  ///   'application_version': 'v1',
  ///   'device_model': 'Telegram Client HexaMinate',
  ///   'system_version': Platform.operatingSystemVersion,
  ///   "database_key": "",
  ///   "start": true,
  /// });
  /// ````
  ///
  /// More configuration [Tdlib-Parameters](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tdlib_parameters.html)
  Tdlib(
    this.pathTdl, {
    Map? clientOption,
    int? clientId,
    this.count_request_loop = 10000000,
    Duration? delayUpdate,
    this.timeOutUpdate = 1.0,
  }) {
    if (delayUpdate != null) {
      delay_update = delayUpdate;
    }
    TdlibPathFile = ffi.DynamicLibrary.open(pathTdl);
    if (clientOption != null) {
      client_option.addAll(clientOption);
      if (clientOption["is_android"] == true) {
        is_android = true;
      }
    }
    if (clientId != null) {
      client_option["start"] = false;
      client_id = clientId;
    }
    if (client_option['new_verbosity_level'] is int == false) {
      client_option['new_verbosity_level'] = 0;
    }
    if (client_option["start"] is bool && client_option["start"]) {
      invokeSync("setLogVerbosityLevel", parameters: {
        "new_verbosity_level": client_option['new_verbosity_level'],
      });
      client_id = client_create();
      start();
    }
  }

  /// getMessage real like bot api
  num getMessageId(num message_id, [bool is_reverse = false]) {
    if (is_reverse) {
      return (message_id ~/ 1048576);
    } else {
      return (message_id * 1048576).toInt();
    }
  }

  /// if you don't like set authtdlib you can call this method by default this automatically start
  void start({int? clientId}) {
    clientId ??= client_id;
    on("update", (UpdateTd update) async {
      try {
        Map updateOrigin = update.raw;
        if (update.raw["@type"] == "updateAuthorizationState") {
          if (update.raw["authorization_state"] is Map) {
            if (client_id == update.client_id) {
              await initClient(
                update,
                clientId: update.client_id,
                tdlibParameters: update.client_option,
              );
            }
          }
        }

        if (updateOrigin["@type"] == "updateConnectionState" && updateOrigin["state"]["@type"] == "connectionStateReady") {}
      } catch (e) {
        print(e);
      }
    });
  }

  /// add this for multithread on flutter apps
  Future<void> initIsolate({int? clientId, Map? clientOption}) async {
    await Future.delayed(Duration(seconds: 2));
    clientId ??= client_id;
    var client_new_option = client_option;
    if (clientOption != null) {
      client_new_option.addAll(clientOption);
    }
    ReceivePort receivePort = ReceivePort();
    receivePort.listen((message) async {
      emitter.emit("update", null, message);
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
      [receivePort.sendPort, client_new_option, clientId, pathTdl, is_android, delay_update, timeOutUpdate],
      onExit: receivePort.sendPort,
      onError: receivePort.sendPort,
    ).catchError((onError) {
      print("eror");
    });
    state_data.add({
      "client_id": clientId,
      "isolate": isolate,
      "receive_port": receivePort,
    });
  }

  // exit
  bool exit(int clientId, {bool isClose = false}) {
    for (var i = 0; i < state_data.length; i++) {
      var loop_data = state_data[i];
      if (loop_data is Map && loop_data["isolate"] is Isolate && loop_data["client_id"] == clientId) {
        if (isClose) {
          invoke("close", clientId: clientId).catchError((onError) {});
        }
        Isolate isolate = loop_data["isolate"] as Isolate;
        isolate.kill();
        try {
          ReceivePort receive_port = loop_data["receive_port"] as ReceivePort;
          receive_port.close();
        } catch (e) {}
        state_data.removeAt(i);
        return true;
      }
    }
    return false;
  }

  /// add this for multithread new client on flutter apps
  Future<void> initIsolateNewClient({required int clientId, required Map clientOption}) async {
    await Future.delayed(Duration(seconds: 2));
    // if (clientOption["database_directory"] is String && (clientOption["database_directory"] as String).isNotEmpty) {
    //   if (client_option["database_directory"] == clientOption["database_directory"]) {
    //     throw {
    //       "message": "initIsolateNewClient database_directory harus beda!",
    //     };
    //   } else {
    //     client_option["database_directory"] = clientOption["database_directory"];
    //   }
    // } else {
    //   throw {
    //     "message": "initIsolateNewClient database_directory harus isi!",
    //   };
    // }
    // if (clientOption["files_directory"] is String && (clientOption["files_directory"] as String).isNotEmpty) {
    //   if (client_option["files_directory"] == clientOption["files_directory"]) {
    //     throw {
    //       "message": "initIsolateNewClient files_directory harus beda!",
    //     };
    //   } else {
    //     client_option["files_directory"] = clientOption["files_directory"];
    //   }
    // } else {
    //   throw {
    //     "message": "initIsolateNewClient files_directory harus isi!",
    //   };
    // }
    client_option.addAll(clientOption);
    await initIsolate(clientId: clientId, clientOption: client_option);
  }

  /// create client id for multi client
  int client_create() {
    return TdlibPathFile.lookupFunction<ffi.Pointer Function(), ffi.Pointer Function()>('${is_android ? "_" : ""}td_json_client_create').call().address;
  }

  /// fetch update
  Map<String, dynamic>? client_receive(int? clientId, [double timeout = 1.0]) {
    clientId ??= client_id;
    try {
      var update = TdlibPathFile.lookupFunction<ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Double), ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, double)>('${is_android ? "_" : ""}td_json_client_receive').call(ffi.Pointer.fromAddress(clientId), timeout);
      if (update.address != 0 && update.toDartString() is String && update.toDartString().toString().isNotEmpty) {
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

  /// client_send
  void client_send(int? clientId, [Map? parameters]) {
    clientId ??= client_id;
    return TdlibPathFile.lookupFunction<ffi.Void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>), void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>('${is_android ? "_" : ""}td_json_client_send').call(ffi.Pointer.fromAddress(clientId), convert.json.encode(parameters).toNativeUtf8());
  }

  /// client_execute
  Map<String, dynamic> client_execute(int? clientId, [Map? parameters]) {
    clientId ??= client_id;
    return convert.json.decode(TdlibPathFile.lookupFunction<ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>), ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>('${is_android ? "_" : ""}td_json_client_execute').call(ffi.Pointer.fromAddress(clientId), convert.json.encode(parameters).toNativeUtf8()).toDartString());
  }

  /// client_destroy
  void client_destroy(int? clientId) {
    clientId ??= client_id;
    return TdlibPathFile.lookupFunction<ffi.Void Function(ffi.Pointer), void Function(ffi.Pointer)>('${is_android ? "_" : ""}td_json_client_destroy').call(ffi.Pointer.fromAddress(clientId));
  }

  /// add this for handle update api
  void on(String type_update, Function(UpdateTd update) callback, {void Function(Object data)? onError}) {
    if (!getBoolean(type_update)) {
      throw {};
    }
    if (type_update.toString().toLowerCase() == "update") {
      emitter.on("update", null, (Event ev, context) async {
        try {
          if (ev.eventData is List) {
            List jsonUpdate = (ev.eventData as List);
            return callback(UpdateTd(
              update: jsonUpdate[0],
              clientId: jsonUpdate[1],
              clientOption: jsonUpdate[2],
            ));
          }
        } catch (e) {
          print(e);
          if (onError != null) {
            return onError(e);
          }
        }
      });
    }
  }

  bool existClientId(int clientId) {
    for (var i = 0; i < state_data.length; i++) {
      var loop_data = state_data[i];
      if (loop_data is Map && loop_data["isolate"] is Isolate && loop_data["client_id"] == clientId) {
        return true;
      }
    }
    return false;
  }

  /// set up authorizationStateWaitTdlibParameters new client without more code
  Future<void> initClient(UpdateTd update, {Map? tdlibParameters, int? clientId, bool isVoid = false}) async {
    if (update.raw["authorization_state"] is Map) {
      var authStateType = update.raw["authorization_state"]["@type"];
      if (authStateType == "authorizationStateWaitTdlibParameters") {
        var optios = client_option;
        if (tdlibParameters != null) {
          optios.addAll(tdlibParameters);
        }
        await invoke(
          "setTdlibParameters",
          parameters: {
            "parameters": optios,
          },
          clientId: clientId,
          isVoid: isVoid,
        );
      }
      if (authStateType == "authorizationStateWaitEncryptionKey") {
        bool isEncrypted = update.raw["authorization_state"]['is_encrypted'];
        if (isEncrypted) {
          await invoke(
            "checkDatabaseEncryptionKey",
            parameters: {
              "encryption_key": convert.base64.encode(convert.utf8.encode(client_option["database_key"])),
            },
            clientId: clientId,
            isVoid: isVoid,
          );
        } else {
          await invoke(
            "setDatabaseEncryptionKey",
            parameters: {
              "new_encryption_key": convert.base64.encode(convert.utf8.encode(client_option["database_key"])),
            },
            clientId: clientId,
            isVoid: isVoid,
          );
        }
      }
    }
  }

  /// getRandom uuid for parameters @extra
  String getRandom(int length, {String? text}) {
    var ch = '0123456789abcdefghijklmnopqrstuvwxyz';
    if (text != null && text.isNotEmpty) {
      ch = text;
    }
    Random r = Random();
    return String.fromCharCodes(Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
  }

  /// convert api json method [bot api] to tdlib
  Map<String, dynamic> makeParametersApi(Map<String, dynamic> parameters) {
    Map<String, dynamic> jsonResult = {"@type": ""};
    try {
      String regexMethodSend = r"^(sendMessage|sendPhoto|sendVideo|sendAudio|sendVoice|sendDocument|sendSticker|sendAnimation|editMessage(Text))$";
      if (Regex(regexMethodSend, "i").exec(parameters["@type"])) {
        jsonResult["@type"] = "sendMessage";
        jsonResult["options"] = {
          "@type": "messageSendOptions",
        };
        parameters.forEach((key, value) {
          if (value is bool) {
            try {
              jsonResult["options"][key.toString()] = value;
            } catch (e) {}
          }
        });
        if (Regex("editMessage(Text)", "i").exec(parameters["@type"])) {
          jsonResult["@type"] = parameters["@type"];
        }
        jsonResult["input_message_content"] = {"@type": "inputMessageText", "disableWebPagePreview": false, "clearDraft": false};
        jsonResult["chat_id"] = parameters["chat_id"];
        if (parameters["disable_notification"] is bool) {
          jsonResult["disable_notification"] = parameters["reply_to_message_id"];
        }
        if (parameters["reply_to_message_id"] is int) {
          jsonResult["reply_to_message_id"] = parameters["reply_to_message_id"];
        }
        if (parameters["reply_markup"] is Map) {
          jsonResult["reply_markup"] = parameters["reply_markup"];
        }
        if (parameters["parse_mode"] is String) {
        } else {
          parameters["parse_mode"] = "";
        }
        if (parameters["entities"] is List == false) {
          parameters["entities"] = [];
        }
        if (parameters.containsKey("message_id")) {
          jsonResult["message_id"] = parameters["message_id"];
        }
        if (parameters.containsKey("reply_markup")) {
          jsonResult["reply_markup"] = reply_markup(parameters["reply_markup"]);
        }
        if (Regex(r"^(sendMessage|editMessageText)$", "i").exec(parameters["@type"])) {
          var text = parseMode(
            parameters["text"].toString(),
            parameters["parse_mode"],
            parameters["entities"],
          );
          jsonResult["input_message_content"]["@type"] = "inputMessageText";
          jsonResult["input_message_content"]["text"] = text;
        }
        if (Regex(r"^(sendPhoto)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["photo"]);
          jsonResult["input_message_content"]["@type"] = "inputMessagePhoto";
          jsonResult["input_message_content"]["photo"] = getDetailFile;
        }
        if (Regex(r"^(sendVoice)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["voice"]);
          jsonResult["input_message_content"]["@type"] = "inputMessageVoiceNote";
          jsonResult["input_message_content"]["voice_note"] = getDetailFile;
        }
        if (Regex(r"^(sendSticker)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["sticker"]);
          jsonResult["input_message_content"]["@type"] = "inputMessageSticker";
          jsonResult["input_message_content"]["sticker"] = getDetailFile;
        }
        if (Regex(r"^(sendAnimation)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["animation"]);
          jsonResult["input_message_content"]["@type"] = "inputMessageAnimation";
          jsonResult["input_message_content"]["animation"] = getDetailFile;
        }
        if (Regex(r"^(sendDocument)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["document"]);
          jsonResult["input_message_content"]["@type"] = "inputMessageDocument";
          jsonResult["input_message_content"]["document"] = getDetailFile;
        }
        if (Regex(r"^(sendAudio)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["audio"]);
          jsonResult["input_message_content"]["@type"] = "inputMessageAudio";
          jsonResult["input_message_content"]["audio"] = getDetailFile;
        }
        if (Regex(r"^(sendVideo)$", "i").exec(parameters["@type"])) {
          var getDetailFile = typeFile(parameters["video"]);
          jsonResult["input_message_content"]["@type"] = "inputMessageVideo";
          jsonResult["input_message_content"]["video"] = getDetailFile;
        }
        if (!Regex(r"^(sendMessage|sendLocation|sendSticker)$", "i").exec(parameters["@type"])) {
          if (parameters["caption"] != null) {
            var caption = parseMode(
              (parameters["caption"] != null) ? parameters["caption"].toString() : "",
              parameters["parse_mode"],
              parameters["entities"],
            );
            jsonResult["input_message_content"]["caption"] = caption;
          }
        }
        return jsonResult;
      }

      if (Regex(r"^answerInlineQuery$", "i").exec(parameters["@type"])) {
        parameters["@type"] = "answerInlineQuery";

        if (parameters["results"] is List) {
          List array_results = [];
          for (var i = 0; i < parameters["results"].length; i++) {
            Map loop_data = parameters["results"][i];

            if (loop_data["type"] is String) {
              loop_data["@type"] = loop_data["type"];
              loop_data.remove("type");
            }
            if (loop_data["id"] is String == false) {
              loop_data["id"] ??= "$i";
              loop_data["id"] = (loop_data["id"].toString());
            }

            if (loop_data["reply_markup"] is Map) {
              loop_data["reply_markup"] = (reply_markup(loop_data["reply_markup"]));
            }
            array_results.add(loop_data);
          }
          parameters["results"] = array_results;
        }
        return parameters;
      }

      return parameters;
    } catch (e) {
      return parameters;
    }
  }

  /// auto set parameters input file
  Map typeFile(String content) {
    Map data = {};
    if (Regex(r"^http", "i").exec(content)) {
      data = {"@type": 'inputFileRemote', "id": content};
    } else if (Regex(r"^(\/|\.\.?\/|~\/)", "i").exec(content)) {
      data = {"@type": 'inputFileLocal', "path": content};
    } else if (content is int) {
      data = {"@type": 'inputFileId', "id": content};
    } else {
      data = {"@type": 'inputFileRemote', "id": content};
    }
    return data;
  }

  /// parse text to html or markdown
  dynamic parseMode(String text, String? parse_mode, List? entities) {
    parse_mode ??= "";
    entities ??= [];
    dynamic pesan = {"text": text};
    var parseMode = 'textParseModeHTML';
    if (parse_mode is String) {
      parse_mode = parse_mode.toLowerCase();
      if (parse_mode == 'markdown') {
        parseMode = 'textParseModeMarkdown';
      } else if (parse_mode == 'html') {
        parseMode = 'textParseModeHTML';
      }
    }

    if (parse_mode is String) {
      try {
        pesan = client_execute(client_id, {
          "@type": 'parseTextEntities',
          "parse_mode": {"@type": parseMode},
          "text": text
        });
      } catch (e) {}
    }

    return pesan;
  }

  /// call api latest [Tdlib-Methods](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_function.html)
  /// example:
  /// ```dart
  /// invoke("sendMessage", {
  ///   "chat_id": 12345,
  ///   "input_message_content": {
  ///       "@type": "inputMessageText",
  ///       "text": {
  ///         "@type": "formattedText",
  ///         "text": "Hello world"
  ///       }
  ///   }
  /// });
  /// ```
  Future<dynamic> invoke(String method, {Map<String, dynamic>? parameters, int? clientId, bool isVoid = false}) async {
    clientId ??= client_id;
    if (clientId == 0) {
      clientId = client_id;
    }
    parameters ??= {};
    String random = getRandom(15);
    if (parameters is Map) {
      parameters["@extra"] = random;
    } else {
      parameters["@extra"] = random;
    }
    var requestMethod = {
      "@type": method,
      "client_id": clientId,
      ...parameters,
    };
    await Future.delayed(Duration(milliseconds: 1));
    client_send(
      clientId,
      requestMethod,
    );
    if (isVoid) {
      return;
    }
    var result = {};
    late int count = 0;
    on("update", (UpdateTd update) async {
      try {
        if (update.client_id == clientId) {
          Map updateOrigin = update.raw;
          if (updateOrigin["@extra"] == random) {
            updateOrigin.remove("@extra");
            result = updateOrigin;
          }
        }
      } catch (e) {
        result["@type"] = "error";
      }
    });

    while (true) {
      await Future.delayed(Duration(microseconds: 1));
      if (result["@type"] is String) {
        if (result["@type"] == "error") {
          result["invoke_request"] = requestMethod;
          throw result;
        }
        return result;
      }
      if (count >= count_request_loop) {
        result = {
          "@type": "error",
          "message": "time out limit",
          "invoke_request": requestMethod,
        };
        throw result;
      }
      count++;
    }
  }

  /// call api latest [Tdlib-Methods](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_function.html)
  /// example:
  /// ```dart
  /// invokeSync("sendMessage", {
  ///   "parse_mode": {
  ///     "@type": "textParseModeHTML"
  ///   },
  ///   "text": "<b>Hello</b> <code>word</code>"
  /// });
  /// ```
  Map invokeSync(String method, {Map<String, dynamic>? parameters, int? clientId}) {
    clientId ??= client_id;
    if (clientId == 0) {
      clientId = client_id;
    }
    parameters ??= {};
    String random = getRandom(15);
    if (parameters is Map) {
      parameters["@extra"] = random;
    } else {
      parameters["@extra"] = random;
    }
    var requestMethod = {
      "@type": method,
      "client_id": clientId,
      ...parameters,
    };

    var result = client_execute(clientId, requestMethod);

    if (result["@type"] == "error") {
      result["invoke_request"] = requestMethod;
      throw result;
    }
    return result;
  }

  /// call api getMe with return human api
  /// result:
  /// ```json
  /// {
  ///   "ok": true,
  ///   "result": {
  ///     "id": 12345,
  ///     "first_name": "Hello World",
  ///     "last_name": "Hello world",
  ///     "username": "azkadev",
  ///     "status": "recently",
  ///     "type_account": "user",
  ///     "type": "private",
  ///     "is_bot": false,
  ///     "language_code": "id",
  ///     "detail": {
  ///
  ///     }
  ///   }
  /// }
  /// ```
  Future<Map> getMe({required int? clientId}) async {
    clientId ??= client_id;
    var get_me = await invoke("getMe", clientId: clientId);
    Map result = {};
    result["id"] = get_me["id"];
    result["is_bot"] = false;
    result["first_name"] = get_me["first_name"];
    if (get_me["last_name"].toString().isNotEmpty) {
      result["last_name"] = get_me["last_name"];
    }
    if (get_me["username"].toString().isNotEmpty) {
      result["username"] = get_me["username"];
    }
    if (get_me["phone_number"].toString().isNotEmpty) {
      result["phone_number"] = get_me["phone_number"];
    }
    result["status"] = get_me["status"]["@type"].toString().toLowerCase().replace(Regex("userStatus", "i").run, "");
    result["type_account"] = get_me["type"]["@type"].toString().toLowerCase().replace(Regex("userType", "i").run, "");
    result["type"] = "private";
    if (result["type_account"] == "bot") {
      result["is_bot"] = true;
    }
    if (get_me["language_code"].toString().isNotEmpty) {
      result["language_code"] = get_me["language_code"];
    }
    result["detail"] = {};
    get_me.forEach((key, value) {
      if (value is bool) {
        result["detail"][key.toString()] = value;
      }
    });

    get_me["type"].forEach((key, value) {
      if (value is bool) {
        result["detail"][key.toString()] = value;
      }
    });

    try {
      if (get_me["profile_photo"] is Map) {
        result["profile_photo"] = {
          "id": get_me["profile_photo"]["id"],
          "path": "",
          "file_id": "",
        };
        if (get_me["profile_photo"]["big"] is Map) {
          (get_me["profile_photo"]["big"]["local"] as Map).forEach((key, value) {
            if (key != "@type") {
              result["profile_photo"][key.toString()] = value;
            }
          });
          if (get_me["profile_photo"]["big"]["remote"] is Map) {
            result["profile_photo"]["file_id"] = get_me["profile_photo"]["big"]["remote"]["id"];
          }
        }
      }
    } catch (e) {
      return {"ok": true, "result": result, "error": e};
    }

    return {"ok": true, "result": result};
  }

  /// convert reply markup from bot api to tdlib
  /// only support bot
  reply_markup(keyboard) {
    try {
      if (keyboard["inline_keyboard"] is List && keyboard["inline_keyboard"].length > 0) {
        Map json = {"@type": "replyMarkupInlineKeyboard"};
        List array_rows = [];
        for (var i = 0; i < keyboard["inline_keyboard"].length; i++) {
          var loop_array_keyboard = keyboard["inline_keyboard"][i];
          List array_loop = [];
          for (var ii = 0; ii < loop_array_keyboard.length; ii++) {
            var in_loop_array_keyboard = loop_array_keyboard[ii];
            Map in_json_keyboard = {"@type": "inlineKeyboardButton"};
            if (getBoolean(in_loop_array_keyboard["text"])) {
              in_json_keyboard["text"] = in_loop_array_keyboard["text"];
            }

            if (getBoolean(in_loop_array_keyboard["url"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeUrl", "url": in_loop_array_keyboard["url"]};
            }

            if (getBoolean(in_loop_array_keyboard["login_url"])) {
              in_json_keyboard["type"] = {
                "@type": "inlineKeyboardButtonTypeLoginUrl",
                "query": in_loop_array_keyboard["login_url"],
              };
            }
            if (getBoolean(in_loop_array_keyboard["callback_data"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeCallback", "data": buffer.from(in_loop_array_keyboard["callback_data"]).toStringEncode('base64')};
            }
            if (getBoolean(in_loop_array_keyboard["callback_data_password"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeCallbackWithPassword", "data": buffer.from(in_loop_array_keyboard["callback_data_password"]).toStringEncode('base64')};
            }

            if (getBoolean(in_loop_array_keyboard["switch_inline_query"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeSwitchInline", "query": in_loop_array_keyboard["switch_inline_query"], "in_current_chat": false};
            }

            if (getBoolean(in_loop_array_keyboard["switch_inline_query_current_chat"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeSwitchInline", "query": in_loop_array_keyboard["switch_inline_query_current_chat"], "in_current_chat": true};
            }
            if (getBoolean(in_loop_array_keyboard["callback_game"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeSwitchInline", "query": in_loop_array_keyboard["callback_game"], "in_current_chat": false};
            }
            if (getBoolean(in_loop_array_keyboard["user_id"])) {
              in_json_keyboard["type"] = {
                "@type": "inlineKeyboardButtonTypeUser",
                "user_id": in_loop_array_keyboard["user_id"],
              };
            }
            if (getBoolean(in_loop_array_keyboard["pay"])) {
              in_json_keyboard["type"] = {"@type": "inlineKeyboardButtonTypeBuy"};
            }
            array_loop.add(in_json_keyboard);
          }
          array_rows.add(array_loop);
        }
        json["rows"] = array_rows;
        return json;
      }
    } catch (e) {
      return null;
    }
  }

  /// call api more pretty and
  /// example:
  /// ```dart
  /// request("sendMessage", {
  ///   "chat_id": 123456,
  ///   "text": "<b>Hello</b> <code>word</code>",
  ///   "parse_mode": "html"
  /// });
  request(String method, {Map? parameters, int? clientId, bool isVoid = false}) async {
    clientId ??= client_id;
    parameters ??= {};
    if (parameters["chat_id"] is String && Regex(r"^(@)?[a-z0-9_]+", "i").exec(parameters["chat_id"])) {
      var search_public_chat = await invoke(
        "searchPublicChat",
        parameters: {
          "username": parameters["chat_id"],
        },
        clientId: clientId,
      );
      if (search_public_chat["@type"] == "chat") {
        parameters["chat_id"] = search_public_chat["id"];
      }
    }
    if (parameters["user_id"] is String && Regex(r"^(@)?[a-z0-9_]+", "i").exec(parameters["user_id"])) {
      var search_public_chat = await invoke(
        "searchPublicChat",
        parameters: {
          "username": parameters["user_id"],
        },
        clientId: clientId,
      );
      if (search_public_chat["@type"] == "chat") {
        parameters["user_id"] = search_public_chat["id"];
      }
    }
    String regexMethodSend = r"^(sendMessage|sendPhoto|sendVideo|sendAudio|sendVoice|sendDocument|sendSticker|sendAnimation|editMessageText)$";
    if (Regex(regexMethodSend, "i").exec(method)) {
      Map result_request = {"ok": false};
      result_request = await invoke((Regex("editMessageText", "i").exec(method)) ? method : "sendMessage",
          parameters: makeParametersApi(
            {
              "@type": method,
              ...parameters,
            },
          ),
          clientId: clientId,
          isVoid: isVoid);
      if (isVoid) {
        return;
      }
      result_request["ok"] ??= true;
      if (!result_request["ok"]) {
        throw result_request;
      }
      result_request.remove("ok");
      if (!parameters.containsKey("as_api")) {
        return result_request;
      }
      var result = {};
      on("update", (UpdateTd update) async {
        try {
          Map updateOrigin = update.raw;
          if (updateOrigin["@type"] == "updateMessageSendSucceeded") {
            if (updateOrigin["old_message_id"] == result_request["id"]) {
              var json_message = await jsonMessage(
                updateOrigin["message"],
                clientId: clientId,
              );
              if (json_message["ok"]) {
                json_message["result"]["@type"] = "updateNewMessage";
                result = json_message["result"];
              } else {
                json_message["result"]["@type"] = "error";
                result = json_message["result"];
              }
            }
          }
        } catch (e) {
          rethrow;
        }
      });
      while (true) {
        await Future.delayed(Duration(milliseconds: 1));
        if (result["@type"] is String) {
          if (result["@type"] == "error") {
            throw result;
          }
          result.remove("@type");
          return {"ok": true, "result": result};
        }
      }
    }
    if (Regex(r"^editMessageText$", "i").exec(method)) {
      return await editMessageText(parameters["chat_id"], parameters["message_id"], parameters["text"], parse_mode: (parameters["parse_mode"] ?? "" is String) ? parameters["parse_mode"] : "html", entities: (parameters["entities"] ?? [] is List) ? parameters["entities"] : [], disable_web_page_preview: (parameters["disable_web_page_preview"] ?? false is bool) ? parameters["disable_web_page_preview"] : false, replyMarkup: (parameters["reply_markup"] ?? {} is Map) ? parameters["reply_markup"] : {}, clientId: clientId);
    }
    if (Regex(r"^joinChat$", "i").exec(method)) {
      return await invoke("joinChat",
          parameters: {
            "chat_id": parameters["chat_id"],
          },
          clientId: clientId,
          isVoid: isVoid);
    }
    if (Regex(r"^joinChatByInviteLink$", "i").exec(method)) {
      return await invoke("joinChatByInviteLink",
          parameters: {
            "invite_link": parameters["invite_link"],
          },
          clientId: clientId,
          isVoid: isVoid);
    }

    if (Regex(r"^getChatMember$", "i").exec(method)) {
      return await getChatMember(
        parameters["chat_id"],
        parameters["user_id"],
        clientId: clientId,
      );
    }
    if (Regex(r"^getMe$", "i").exec(method)) {
      return await getMe(clientId: clientId);
    }
    if (Regex(r"^getChat$", "i").exec(method)) {
      return await getChat(parameters["chat_id"], is_detail: true, clientId: clientId);
    }
    if (Regex(r"^getChats$", "i").exec(method)) {
      var getChats = await invoke(
        "getChats",
        parameters: {
          "limit": 9999,
        },
        clientId: clientId,
      );
      if (getChats["@type"] == "chats") {
        List chat_ids = getChats["chat_ids"];
        List array_chat = [];
        for (var i = 0; i < chat_ids.length; i++) {
          await Future.delayed(Duration(milliseconds: 1));
          try {
            var get_chat = await getChat(chat_ids[i], is_detail: true, is_super_detail: true, clientId: clientId);
            if (get_chat["ok"]) {
              array_chat.add(get_chat["result"]);
            }
          } catch (e) {}
        }
        return {"ok": true, "result": array_chat};
      }
    }

    if (Regex(r"^getUser$", "i").exec(method)) {
      return await getUser(
        parameters["chat_id"],
        clientId: clientId,
      );
    }
    if (Regex(r"^answerCallbackQuery$", "i").exec(method)) {
      return await answerCallbackQuery(parameters["callback_query_id"], text: parameters["text"], show_alert: parameters["show_alert"] ?? false, url: parameters["url"], cache_time: parameters["cache_time"], clientId: clientId);
    }

    if (parameters["is_sync"] != null) {
      return invokeSync(
        method,
        parameters: makeParametersApi({
          "@type": method,
          ...parameters,
        }),
        clientId: clientId,
      );
    } else {
      return await invoke(method,
          parameters: makeParametersApi({
            "@type": method,
            ...parameters,
          }),
          clientId: clientId);
    }
  }

  /// getMessageDetail and convert to api:
  /// return example:
  /// ```json
  /// {
  ///   "update_message": {
  ///     "from": {
  ///     },
  ///     "chat": {
  ///     },
  ///     "text": "Hello world"
  ///   }
  /// }
  /// ```
  getMessage(dynamic chat_id, dynamic message_id, {bool is_detail = false, bool is_skip_reply_message = false, bool is_super_detail = false, required int? clientId}) async {
    clientId ??= client_id;
    var get_message = await invoke("getMessage",
        parameters: {
          "chat_id": chat_id,
          "message_id": message_id,
        },
        clientId: clientId);
    return await jsonMessage(
      get_message,
      is_detail: is_detail,
      is_super_detail: is_super_detail,
      is_skip_reply_message: is_skip_reply_message,
      clientId: clientId,
    );
  }

  /// editMessage text
  /// return result
  /// ```json
  /// {
  ///
  /// }
  /// ```
  editMessageText(dynamic chat_id, dynamic message_id, String text, {String parse_mode = "html", List? entities, bool disable_web_page_preview = false, Map? replyMarkup, required int? clientId}) async {
    clientId ??= client_id;
    entities ??= [];
    var pesan = parseMode(text, parse_mode, entities);
    var get_message = await invoke("editMessageText",
        parameters: {
          "chat_id": chat_id,
          "message_id": message_id,
          "reply_markup": reply_markup(replyMarkup),
          "input_message_content": {'@type': "inputMessageText", "text": pesan, "disable_web_page_preview": disable_web_page_preview, "clear_draft": false}
        },
        clientId: clientId);
    return get_message;
  }

  /// getChatMember
  /// return result
  /// ```json
  /// {
  ///   "ok":true,
  ///   "result": {
  ///   }
  /// }
  /// ```
  getChatMember(dynamic chat_id, dynamic user_id, {required int? clientId}) async {
    clientId ??= client_id;
    chat_id ??= 0;
    user_id ??= 0;
    if (Regex("^@.*", "i").exec(chat_id)) {
      var search_public_chat = await invoke("searchPublicChat",
          parameters: {
            "username": chat_id,
          },
          clientId: clientId);
      if (search_public_chat["@type"] == "chat") {
        chat_id = search_public_chat["id"];
      }
    }
    if (Regex("^@.*", "i").exec(user_id)) {
      var search_public_chat = await invoke("searchPublicChat",
          parameters: {
            "username": user_id,
          },
          clientId: clientId);
      if (search_public_chat["@type"] == "chat") {
        user_id = search_public_chat["id"];
      }
    }
    var get_chat_member = await invoke("getChatMember",
        parameters: {
          "chat_id": chat_id,
          "member_id": {
            "@type": "messageSenderUser",
            "user_id": user_id,
          }
        },
        clientId: clientId);

    if (Regex("^chatMember\$", "i").exec(get_chat_member["@type"])) {
      var json = {};

      var get_user = await getUser(
        get_chat_member["member_id"]["user_id"],
        clientId: clientId,
      );
      json["user"] = get_user["result"];
      json["join_date"] = get_chat_member["joined_chat_date"];
      var status = get_chat_member["status"];
      json["status"] = status["@type"].toString().toLowerCase().replace(Regex("chatmemberstatus", "ig").run, "");
      json["custom_title"] = status["custom_title"];
      json["can_be_edited"] = status["can_be_edited"];
      json["can_manage_chat"] = status["can_manage_chat"];
      json["can_change_info"] = status["can_change_info"];
      json["can_post_messages"] = status["can_post_messages"];
      json["can_edit_messages"] = status["can_edit_messages"];
      json["can_delete_messages"] = status["can_delete_messages"];
      json["can_invite_users"] = status["can_invite_users"];
      json["can_restrict_members"] = status["can_restrict_members"];
      json["can_pin_messages"] = status["can_pin_messages"];
      json["can_promote_members"] = status["can_promote_members"];
      json["can_manage_voice_chats"] = status["can_manage_voice_chats"];
      json["is_anonymous"] = status["is_anonymous"];
      return {"ok": true, "result": json};
    } else {
      return {"ok": false, "result": {}};
    }
  }

  /// getChat
  /// return result like bot api:
  /// {
  /// }
  getChat(dynamic chat_id, {bool is_detail = false, bool is_super_detail = false, bool is_more_detail = false, required int? clientId}) async {
    clientId ??= client_id;
    try {
      if (RegExp(r"^@.*$", caseSensitive: false).hasMatch(chat_id.toString())) {
        var search_public_chat = await invoke(
          "searchPublicChat",
          parameters: {
            "username": chat_id,
          },
          clientId: clientId,
        );
        if (search_public_chat["@type"] == "chat") {
          chat_id = search_public_chat["id"];
        }
      }
      var getchat = await invoke(
        "getChat",
        parameters: {
          "chat_id": chat_id,
        },
        clientId: clientId,
      );
      Map json = {};
      if (RegExp(r"^chat$", caseSensitive: false).hasMatch(getchat["@type"])) {
        var type_chat = getchat["type"]["@type"].toString().toLowerCase().replaceAll(RegExp("chattype", caseSensitive: false), "");

        if (type_chat == "supergroup") {
          var getSupergroup = await invoke(
            "getSupergroup",
            parameters: {"supergroup_id": int.parse(chat_id.toString().replaceAll(RegExp("^-100", caseSensitive: false), ""))},
            clientId: clientId,
          );
          json["id"] = chat_id;
          json["title"] = getchat["title"];
          if (getSupergroup["username"] is String) {
            json["username"] = getSupergroup["username"];
          }
          if (getSupergroup["status"] is Map) {
            json["status"] = getSupergroup["status"]["@type"].toString().toLowerCase().replaceAll(RegExp("chatMemberStatus", caseSensitive: false), "");
          }
          json["type"] = getchat["type"]["is_channel"] ? "channel" : "supergroup";
          json["detail"] = {"member_count": getSupergroup["member_count"], "administrator_count": 0, "restricted_count": 0, "banned_count": 0, "has_protected_content": getchat["has_protected_content"] ?? false, "is_marked_as_unread": getchat["is_marked_as_unread"] ?? false, "is_blocked": getchat["is_blocked"] ?? false, "has_scheduled_messages": getchat["has_scheduled_messages"] ?? false, "can_be_deleted_only_for_self": getchat["can_be_deleted_only_for_self"] ?? false, "can_be_deleted_for_all_users": getchat["can_be_deleted_for_all_users"] ?? false, "can_be_reported": getchat["can_be_reported"] ?? false, "default_disable_notification": getchat["default_disable_notification"] ?? false, "unread_count": getchat["unread_count"] ?? 0, "last_read_inbox_message_id": getchat["last_read_inbox_message_id"] ?? 0, "last_read_outbox_message_id": getchat["last_read_outbox_message_id"] ?? 0, "unread_mention_count": getchat["unread_mention_count"] ?? 0, "has_linked_chat": getSupergroup["has_linked_chat"], "has_location": getSupergroup["has_location"], "sign_messages": getSupergroup["sign_messages"], "is_slow_mode_enabled": getSupergroup["is_slow_mode_enabled"], "is_broadcast_group": getSupergroup["is_broadcast_group"], "is_verified": getSupergroup["is_verified"], "is_scam": getSupergroup["is_scam"], "is_fake": getSupergroup["is_fake"]};
          if (getSupergroup["username"].toString().isEmpty) {
            json.remove("username");
            json["type"] = getchat["type"]["is_channel"] ? "channel" : "group";
          }
          if (is_detail) {
            if (getchat["last_message"] is Map) {
              var last_message = await jsonMessage(
                getchat["last_message"],
                from_data: json,
                chat_data: json,
                clientId: clientId,
              );
              if (last_message["ok"]) {
                json["last_message"] = last_message["result"];
              }
            }
          }
          if (is_more_detail) {
            var getSuperGroupFullInfo = {};
            try {
              getSuperGroupFullInfo = await invoke(
                "getSupergroupFullInfo",
                parameters: {
                  "supergroup_id": int.parse(chat_id.toString().replaceAll(RegExp("^-100", caseSensitive: false), "")),
                },
                clientId: clientId,
              );
            } catch (e) {}
            if (getSuperGroupFullInfo["photo"] is Map) {
              json["profile_photo"] = {"id": getSuperGroupFullInfo["photo"]["id"], "path": "", "file_id": ""};
              if (getSuperGroupFullInfo["photo"]["@type"] == "chatPhoto") {
                if (getSuperGroupFullInfo["photo"]["sizes"] is List) {
                  try {
                    var getPhoto = getSuperGroupFullInfo["photo"]["sizes"][getSuperGroupFullInfo["photo"]["sizes"].length - 1];
                    var getPathPhoto = getPhoto["photo"]["local"]["path"] as String;
                    json["profile_photo"]["path"] = getPathPhoto;
                    (json["profile_photo"] as Map).addAll(getPhoto["photo"]["local"]);
                    json["profile_photo"]["file_id"] = getPhoto["photo"]["remote"]["id"];
                    json["profile_photo"]["file_unique_id"] = getPhoto["photo"]["remote"]["unique_id"];
                  } catch (e) {}
                }
              }
            }
            if (getSuperGroupFullInfo["description"] is String) {
              json["description"] = getSuperGroupFullInfo["description"];
            }
            try {
              getSuperGroupFullInfo.forEach((key, value) {
                if (key != "@type") {
                  try {
                    if (value is String) {
                      json["detail"][key.toString()] = value;
                    }
                    if (value is num) {
                      json["detail"][key.toString()] = value;
                    }
                    if (value is bool) {
                      json["detail"][key.toString()] = value;
                    }
                  } catch (e) {}
                }
              });
            } catch (e) {}

            if (json["profile_photo"] is Map && RegExp(r"^([0-9]+)$", caseSensitive: false).hasMatch(json["profile_photo"]["id"])) {
              try {
                json["profile_photo"]["id"] = (int.parse(json["profile_photo"]["id"]));
              } catch (e) {}
            }
          }

          return {"ok": true, "result": json};
        } else if (type_chat == "basicgroup") {
          var getBasicGroup = await invoke(
            "getBasicGroup",
            parameters: {
              "basic_group_id": int.parse(chat_id.toString().replaceAll(RegExp("^-", caseSensitive: false), "")),
            },
            clientId: clientId,
          );
          json["id"] = chat_id;
          json["title"] = getchat["title"];
          if (getBasicGroup["status"] is Map) {
            json["status"] = getBasicGroup["status"]["@type"].toString().toLowerCase().replaceAll(RegExp("chatMemberStatus", caseSensitive: false), "");
          }
          json["type"] = "group";
          json["detail"] = {
            "member_count": getBasicGroup["member_count"],
            "has_protected_content": getchat["has_protected_content"] ?? false,
            "is_marked_as_unread": getchat["is_marked_as_unread"] ?? false,
            "is_blocked": getchat["is_blocked"] ?? false,
            "has_scheduled_messages": getchat["has_scheduled_messages"] ?? false,
            "can_be_deleted_only_for_self": getchat["can_be_deleted_only_for_self"] ?? false,
            "can_be_deleted_for_all_users": getchat["can_be_deleted_for_all_users"] ?? false,
            "can_be_reported": getchat["can_be_reported"] ?? false,
            "default_disable_notification": getchat["default_disable_notification"] ?? false,
            "unread_count": getchat["unread_count"] ?? 0,
            "last_read_inbox_message_id": getchat["last_read_inbox_message_id"] ?? 0,
            "last_read_outbox_message_id": getchat["last_read_outbox_message_id"] ?? 0,
            "unread_mention_count": getchat["unread_mention_count"] ?? 0,
          };
          if (is_detail) {
            if (getchat["last_message"] is Map) {
              var last_message = await jsonMessage(
                getchat["last_message"],
                from_data: json,
                chat_data: json,
                clientId: clientId,
              );
              if (last_message["ok"]) {
                json["last_message"] = last_message["result"];
              }
            }
          }
          return {"ok": true, "result": json};
        } else if (type_chat == "private") {
          var get_user = await invoke(
            "getUser",
            parameters: {
              "user_id": chat_id,
            },
            clientId: clientId,
          );
          if (RegExp("^user\$", caseSensitive: false).hasMatch(get_user["@type"])) {
            var json = {};
            json["id"] = get_user["id"];
            try {
              if (RegExp("^userTypeBot\$", caseSensitive: false).hasMatch(get_user["type"]["@type"])) {
                json["is_bot"] = true;
              } else {
                json["is_bot"] = false;
              }
            } catch (e) {
              json["is_bot"] = false;
            }
            json["first_name"] = get_user["first_name"];
            if (getBoolean(get_user["last_name"])) {
              json["last_name"] = get_user["last_name"];
            }
            if (getBoolean(get_user["username"])) {
              json["username"] = get_user["username"];
            }
            if (getBoolean(get_user["phone_number"])) {
              json["phone_number"] = get_user["phone_number"];
            }
            if (getBoolean(get_user["language_code"])) {
              json["language_code"] = get_user["language_code"];
            }
            json["type"] = 'private';
            json["detail"] = {"has_protected_content": getchat["has_protected_content"] ?? false, "is_marked_as_unread": getchat["is_marked_as_unread"] ?? false, "is_blocked": getchat["is_blocked"] ?? false, "has_scheduled_messages": getchat["has_scheduled_messages"] ?? false, "can_be_deleted_only_for_self": getchat["can_be_deleted_only_for_self"] ?? false, "can_be_deleted_for_all_users": getchat["can_be_deleted_for_all_users"] ?? false, "can_be_reported": getchat["can_be_reported"] ?? false, "default_disable_notification": getchat["default_disable_notification"] ?? false, "unread_count": getchat["unread_count"] ?? 0, "last_read_inbox_message_id": getchat["last_read_inbox_message_id"] ?? 0, "last_read_outbox_message_id": getchat["last_read_outbox_message_id"] ?? 0, "unread_mention_count": getchat["unread_mention_count"] ?? 0, "is_contact": get_user["is_contact"], "is_mutual_contact": get_user["is_mutual_contact"], "is_verified": get_user["is_verified"], "is_support": get_user["is_support"], "is_scam": get_user["is_scam"], "is_fake": get_user["is_fake"], "have_acces": get_user["have_access"]};
            if (is_detail) {
              if (getchat["last_message"] is Map) {
                try {
                  var last_message = await jsonMessage(
                    getchat["last_message"],
                    from_data: json["from"],
                    chat_data: json["chat"],
                    clientId: clientId,
                  );
                  if (last_message["ok"]) {
                    json.addAll({"last_message": last_message["result"]});
                  }
                } catch (e) {}
              }
            }
            if (is_more_detail) {
              try {
                var getUserFullInfo = {};
                try {
                  getUserFullInfo = await invoke(
                    "getUserFullInfo",
                    parameters: {
                      "user_id": chat_id,
                    },
                    clientId: clientId,
                  );
                } catch (e) {}
                if (getUserFullInfo["photo"] is Map) {
                  json["profile_photo"] = {"id": getUserFullInfo["photo"]["id"], "path": "", "file_id": ""};
                  if (getUserFullInfo["photo"]["@type"] == "chatPhoto") {
                    if (getUserFullInfo["photo"]["sizes"] is List) {
                      try {
                        var getPhoto = getUserFullInfo["photo"]["sizes"][getUserFullInfo["photo"]["sizes"].length - 1];
                        var getPathPhoto = getPhoto["photo"]["local"]["path"] as String;
                        json["profile_photo"]["path"] = getPathPhoto;
                        (json["profile_photo"] as Map).addAll(getPhoto["photo"]["local"]);
                        json["profile_photo"]["id"] = getPhoto["photo"]["local"]["id"];
                        json["profile_photo"]["file_id"] = getPhoto["photo"]["remote"]["id"];
                        json["profile_photo"]["file_unique_id"] = getPhoto["photo"]["remote"]["unique_id"];
                      } catch (e) {}
                    }
                  }
                }
                if (getUserFullInfo["description"] is String) {
                  json["description"] = getUserFullInfo["description"];
                }
                try {
                  getUserFullInfo.forEach((key, value) {
                    if (key != "@type") {
                      try {
                        if (value is String) {
                          json["detail"][key.toString()] = value;
                        }
                        if (value is num) {
                          json["detail"][key.toString()] = value;
                        }
                        if (value is bool) {
                          json["detail"][key.toString()] = value;
                        }
                      } catch (e) {}
                    }
                  });
                } catch (e) {}

                if (json["profile_photo"] is Map && RegExp(r"^([0-9]+)$", caseSensitive: false).hasMatch(json["profile_photo"]["id"])) {
                  try {
                    json["profile_photo"]["id"] = (int.parse(json["profile_photo"]["id"]));
                  } catch (e) {}
                }
              } catch (e) {
                return {"ok": true, "result": json, "error": e};
              }
            }
            return {"ok": true, "result": json};
          }
        }
      }
    } catch (e) {
      if (RegExp("^[0-9]+\$", caseSensitive: false).hasMatch(chat_id.toString())) {
        try {
          return await getUser(
            chat_id,
            clientId: clientId,
          );
        } catch (e) {
          return {
            "ok": true,
            "result": {"id": chat_id, "type": "", "detail": {}}
          };
        }
      }
    }
    return {
      "ok": false,
      "result": {"id": chat_id, "detail": {}}
    };
  }

  /// answerCallbackQuery for bot only
  answerCallbackQuery(callback_query_id, {String? text, bool show_alert = false, String? url, int? cache_time, required int? clientId}) async {
    clientId ??= client_id;

    Map<String, dynamic> data = {"callback_query_id": callback_query_id};

    if (text != null) {
      data["text"] = text;
    }
    data["show_alert"] = show_alert;

    if (url != null) {
      data["url"] = url;
    }

    if (cache_time != null) {
      data["cache_time"] = cache_time;
    }

    return await invoke("answerCallbackQuery", parameters: data, clientId: clientId);
  }

  /// convert tdlib update to bot api for more humanize
  jsonMessage(Map update, {Map? from_data, Map? chat_data, bool is_detail = false, bool is_skip_reply_message = false, bool is_super_detail = false, bool is_more_detail = false, required int? clientId}) async {
    clientId ??= client_id;
    try {
      if (update["@type"] == "message") {
        Map json = {};
        Map chat_json = {"id": update["chat_id"], "first_name": "", "title": "", "type": "", "detail": {}, "last_message": {}};
        if (update["is_channel_post"] ?? false) {
          chat_json["type"] = "channel";
          chat_json["title"] = "";
        } else {
          if (Regex("^-100", "i").exec(update["chat_id"])) {
            chat_json["type"] = "supergroup";
            chat_json["title"] = "";
          } else if (Regex("^-", "i").exec(update["chat_id"])) {
            chat_json["type"] = "group";
            chat_json["title"] = "";
          } else {
            chat_json["type"] = "private";
          }
        }

        if (!is_super_detail) {
          if (chat_json["type"] != "private") {
            chat_json.remove("first_name");
          } else {
            chat_json.remove("title");
          }
        }

        bool is_chat_not_same = true;
        if (is_super_detail) {
          try {
            if (chat_data != null) {
              if (update["chat_id"] == chat_data["id"]) {
                is_chat_not_same = false;
                chat_json = chat_data;
              }
            }
          } catch (e) {}
          if (is_chat_not_same) {
            try {
              var chatResult = await getChat(update["chat_id"], is_detail: is_detail, is_super_detail: is_super_detail, is_more_detail: is_more_detail, clientId: clientId);
              if (chatResult["ok"]) {
                chat_json = chatResult["result"];
              }
            } catch (e) {}
          }
        }

        json["is_outgoing"] = update["is_outgoing"] ?? false;
        json["is_pinned"] = update["is_pinned"] ?? false;
        if (update["sender_id"] is Map) {
          Map from_json = {"id": 0, "first_name": "", "title": "", "type": "", "detail": {}, "last_message": {}};
          if (update["sender_id"]["user_id"] != null) {
            from_json["id"] = update["sender_id"]["user_id"];
            if (update["chat_id"] == from_json["id"]) {
              from_json["type"] = chat_json["type"];
            } else if (Regex("^-", "i").exec(from_json["chat_id"])) {
              from_json["type"] = "group";
            } else {
              from_json["type"] = "private";
            }

            if (is_super_detail) {
              if (update["chat_id"] == update["sender_id"]["user_id"]) {
                from_json = chat_json;
              } else {
                bool is_from_not_same = true;
                if (from_data != null) {
                  if (update["chat_id"] == from_data["id"]) {
                    is_from_not_same = false;
                    from_json = from_data;
                  }
                }
                if (is_from_not_same) {
                  try {
                    var fromResult = await getUser(
                      update["sender_id"]["user_id"],
                      clientId: clientId,
                    );
                    if (fromResult["ok"]) {
                      from_json = fromResult["result"];
                    }
                  } catch (e) {}
                }
              }
            }
          }

          if (update["sender_id"]["chat_id"] != null) {
            from_json["id"] = update["sender_id"]["chat_id"];
            if (update["chat_id"] == from_json["id"]) {
              from_json["type"] = chat_json["type"];
            } else if (Regex("^-", "i").exec(from_json["chat_id"])) {
              from_json["type"] = "group";
            } else {
              from_json["type"] = "private";
            }

            if (is_super_detail) {
              if (update["chat_id"] == update["sender_id"]["chat_id"]) {
                from_json = chat_json;
              } else {
                bool is_from_not_same = true;
                if (from_data != null) {
                  if (update["chat_id"] == from_data["id"]) {
                    is_from_not_same = false;
                    from_json = from_data;
                  }
                }
                if (is_from_not_same) {
                  try {
                    var fromResult = await getChat(
                      update["sender_id"]["chat_id"],
                      clientId: clientId,
                    );
                    if (fromResult["ok"]) {
                      from_json = fromResult["result"];
                    }
                  } catch (e) {}
                }
              }
            }
          }

          if (!is_super_detail) {
            if (from_json["type"] != "private") {
              from_json.remove("first_name");
            } else {
              from_json.remove("title");
            }
          }
          json["from"] = from_json;
        }

        json["chat"] = chat_json;
        json["date"] = update["date"];
        json["message_id"] = update["id"];
        json["api_message_id"] = getMessageId(update["id"], true);
        update.forEach((key, value) {
          try {
            if (value is bool) {
              json[key] = value;
            }
          } catch (e) {}
        });

        if (chat_json["type"] == "channel") {
          if (update["author_signature"].toString().isNotEmpty) {
            json["author_signature"] = update["author_signature"];
          }
        }

        if (update["forward_info"] is Map) {
          var forward_info = update["forward_info"];
          if (forward_info["origin"] is Map) {
            if (forward_info["origin"]["@type"] == "messageForwardOriginChannel") {
              Map forward_json = {"id": forward_info["origin"]["chat_id"], "first_name": "", "title": "", "type": "", "detail": {}, "last_message": {}};
              try {
                var getchat_forward = await getChat(forward_json["id"], clientId: clientId);
                if (getchat_forward["ok"]) {
                  forward_json = getchat_forward["result"];
                }
              } catch (e) {}
              json["forward_from_chat"] = forward_json;
              json["forward_from_message_id"] = forward_info["origin"]["message_id"] ?? 0;
              json["api_forward_from_message_id"] = getMessageId(json["forward_from_message_id"], true);
              json["forward_from_author_signature"] = forward_info["origin"]["author_signature"] ?? "";
            }
            if (forward_info["origin"]["@type"] == "messageForwardOriginUser") {
              Map forward_json = {"id": forward_info["origin"]["sender_user_id"], "first_name": "", "title": "", "type": "", "detail": {}, "last_message": {}};
              try {
                var getuser_forward = await getUser(
                  forward_json["id"],
                  clientId: clientId,
                );
                if (getuser_forward["ok"]) {
                  forward_json = getuser_forward["result"];
                }
              } catch (e) {}
              json["forward_from_chat"] = forward_json;
            }
          }
          json["forward_date"] = forward_info["date"] ?? 0;
        }

        update["reply_to_message_id"] ??= 0;
        update["reply_in_chat_id"] ??= 0;
        if (update["reply_to_message_id"] != 0 && update["reply_in_chat_id"] != 0 && !is_skip_reply_message) {
          try {
            var get_message = await getMessage(
              update["reply_in_chat_id"],
              update["reply_to_message_id"],
              is_detail: true,
              is_super_detail: true,
              clientId: clientId,
            );
            if (get_message["ok"]) {
              json["reply_to_message"] = get_message["result"];
              json["reply_to_message"]["message_id"] = json["reply_to_message"]["message_id"];
              json["reply_to_message"]["api_message_id"] = getMessageId(json["reply_to_message"]["message_id"], true);
            }
          } catch (e) {}
        }

        if (update["content"] is Map) {
          List old_entities = [];

          if (update["content"]["@type"] == "messageText") {
            json["type_content"] = "text";
            if (update["content"]["text"] is Map) {
              if (update["content"]["text"]["@type"] == "formattedText") {
                json["text"] = update["content"]["text"]["text"];
                old_entities = update["content"]["text"]["entities"];
              }
            }
          }

          if (update["content"]["@type"] == "messagePhoto") {
            json["type_content"] = "photo";
            if (update["content"]["photo"] is Map) {
              if (update["content"]["photo"]["@type"] == "photo") {
                var size_photo = [];
                var photo = update["content"]["photo"]["sizes"];
                for (var i = 0; i < photo.length; i++) {
                  var photo_json = photo[i];
                  var json_photo = {};
                  json_photo["id"] = photo_json["photo"]["id"];
                  if (photo_json["photo"]["local"]["@type"] == "localFile") {
                    json_photo["path"] = photo_json["photo"]["local"]["path"];
                  }
                  if (photo_json["photo"]["remote"]["@type"] == "remoteFile") {
                    json_photo["file_id"] = photo_json["photo"]["remote"]["id"];
                  }
                  if (photo_json["photo"]["remote"]["unique_id"] != null) {
                    json_photo["file_unique_id"] = photo_json["photo"]["remote"]["unique_id"];
                  }
                  json_photo["file_size"] = photo_json["photo"]["size"];
                  json_photo["width"] = photo_json["width"];
                  json_photo["height"] = photo_json["height"];
                  size_photo.add(json_photo);
                }
                json["photo"] = size_photo;
              }
            }
          }

          if (update["content"]["@type"] == "messageVideo") {
            json["type_content"] = "video";
            if (update["content"]["video"] is Map) {
              if (update["content"]["video"]["@type"] == "video") {
                var json_video = {};
                var content_video = update["content"]["video"];
                json_video["duration"] = content_video["duration"];
                json_video["height"] = content_video["height"];
                json_video["file_name"] = content_video["file_name"];
                json_video["mime_type"] = content_video["mime_type"];
                try {
                  if (update["content"]["video"]["thumbnail"] != null && update["content"]["video"]["thumbnail"]["@type"].toString().toLowerCase() == "thumbnail") {
                    var content_thumb = content_video["thumbnail"];
                    var json_thumb = {};
                    json_video["thumb"] = json_thumb;
                    json_thumb["file_id"] = content_thumb["file"]["remote"]["id"];
                    json_thumb["file_unique_id"] = content_thumb["file"]["remote"]["unique_id"];
                    json_thumb["file_size"] = content_thumb["file"]["size"];
                    json_thumb["width"] = content_thumb["width"];
                    json_thumb["height"] = content_thumb["height"];
                  }
                } catch (e) {}
                json_video["file_id"] = content_video["video"]["remote"]["id"];
                json_video["file_size"] = content_video["video"]["size"];
                json["video"] = json_video;
              }
            }
          }

          if (update["content"]["@type"] == "messageAudio") {
            var type_content = "audio";
            json["type_content"] = "audio";
            if (update["content"]["audio"] is Map) {
              if (update["content"]["audio"]["@type"] == "audio") {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["duration"] = content_update["duration"];
                json_content["title"] = content_update["title"];
                json_content["performer"] = content_update["performer"];
                json_content["file_name"] = content_update["file_name"];
                json_content["mime_type"] = content_update["mime_type"];
                json_content["file_id"] = content_update[type_content]["remote"]["id"];
                json_content["unique_id"] = content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] = content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageAnimation") {
            var type_content = "animation";
            json["type_content"] = "animation";
            if (update["content"]["animation"] is Map) {
              if (update["content"]["animation"]["@type"] == "animation") {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["duration"] = content_update["duration"];
                json_content["width"] = content_update["width"];
                json_content["height"] = content_update["height"];
                json_content["file_name"] = content_update["file_name"];
                json_content["mime_type"] = content_update["mime_type"];
                json_content["mime_type"] = content_update["mime_type"];
                json_content["has_stickers"] = content_update["has_stickers"];

                try {
                  if (update["content"][type_content]["thumbnail"] != null && update["content"][type_content]["thumbnail"]["@type"].toString().toLowerCase() == "thumbnail") {
                    var content_thumb = content_update["thumbnail"];
                    var json_thumb = {};
                    json_thumb["file_id"] = content_thumb["file"]["remote"]["id"];
                    json_thumb["file_unique_id"] = content_thumb["file"]["remote"]["unique_id"];
                    json_thumb["file_size"] = content_thumb["file"]["size"];
                    json_thumb["width"] = content_thumb["width"];
                    json_thumb["height"] = content_thumb["height"];
                    json_content["thumb"] = json_thumb;
                  }
                } catch (e) {}
                json_content["file_id"] = content_update[type_content]["remote"]["id"];
                json_content["unique_id"] = content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] = content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageContact") {
            var type_content = "contact";
            json["type_content"] = type_content;
            if (update["content"][type_content] is Map) {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["phone_number"] = content_update["phone_number"];
                json_content["first_name"] = content_update["first_name"];
                json_content["last_name"] = content_update["last_name"];
                json_content["vcard"] = content_update["vcard"];
                json_content["user_id"] = content_update["user_id"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messagePoll") {
            var type_content = "poll";
            json["type_content"] = type_content;
            if (update["content"][type_content] is Map) {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["id"] = content_update["id"];
                json_content["question"] = content_update["question"];
                json_content["options"] = content_update["options"];
                json_content["total_voter_count"] = content_update["total_voter_count"];
                json_content["recent_voter_user_ids"] = content_update["recent_voter_user_ids"];
                json_content["is_anonymous"] = content_update["is_anonymous"];
                json_content["type"] = content_update["type"];
                json_content["open_period"] = content_update["open_period"];
                json_content["close_date"] = content_update["close_date"];
                json_content["is_closed"] = content_update["is_closed"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageDocument") {
            var type_content = "document";
            json["type_content"] = type_content;
            if (update["content"][type_content] is Map) {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["file_name"] = content_update["file_name"];
                json_content["mime_type"] = content_update["mime_type"];

                json_content["file_id"] = content_update[type_content]["remote"]["id"];
                json_content["unique_id"] = content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] = content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageSticker") {
            var type_content = "sticker";
            json["type_content"] = type_content;
            if (update["content"][type_content] is Map) {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["set_id"] = content_update["set_id"];
                json_content["width"] = content_update["width"];
                json_content["height"] = content_update["height"];
                json_content["emoji"] = content_update["emoji"];
                json_content["is_animated"] = content_update["is_animated"];
                json_content["is_mask"] = content_update["is_mask"];

                try {
                  if (update["content"][type_content]["thumbnail"] != null && update["content"][type_content]["thumbnail"]["@type"].toString().toLowerCase() == "thumbnail") {
                    var content_thumb = content_update["thumbnail"];
                    var json_thumb = {};
                    json_thumb["file_id"] = content_thumb["file"]["remote"]["id"];
                    json_thumb["file_unique_id"] = content_thumb["file"]["remote"]["unique_id"];
                    json_thumb["file_size"] = content_thumb["file"]["size"];
                    json_thumb["width"] = content_thumb["width"];
                    json_thumb["height"] = content_thumb["height"];
                    json_content["thumb"] = json_thumb;
                  }
                } catch (e) {}

                json_content["file_id"] = content_update[type_content]["remote"]["id"];
                json_content["unique_id"] = content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] = content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageVoiceNote") {
            var type_content = "voice_note";
            json["type_content"] = type_content;
            if (update["content"][type_content] is Map) {
              if (update["content"][type_content]["@type"] == "voiceNote") {
                var json_content = {};
                var content_update = update["content"][type_content];

                json_content["duration"] = content_update["duration"];
                json_content["waveform"] = content_update["waveform"];
                json_content["mime_type"] = content_update["mime_type"];

                json_content["file_id"] = content_update["voice"]["remote"]["id"];
                json_content["unique_id"] = content_update["voice"]["remote"]["unique_id"];
                json_content["file_size"] = content_update["voice"]["size"];
                json["voice"] = json_content;
              }
            }
          }
          if (update["content"]["@type"] == "messageChatJoinByLink") {
            json["type_content"] = "new_member";
            Map new_member_from = json["from"];
            try {
              new_member_from.remove("detail");
            } catch (e) {}
            json["new_members"] = [new_member_from];
          }
          if (update["content"]["@type"] == "messageChatAddMembers") {
            json["type_content"] = "new_member";
            List new_members = [];
            if (is_super_detail) {
              for (var i = 0; i < update["content"]["member_user_ids"].length; i++) {
                var loop_data = update["content"]["member_user_ids"][i];
                try {
                  Map result_user = await getUser(
                    loop_data,
                    clientId: clientId,
                  );
                  try {
                    result_user.remove("detail");
                  } catch (e) {}
                  new_members.add(result_user["result"]);
                } catch (e) {
                  new_members.add({"id": loop_data, "is_bot": false, "first_name": "", "last_name": "", "type": "private"});
                }
              }
            } else {
              new_members = update["content"]["member_user_ids"];
            }
            json["new_members"] = new_members;
          }

          if (update["content"]["@type"] == "messageChatDeleteMember") {
            json["type_content"] = "left_member";
            List left_member = [];
            if (is_super_detail) {
              try {
                Map result_user = await getUser(
                  update["content"]["user_id"],
                  clientId: clientId,
                );
                try {
                  result_user.remove("detail");
                } catch (e) {}
                left_member.add(result_user["result"]);
              } catch (e) {
                left_member.add({"id": update["content"]["user_id"], "is_bot": false, "first_name": "", "last_name": "", "type": "private"});
              }
            } else {
              left_member.add({"id": update["content"]["user_id"], "is_bot": false, "first_name": "", "last_name": "", "type": "private"});
            }
            json["left_member"] = left_member;
          }

          // caption
          if (update["content"]["caption"] is Map) {
            if (update["content"]["caption"]["@type"] == "formattedText") {
              if (update["content"]["caption"]["text"].toString().isNotEmpty) {
                json["caption"] = update["content"]["caption"]["text"];
              }
              old_entities = update["content"]["caption"]["entities"];
            }
          }

          List new_entities = [];
          for (var i = 0; i < old_entities.length; i++) {
            var data_entities = old_entities[i];
            try {
              var json_entities = {};
              json_entities["offset"] = data_entities["offset"];
              json_entities["length"] = data_entities["length"];
              if (data_entities["type"]["@type"] != null) {
                var type_entities = data_entities["type"]["@type"].toString().toLowerCase().replaceAll(RegExp("textEntityType", caseSensitive: false), "").replaceAll(RegExp("textUrl", caseSensitive: false), "text_link").replaceAll(RegExp("bot_command", caseSensitive: false), "bot_command").replaceAll(RegExp("mentionname", caseSensitive: false), "text_mention");
                json_entities["type"] = type_entities;
                if (data_entities["type"]["url"] != null) {
                  json_entities["url"] = data_entities["type"]["url"];
                }
                if (type_entities == "text_mention" && data_entities["type"]["user_id"] != null) {
                  var entitiesUserId = data_entities["type"]["user_id"];
                  var fromJson = {"id": entitiesUserId};
                  try {
                    var fromResult = await getChat(update["sender_id"]["user_id"], clientId: clientId);
                    if (fromResult["ok"]) {
                      fromJson = fromResult["result"];
                    }
                  } catch (e) {}
                  json_entities["user"] = fromJson;
                }
              }
              new_entities.add(json_entities);
            } catch (e) {}
          }
          json["entities"] = new_entities;
        }

        if (is_detail) {
          if (is_super_detail) {
            if (json["chat"]["type"] != null) {
              if (json["chat"]["type"] == "channel") {
                return {
                  "ok": true,
                  "result": {"update_channel_post": json}
                };
              } else {
                return {
                  "ok": true,
                  "result": {"update_message": json}
                };
              }
            }
          } else {
            if (json["chat"]["type"] == "channel") {
              return {
                "ok": true,
                "result": {"update_channel_post": json}
              };
            } else {
              return {
                "ok": true,
                "result": {"update_message": json}
              };
            }
          }
        }
        return {"ok": true, "result": json};
      }
      if (update["@type"] == "updateNewCallbackQuery") {
        Map json = {};
        Map from = {"id": update["sender_user_id"]};
        Map chat = {"id": update["chat_id"]};
        json["id"] = update["id"];

        if (is_super_detail) {
          try {
            var fromResult = await getChat(chat["id"], clientId: clientId);
            if (fromResult["ok"]) {
              chat = fromResult["result"];
            }
          } catch (e) {}
          try {
            var fromResult = await getUser(
              from["id"],
              clientId: clientId,
            );
            if (fromResult["ok"]) {
              from = fromResult["result"];
            }
          } catch (e) {}
        }

        try {
          var get_message = await getMessage(
            chat["id"],
            update["message_id"],
            is_detail: true,
            is_super_detail: true,
            clientId: clientId,
          );
          if (get_message["ok"]) {
            if (get_message["result"]["update_message"] != null) {
              json["message"] = get_message["result"]["update_message"];
            }

            if (get_message["result"]["update_channel_post"] != null) {
              json["message"] = get_message["result"]["update_channel_post"];
            }
          }
        } catch (e) {}
        json["api_message_id"] = getMessageId(update["message_id"], true);
        json["message_id"] = update["message_id"];
        json["from"] = from;
        json["chat"] = chat;
        json["chat_instance"] = update["chat_instance"];
        json["data"] = buffer.from(update["payload"]["data"], 'base64').toStringEncode('utf8');
        return {
          "ok": true,
          "result": {"callback_query": json}
        };
      }

      if (update["@type"] == "updateChatMember") {
        Map json = {};
        Map chat = {"id": update["chat_id"]};
        Map from = {"id": update["actor_user_id"]};
        if (is_super_detail) {
          try {
            var fromResult = await getChat(chat["id"], clientId: clientId);
            if (fromResult["ok"]) {
              chat = fromResult["result"];
            }
          } catch (e) {}
          try {
            var fromResult = await getUser(from["id"], clientId: clientId);
            if (fromResult["ok"]) {
              from = fromResult["result"];
            }
          } catch (e) {}
        }
        json["from"] = from;
        json["chat"] = chat;
        json["date"] = update["date"];
        if (update["old_chat_member"]["@type"] == "chatMember") {
          Map json_new_member = {};
          if (update["old_chat_member"]["member_id"]["@type"] == "messageSenderUser") {
            Map json_data_user = {"id": update["old_chat_member"]["member_id"]["user_id"]};
            if (is_super_detail) {
              try {
                var fromResult = await getUser(
                  json_data_user["id"],
                  clientId: clientId,
                );
                if (fromResult["ok"]) {
                  json_data_user = fromResult["result"];
                }
              } catch (e) {}
            }
            json_new_member["user"] = json_data_user;
          }

          json_new_member["status"] = update["old_chat_member"]["status"]["@type"].toString().replace(Regex(r"chatMemberStatus", "i").run, "").toLowerCase();
          json["old_member"] = json_new_member;
        }
        if (update["new_chat_member"]["@type"] == "chatMember") {
          Map json_new_member = {};

          if (update["new_chat_member"]["member_id"]["@type"] == "messageSenderUser") {
            Map json_data_user = {"id": update["new_chat_member"]["member_id"]["user_id"]};
            if (is_super_detail) {
              try {
                var fromResult = await getUser(
                  json_data_user["id"],
                  clientId: clientId,
                );
                if (fromResult["ok"]) {
                  json_data_user = fromResult["result"];
                }
              } catch (e) {}
            }
            json_new_member["user"] = json_data_user;
          }

          json_new_member["status"] = update["new_chat_member"]["status"]["@type"].toString().replace(Regex(r"chatMemberStatus", "i").run, "").toLowerCase();
          json["new_member"] = json_new_member;
        }

        return {
          "ok": true,
          "result": {"chat_member": json}
        };
      }

      if (update["@type"] == "updateNewInlineQuery") {
        Map json = {};
        Map from = {"id": update["sender_user_id"]};
        json["id"] = update["id"];
        try {
          var fromResult = await getUser(from["id"], clientId: clientId);
          if (fromResult["ok"]) {
            from = fromResult["result"];
          }
        } catch (e) {}
        json["from"] = from;
        json["chat_type"] = update["chat_type"]["@type"].toString().replace(Regex("chatType", "i").run, "").toLowerCase();
        try {
          if (json["chat_type"] == "supergroup" && update["chat_type"]["is_channel"]) {
            json["chat_type"] = "channel";
          }
        } catch (e) {}
        json["query"] = update["query"];
        json["offset"] = update["offset"];
        return {
          "ok": true,
          "result": {"inline_query": json}
        };
      }
    } catch (e) {
      update["ok"] = false;
      return update;
    }
    update["ok"] = false;
    return update;
  }

  /// getUser
  /// return result;
  /// ```json
  /// {
  ///   "ok": true
  ///   "result": {
  ///   }
  /// }
  /// ```
  getUser(dynamic user_id, {required int? clientId}) async {
    clientId ??= client_id;
    var get_user = await invoke(
      "getUser",
      parameters: {
        "user_id": user_id,
      },
      clientId: clientId,
    );
    if (Regex(r"^user$", "i").exec(get_user["@type"])) {
      var json = {};
      json["id"] = get_user["id"];
      try {
        if (Regex(r"^userTypeBot$", "i").exec(get_user["type"]["@type"])) {
          json["is_bot"] = true;
        } else {
          json["is_bot"] = false;
        }
      } catch (e) {
        json["is_bot"] = false;
      }
      json["first_name"] = get_user["first_name"];
      if (getBoolean(get_user["last_name"])) {
        json["last_name"] = get_user["last_name"];
      }
      if (getBoolean(get_user["username"])) {
        json["username"] = get_user["username"];
      }
      if (getBoolean(get_user["phone_number"])) {
        json["phone_number"] = get_user["phone_number"];
      }
      if (getBoolean(get_user["language_code"])) {
        json["language_code"] = get_user["language_code"];
      }
      json["type"] = "private";
      json["detail"] = {"has_protected_content": false, "is_marked_as_unread": false, "is_blocked": false, "has_scheduled_messages": false, "can_be_deleted_only_for_self": false, "can_be_deleted_for_all_users": false, "can_be_reported": false, "default_disable_notification": false, "unread_count": 0, "last_read_inbox_message_id": 0, "last_read_outbox_message_id": 0, "unread_mention_count": 0, "is_contact": get_user["is_contact"], "is_mutual_contact": get_user["is_mutual_contact"], "is_verified": get_user["is_verified"], "is_support": get_user["is_support"], "is_scam": get_user["is_scam"], "is_fake": get_user["is_fake"], "have_acces": get_user["have_access"]};
      return {"ok": true, "result": json};
    }
    get_user["ok"] = false;
    get_user["result"] = {"id": user_id};
    return get_user;
  }

  /// if you build flutter apps recommended to call this for call api
  voidRequest(String method, {Map<String, dynamic>? parameters, bool is_sync = false, bool is_raw = false, bool is_log = false, void Function(dynamic res)? callback, int? clientId}) async {
    clientId ??= client_id;
    var result = {};
    try {
      parameters ??= {};
      if (is_sync) {
        result = invokeSync(
          method,
          parameters: parameters,
          clientId: clientId,
        );
      } else {
        if (is_raw) {
          result = await invoke(
            method,
            parameters: parameters,
            clientId: clientId,
          );
        } else {
          result = await request(
            method,
            parameters: parameters,
            clientId: clientId,
          );
        }
      }
    } catch (e) {
      if (e is Map) {
        result = e;
      }
    }
    if (is_log) {
      print(result);
    }
    if (callback != null) {
      return callback(result);
    } else {}
  }

  /// if you build flutter apps recommended to call this for call api
  debugRequest(String method, {Map<String, dynamic>? parameters, bool is_sync = false, bool is_raw = false, bool is_log = false, void Function(dynamic res)? callback, int? clientId}) async {
    clientId ??= client_id;
    var result = {};
    try {
      parameters ??= {};
      if (is_sync) {
        result = invokeSync(
          method,
          parameters: parameters,
          clientId: clientId,
        );
      } else {
        if (is_raw) {
          result = await invoke(
            method,
            parameters: parameters,
            clientId: clientId,
          );
        } else {
          result = await request(
            method,
            parameters: parameters,
            clientId: clientId,
          );
        }
      }
    } catch (e) {
      if (e is Map) {
        result = e;
      }
    }
    if (is_log) {
      print(result);
    }
    if (callback != null) {
      return callback(result);
    } else {}
  }

  /// if you build flutter apps recommended to call this for call api
  Future<Map> appRequest(String method, {Map<String, dynamic>? parameters, bool is_sync = false, bool is_raw = false, bool is_log = false, int? clientId}) async {
    clientId ??= client_id;
    var result = {};
    try {
      parameters ??= {};
      if (is_sync) {
        result = invokeSync(
          method,
          parameters: parameters,
          clientId: clientId,
        );
      } else {
        if (is_raw) {
          result = await invoke(
            method,
            parameters: parameters,
            clientId: clientId,
          );
        } else {
          result = await request(
            method,
            parameters: parameters,
            clientId: clientId,
          );
        }
      }
    } catch (e) {
      return Future.error(e);
    }
    if (is_log) {
      print(result);
    }
    return result;
  }
}

/// Update td for make update support raw, raw api, raw api light
class UpdateTd {
  late Map update;
  late int client_id;
  late Map client_option;
  UpdateTd({
    required this.update,
    required int clientId,
    required Map clientOption,
  }) {
    client_id = clientId;
    client_option = clientOption;
  }

  /// return json update origin from api origin
  Map get raw {
    return update;
  }

  /// return type update
  String get type {
    return update["@type"];
  }
}
