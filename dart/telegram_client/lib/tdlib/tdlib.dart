// ignore: slash_for_doc_comments
// ignore_for_file: void_checks, non_constant_identifier_names

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

part of telegram_client;

class Tdlib {
  final String _pathTdl;
  Map<String, dynamic> optionTdlib;
  final Map<String, dynamic> optionTdlibDefault = {
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
    'device_model': 'Telegram Client Hexaminate',
    'system_version': Platform.operatingSystem,
    "database_key": "",
    "start": true
  };
  late ffi.Pointer client = _client_create();
  late ffi.Pointer clien = _client_create_id.call();
  bool is_stop = false;
  bool is_android = Platform.isAndroid;
  EventEmitter emitter = EventEmitter();

  bool starting = false;
  Completer? stopping;
  bool running = false;
  bool get isRunning => running;
  Isolate? receiveIsolate;
  ReceivePort? receivePort;

  Tdlib(this._pathTdl, this.optionTdlib) {
    if (typeData(optionTdlib) == "object") {
      optionTdlibDefault.addAll(optionTdlib);
    }
    if (typeof(optionTdlibDefault["start"]) == "boolean" &&
        optionTdlibDefault["start"]) {
      start();
    }
  }

  void start() {
    client_execute.call(
        client,
        convert.json.encode({
          "@type": "setLogVerbosityLevel",
          "new_verbosity_level": optionTdlibDefault['new_verbosity_level']
        }).toNativeUtf8());
    _client_send.call(
        client,
        convert.json.encode({
          '@type': 'getAuthorizationState',
          '@extra': 1.01234
        }).toNativeUtf8());

    on("update", (UpdateTd update) async {
      try {
        Map updateOrigin = update.raw;

        if (updateOrigin["@type"] == "updateAuthorizationState") {
          var authState = updateOrigin["authorization_state"];

          if (typeData(authState) == "object") {
            if (authState["@type"] == "authorizationStateWaitTdlibParameters") {
              var optin = {
                "@type": 'setTdlibParameters',
                'parameters': optionTdlibDefault
              };

              _client_send.call(
                  client, convert.json.encode(optin).toNativeUtf8());
            }

            if (authState["@type"] == "authorizationStateWaitEncryptionKey") {
              bool isEncrypted = authState['is_encrypted'] ?? false;
              if (isEncrypted) {
                _client_send.call(
                    client,
                    convert.json.encode({
                      "@type": 'checkDatabaseEncryptionKey',
                      'encryption_key': optionTdlibDefault["database_key"]
                    }).toNativeUtf8());
              } else {
                _client_send.call(
                    client,
                    convert.json.encode({
                      '@type': 'setDatabaseEncryptionKey',
                      'new_encryption_key': optionTdlibDefault["database_key"]
                    }).toNativeUtf8());
              }
            }
          }
        }
        if (updateOrigin["@type"] == "updateConnectionState" &&
            updateOrigin["state"]["@type"] == "connectionStateReady") {}
      } catch (e) {
        print(e);
      }
    });
  }

  Future<void> stop() async {
    receiveIsolate?.kill(priority: Isolate.immediate);
    receiveIsolate = null;
    receivePort?.close();
    receivePort = null;
  }

  Future<void> initIsolate() async {
    receivePort = ReceivePort();
    receivePort!.listen((message) {
      emitter.emit("update", null, message);
    });
    receiveIsolate = await Isolate.spawn((List args) {
      final SendPort sendPortToMain = args[0];
      final Map<String, dynamic> option = args[1];
      final int clientId = args[2];
      final String pathTdl = args[3];
      option["start"] = false;
      Tdlib tg = Tdlib(pathTdl, option);

      while (true) {
        var update = tg._client_receive(ffi.Pointer.fromAddress(clientId), 1.0);
        if (update.address != 0) {
          if (typeof(update.toDartString()) == "string" &&
              update.toDartString().toString().isNotEmpty) {
            Map? updateOrigin;
            try {
              updateOrigin = convert.json.decode(update.toDartString());
            } catch (e) {}
            if (updateOrigin != null) {
              sendPortToMain.send(updateOrigin);
            }
          }
        }
      }
    }, [
      receivePort!.sendPort,
      optionTdlibDefault,
      client.address,
      _pathTdl,
      is_android
    ], onExit: receivePort!.sendPort, onError: receivePort!.sendPort);
  }

  ffi.DynamicLibrary TdlibPathFile() {
    return ffi.DynamicLibrary.open(_pathTdl);
  }

  ffi.Pointer Function() get _client_create_id {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Pointer Function()>>(
            '${is_android ? "_" : ""}td_create_client_id')
        .asFunction();
  }

