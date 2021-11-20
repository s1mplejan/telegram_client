part of telegram_client;

class Tdlib {
  final String _pathTdl;
  Map<String, dynamic> option;
  final Map<String, dynamic> _optionDefault = {
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

  Tdlib(this._pathTdl, this.option) {
      option.forEach((key, value) {
        _optionDefault[key.toString().toLowerCase()] = value;
      });
    
    var optin = {'@type': 'setTdlibParameters', 'parameters': _optionDefault};
    clientSend({
      "@type": "setLogVerbosityLevel",
      "new_verbosity_level": _optionDefault['new_verbosity_level']
    });
    clientSend(optin);
    clientSend({'@type': 'setDatabaseEncryptionKey', 'new_encryption_key': _optionDefault["database_key"]});
    clientSend({'@type': 'checkDatabaseEncryptionKey', 'encryption_key': _optionDefault["database_key"]});
  }

  // ignore: non_constant_identifier_names
  ffi.DynamicLibrary TdlibPathFile() {
    return ffi.DynamicLibrary.open(_pathTdl);
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
      get _client_execute {
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

  invokeSync(client, jsonobject) {
    var fetch =
        _client_execute(client, convert.json.encode(jsonobject).toNativeUtf8());
    return convert.json.decode(fetch.toDartString());
  }

  invoke(Object? value) {
    _client_send(client, convert.json.encode(value).toNativeUtf8());
    return _client_receive(client, 1.0);
  }

  clientSend(jsonsend) {
    return _client_send(client, convert.json.encode(jsonsend).toNativeUtf8());
  }

  void clientDestroy() {
    return _client_destroy(client);
  }

  String clienReceive(client, [double timeout = 10.0]) {
    try {
      return _client_receive(client, timeout).toDartString();
    } catch (e) {
      return "";
    }
  }

  void on(callback, [double timeout = 10.0]) {
    var nums = 0;
    while (nums == 0) {
      var update = clienReceive(client, timeout);
      if (update.isNotEmpty) {
        var updateMessage = convert.json.decode(update);
        callback(updateMessage, client);
      }
    }
  }
}