// ignore: slash_for_doc_comments
// ignore_for_file: void_checks

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
    'api_id': 0,
    'api_hash': '',
    'database_directory': "",
    'files_directory': "",
    'enable_storage_optimizer': true,
    'system_language_code': 'en',
    'new_verbosity_level': 0,
    'application_version': 'v1',
    'device_model': 'dart',
    'system_version': 'azkadev',
    "database_key": ""
  };
  late ffi.Pointer client = _client_create();
  late ffi.Pointer clien = _client_create_id.call();
  bool is_stop = false;
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

  // ignore: non_constant_identifier_names
  ffi.DynamicLibrary TdlibPathFile() {
    return ffi.DynamicLibrary.open(_pathTdl);
  }

  ffi.Pointer Function() get _client_create_id {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Pointer Function()>>(
            'td_create_client_id')
        .asFunction();
  }

  // ignore: non_constant_identifier_names
  ffi.Pointer Function() get _client_create {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Pointer Function()>>(
            'td_json_client_create')
        .asFunction();
  }

  // ignore: non_constant_identifier_names
  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, double) get _client_receive {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<pkgffi.Utf8> Function(
                    ffi.Pointer, ffi.Double)>>('td_json_client_receive')
        .asFunction();
  }

  // ignore: non_constant_identifier_names, unused_local_variable
  void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>) get _client_send {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer,
                    ffi.Pointer<pkgffi.Utf8>)>>('td_json_client_send')
        .asFunction();
  }

  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)
      // ignore: non_constant_identifier_names
      get client_execute {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer,
                    ffi.Pointer<pkgffi.Utf8>)>>('td_json_client_execute')
        .asFunction();
  }

  // ignore: non_constant_identifier_names, unused_local_variable
  void Function(ffi.Pointer) get _client_destroy {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer)>>(
            'td_json_client_destroy')
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
  Future<void> bot(token_bot) async {
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
          }
        }
        emitter.emit("update", null, updateOrigin);
      }
    }
    _client_destroy.call(client);
  }

  // ignore: non_constant_identifier_names
  void on(type_update, callback) async {
    if (typeData(type_update) != "string") {
      throw {};
    }
    if (!getBoolean(type_update)) {
      throw {};
    }
    if (type_update.toString().toLowerCase() == "update") {
      emitter.on("update", null, (Event ev, context) {
        return callback(ev.eventData);
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