  ffi.Pointer Function() get _client_create {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Pointer Function()>>(
            '${is_android ? "_" : ""}td_json_client_create')
        .asFunction();
  }

  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, double) get _client_receive {
    return TdlibPathFile()
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<pkgffi.Utf8> Function(
                        ffi.Pointer, ffi.Double)>>(
            '${is_android ? "_" : ""}td_json_client_receive')
        .asFunction();
  }

  // ignore: unused_local_variable
  void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>) get _client_send {
    return TdlibPathFile()
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>>(
            '${is_android ? "_" : ""}td_json_client_send')
        .asFunction();
  }

  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)
      get client_execute {
    return TdlibPathFile()
        .lookup<
                ffi.NativeFunction<
                    ffi.Pointer<pkgffi.Utf8> Function(
                        ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>>(
            '${is_android ? "_" : ""}td_json_client_execute')
        .asFunction();
  }

  void Function(ffi.Pointer) get _client_destroy {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer)>>(
            '${is_android ? "_" : ""}td_json_client_destroy')
        .asFunction();
  }

  Future<Map<String, dynamic>> invoke(data, [bool is_api = false]) async {
    if (typeData(data) != "object") {
      data = {};
    }
    _client_send(client, convert.json.encode(data).toNativeUtf8());
    while (true) {
      var receive = await clienReceive(1.0);
      if (typeData(receive) == "string") {
        var update = convert.json.decode(receive);
        if (typeData(update) == "object") {
          if (is_api) {
            return update;
          } else {
            return update;
          }
        }
      }
    }
  }

  void clientDestroy() {
    return _client_destroy(client);
  }

  Future<String> clienReceive([double timeout = 10.0]) async {
    try {
      return _client_receive(client, timeout).toDartString();
    } catch (e) {
      return "";
    }
  }

  Future<void> user() async {
    on("update", (UpdateTd update) async {
      try {
        Map updateOrigin = update.raw;

        if (typeof(optionTdlibDefault["start"]) == "boolean" &&
            !optionTdlibDefault["start"]) {
          if (updateOrigin["@type"] == "updateAuthorizationState") {
            var authState = updateOrigin["authorization_state"];

            if (typeData(authState) == "object") {
              if (authState["@type"] ==
                  "authorizationStateWaitTdlibParameters") {
                var optin = {
                  "@type": 'setTdlibParameters',
                  'parameters': optionTdlibDefault
                };

                _client_send.call(
                    client, convert.json.encode(optin).toNativeUtf8());
              }

              if (authState["@type"] == "authorizationStateWaitEncryptionKey") {
                bool isEncrypted = authState['is_encrypted'] ?? false;
                if (isEncrypted) {
                  _client_send.call(
                      client,
                      convert.json.encode({
                        "@type": 'checkDatabaseEncryptionKey',
                        'encryption_key': optionTdlibDefault["database_key"]
                      }).toNativeUtf8());
                } else {
                  _client_send.call(
                      client,
                      convert.json.encode({
                        '@type': 'setDatabaseEncryptionKey',
                        'new_encryption_key': optionTdlibDefault["database_key"]
                      }).toNativeUtf8());
                }
              }
            }
          }
        }

        if (updateOrigin["@type"] == "updateConnectionState" &&
            updateOrigin["state"]["@type"] == "connectionStateReady") {}
      } catch (e) {
        print(e);
      }
    });
  }

  // ignore: non_constant_identifier_names
  Future<void> bot(token_bot, [bool auto_stop = false]) async {
    if (typeData(token_bot) != "string") {
      throw {};
    }
    if (!getBoolean(token_bot)) {
      throw {};
    }

    on("update", (UpdateTd update) async {
      try {
        Map updateOrigin = update.raw;

        if (typeof(optionTdlibDefault["start"]) == "boolean" &&
            !optionTdlibDefault["start"]) {
          if (updateOrigin["@type"] == "updateAuthorizationState") {
            var authState = updateOrigin["authorization_state"];

            if (typeData(authState) == "object") {
              if (authState["@type"] ==
                  "authorizationStateWaitTdlibParameters") {
                var optin = {
                  "@type": 'setTdlibParameters',
                  'parameters': optionTdlibDefault
                };

                _client_send.call(
                    client, convert.json.encode(optin).toNativeUtf8());
              }

              if (authState["@type"] == "authorizationStateWaitEncryptionKey") {
                bool isEncrypted = authState['is_encrypted'] ?? false;
                if (isEncrypted) {
                  _client_send.call(
                      client,
                      convert.json.encode({
                        "@type": 'checkDatabaseEncryptionKey',
                        'encryption_key': optionTdlibDefault["database_key"]
                      }).toNativeUtf8());
                } else {
                  _client_send.call(
                      client,
                      convert.json.encode({
                        '@type': 'setDatabaseEncryptionKey',
                        'new_encryption_key': optionTdlibDefault["database_key"]
                      }).toNativeUtf8());
                }
              }
            }
          }
        }
        if (updateOrigin["@type"] == "updateConnectionState" &&
            updateOrigin["state"]["@type"] == "connectionStateReady") {
          try {
            _client_send.call(
                client,
                convert.json.encode({
                  "@type": "checkAuthenticationBotToken",
                  "token": token_bot
                }).toNativeUtf8());
          } catch (e) {}

          if (auto_stop) {
            is_stop = true;
          }
        }
      } catch (e) {
        print(e);
      }
    });
  }

  void on(String type_update, void Function(UpdateTd update) callback) async {
    if (!getBoolean(type_update)) {
      throw {};
    }
    if (type_update.toString().toLowerCase() == "update") {
      emitter.on("update", null, (Event ev, context) {
        return callback(UpdateTd(this, ev.eventData as Map));
      });
    }
  }

  request(String method, [var option]) {
    if (method.isEmpty) {
      throw "tolong isi methodya!";
    }
    if (typeData(option) != "object") {
      option = {};
    }

    if (getBoolean(option["chat_id"])) {
      if (typeData(option["chat_id"]) == "string" &&
          option["chat_id"].toString().length > 4) {}
    }

    if (getBoolean(option["user_id"])) {
      if (typeData(option["user_id"]) == "string" &&
          option["user_id"].toString().length > 4) {}
    }

    if (RegExp("^sendMessage\$", caseSensitive: false).hasMatch(method)) {
      return sendMessage(option["chat_id"], option["text"]);
    }
  }

  Future<Map<String, dynamic>> requestApi(String method,
      [Map? parameters]) async {
    var json = {"@type": method, ...parameters ?? {}};
    var result = await invoke(json);
    if (result["@type"] == "error") {
      throw result;
    } else {
      return result;
    }
  }

  String getRandom(int length) {
    const ch = '0123456789abcdefghijklmnopqrstuvwxyz';
    Random r = Random();
    return String.fromCharCodes(
        Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
  }

  Map<String, dynamic> makeParametersApi(Map<String, dynamic> parameters) {
    Map<String, dynamic> jsonResult = {"@type": ""};
    try {
      if (RegExp("^(sendMessage)\$", caseSensitive: false)
          .hasMatch(parameters["@type"])) {
        jsonResult["@type"] = "sendMessage";
        jsonResult["input_message_content"] = {};

        jsonResult["chat_id"] = parameters["chat_id"];
        if (getBoolean(parameters["parse_mode"])) {
          if (typeof(parameters["parse_mode"]) != "string") {
            parameters["parse_mode"] = "";
          }
        } else {
          parameters["parse_mode"] = "";
        }
        if (getBoolean(parameters["entities"])) {
          if (typeof(parameters["entities"]) != "array") {
            parameters["entities"] = [];
          }
        } else {
          parameters["entities"] = [];
        }
        if (RegExp("^(sendMessage)\$", caseSensitive: false)
            .hasMatch(parameters["@type"])) {
          var text = parseMode(parameters["text"].toString(),
              parameters["parse_mode"], parameters["entities"]);
          jsonResult["input_message_content"] = {
            "@type": "inputMessageText",
            "text": text,
            "disableWebPagePreview": false,
            "clearDraft": false
          };
        }
        return jsonResult;
      }

      return parameters;
    } catch (e) {
      return parameters;
    }
  }

  dynamic parseMode(String text, String parse_mode, List entities) {
    dynamic pesan = {"text": text};
    var parseMode = 'textParseModeHTML';
    if (typeof(parse_mode) == "string") {
      parse_mode = parse_mode.toLowerCase();
      if (parse_mode == 'markdown') {
        parseMode = 'textParseModeMarkdown';
      } else if (parse_mode == 'html') {
        parseMode = 'textParseModeHTML';
      }
    }

    if (typeof(parse_mode) == "string") {
      try {
        pesan = convert.json.decode(client_execute
            .call(
                client,
                convert.json.encode({
                  "@type": 'parseTextEntities',
                  "parse_mode": {"@type": parseMode},
                  "text": text
                }).toNativeUtf8())
            .toDartString());
      } catch (e) {}
    }

    return pesan;
  }

  Map<String, dynamic> makeParameters(String method, [var parameters]) {
    Map<String, dynamic> jsonResult = {"@type": ""};
    if (typeof(parameters) != "object") {
      parameters = {};
    }
    List<String> methods = [
      "sendMessage",
      "sendPhoto",
      "sendAudio",
      "sendVideo"
    ];

    if (!RegExp("^(${methods.join("|")})\$", caseSensitive: false)
        .hasMatch(method)) {
      throw {
        "status_bool": false,
        "status_code": 404,
        "message": "Method not found"
      };
    }
    try {
      if (RegExp("^(sendMessage)\$", caseSensitive: false).hasMatch(method)) {
        jsonResult["@type"] = "sendMessage";
        jsonResult["input_message_content"] = {};

        jsonResult["chat_id"] = parameters["chat_id"];
        if (RegExp("^(sendMessage)\$", caseSensitive: false).hasMatch(method)) {
          var text = parseMode(parameters["text"],
              parameters["parse_mode"] ?? "", parameters["entities"] ?? []);
          jsonResult["input_message_content"] = {
            "@type": "inputMessageText",
            "text": text,
            "disableWebPagePreview": false,
            "clearDraft": false
          };
        }

        return jsonResult;
      }

      return {
        "status_bool": false,
        "status_code": 404,
        "message": "Method not found"
      };
    } catch (e) {
      print(parameters);

      return {"status_bool": false, "status_code": 400, "message": "Error"};
    }
  }

  Future<dynamic> requestSendApi(String method, [var parameters]) async {
    String random = getRandom(15);
    if (typeof(parameters) == "object") {
      parameters["@extra"] = random;
    } else {
      parameters = {};
      parameters["@extra"] = random;
    }
    _client_send.call(client,
        convert.json.encode({"@type": method, ...parameters}).toNativeUtf8());
    bool condition = true;
    var result = {};
    on("update", (UpdateTd update) async {
      try {
        Map updateOrigin = update.raw;
        if (updateOrigin["@extra"] == random) {
          updateOrigin.remove("@extra");
          result = updateOrigin;
        }
      } catch (e) {
        rethrow;
      }
    });
    while (condition) {
      await Future.delayed(Duration(seconds: 1));
      if (typeof(result["@type"]) == "string") {
        if (result["@type"] == "error") {
          throw result;
        }
        return result;
      }
    }
  }

  sendMessage(chat_id, text) {
    return invoke({
      "@type": "sendMessage",
      "chat_id": chat_id,
      "input_message_content": {
        "@type": "inputMessageText",
        "text": {"@type": "formattedText", "text": text, "entitiees": []},
        "disableWebPagePreview": false,
        "clearDraft": false
      }
    });
  }
}

