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
  final Map<String, dynamic> _optionTdlibDefault = {
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
    "database_key": ""
  };
  late ffi.Pointer client = _client_create();
  late ffi.Pointer clien = _client_create_id.call();
  bool is_stop = false;
  bool is_android = Platform.isAndroid;
  EventEmitter emitter = EventEmitter();
  Tdlib(this._pathTdl, this.optionTdlib) {
    if (typeData(optionTdlib) == "object") {
      _optionTdlibDefault.addAll(optionTdlib);
    }

    client_execute.call(
        client,
        convert.json.encode({
          "@type": "setLogVerbosityLevel",
          "new_verbosity_level": _optionTdlibDefault['new_verbosity_level']
        }).toNativeUtf8());
    _client_send.call(
        client,
        convert.json.encode({
          '@type': 'getAuthorizationState',
          '@extra': 1.01234
        }).toNativeUtf8());
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
                ffi.Void Function(ffi.Pointer,
                    ffi.Pointer<pkgffi.Utf8>)>>('${is_android ? "_" : ""}td_json_client_send')
        .asFunction();
  }

  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)
      get client_execute {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer,
                    ffi.Pointer<pkgffi.Utf8>)>>('${is_android ? "_" : ""}td_json_client_execute')
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

  // ignore: non_constant_identifier_names
  Future<void> user() async {
    while (!is_stop) {
      var update = await clienReceive();
      // ignore: unnecessary_null_comparison
      if (typeData(update) == "string" && update.toString().isNotEmpty) {
        var updateOrigin = convert.json.decode(update);

        if (typeData(updateOrigin) == "object") {
          if (updateOrigin["@type"] == "updateAuthorizationState") {
            var authState = updateOrigin["authorization_state"];

            if (typeData(authState) == "object") {
              if (authState["@type"] ==
                  "authorizationStateWaitTdlibParameters") {
                var optin = {
                  "@type": 'setTdlibParameters',
                  'parameters': _optionTdlibDefault
                };

                _client_send.call(
                    client, convert.json.encode(optin).toNativeUtf8());
              }

              if (authState["@type"] == "authorizationStateWaitEncryptionKey") {
                _client_send.call(
                    client,
                    convert.json.encode({
                      "@type": 'checkDatabaseEncryptionKey',
                      'encryption_key': _optionTdlibDefault["database_key"]
                    }).toNativeUtf8());
              }
            }
          }
          if (updateOrigin["@type"] == "updateConnectionState" &&
              updateOrigin["state"]["@type"] == "connectionStateReady") {}
        }
        emitter.emit("update", null, updateOrigin);
      }
    }
    _client_destroy.call(client);
  }

  // ignore: non_constant_identifier_names
  Future<void> bot(token_bot, [bool auto_stop = false]) async {
    if (typeData(token_bot) != "string") {
      throw {};
    }
    if (!getBoolean(token_bot)) {
      throw {};
    }

    while (!is_stop) {
      var update = await clienReceive(1.0);
      // ignore: unnecessary_null_comparison
      if (typeData(update) == "string" && update.toString().isNotEmpty) {
        var updateOrigin = convert.json.decode(update);

        if (typeData(updateOrigin) == "object") {
          if (updateOrigin["@type"] == "updateAuthorizationState") {
            var authState = updateOrigin["authorization_state"];

            if (typeData(authState) == "object") {
              if (authState["@type"] ==
                  "authorizationStateWaitTdlibParameters") {
                var optin = {
                  "@type": 'setTdlibParameters',
                  'parameters': _optionTdlibDefault
                };

                _client_send.call(
                    client, convert.json.encode(optin).toNativeUtf8());
              }

              if (authState["@type"] == "authorizationStateWaitEncryptionKey") {
                _client_send.call(
                    client,
                    convert.json.encode({
                      "@type": 'checkDatabaseEncryptionKey',
                      'encryption_key': _optionTdlibDefault["database_key"]
                    }).toNativeUtf8());
              }
            }
          }
          if (updateOrigin["@type"] == "updateConnectionState" &&
              updateOrigin["state"]["@type"] == "connectionStateReady") {
            await invoke(
                {"@type": "checkAuthenticationBotToken", "token": token_bot});
            if (auto_stop) {
              is_stop = true;
            }
          }
        }
        emitter.emit("update", null, updateOrigin);
      }
    }
    _client_destroy.call(client);
  }

  // ignore: non_constant_identifier_names
  void on(type_update, void Function(UpdateTd update) callback) async {
    if (typeData(type_update) != "string") {
      throw {};
    }
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