class UpdateTd {
  late Tdlib tg;
  late Map update;
  UpdateTd(this.tg, this.update);

  Map get raw {
    return update;
  }

  String get type {
    return update["@type"];
  }

  // ignore: non_constant_identifier_names
  UpdateChannelPost get channel_post {
    return UpdateChannelPost(tg, update);
  }

  UpdateMessage get message {
    return UpdateMessage(tg, update);
  }
}

class UpdateChannelPost {
  late Tdlib tg;
  late Map update;
  UpdateChannelPost(this.tg, this.update);
}

class UpdateMessage {
  late Tdlib tg;
  late Map update;
  UpdateMessage(this.tg, this.update);

  // ignore: non_constant_identifier_names
  bool get is_found {
    return getBoolean(update["message"]);
  }

  String get type {
    return update["message"]["@type"];
  }

  // ignore: non_constant_identifier_names
  bool get is_outgoing {
    return update["message"]["is_outgoing"];
  }

  UpdateFrom get from {
    return UpdateFrom(tg, update);
  }

  UpdateChat get chat {
    return UpdateChat(tg, update);
  }

  String? get text {
    try {
      return update["message"]["content"]["text"]["text"];
    } catch (e) {
      return null;
    }
  }

  MessagePhoto get photo {
    return MessagePhoto(tg, update);
  }

  MessageAudio get audio {
    return MessageAudio(tg, update);
  }

  MessageEntities get entities {
    return MessageEntities(tg, update);
  }
}

class UpdateFrom {
  late Tdlib tg;
  late Map update;
  UpdateFrom(this.tg, this.update);
  int get id {
    return update["message"]["chat_id"];
  }
}

class UpdateChat {
  late Tdlib tg;
  late Map update;
  UpdateChat(this.tg, this.update);
  int get id {
    return update["message"]["chat_id"];
  }
}

class MessagePhoto {
  late Tdlib tg;
  late Map update;
  MessagePhoto(this.tg, this.update);
}

class MessageAudio {
  late Tdlib tg;
  late Map update;
  MessageAudio(this.tg, this.update);
}

class MessageEntities {
  late Tdlib tg;
  late Map update;
  MessageEntities(this.tg, this.update);
}
