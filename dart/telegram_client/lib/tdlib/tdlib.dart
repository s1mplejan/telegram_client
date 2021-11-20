part of telegram_client;

class Tdlib {
  String pathTdl;
  Map<String, dynamic> optionDefault = {
    '@type': 'tdlibParameters',
    'api_id': 273729,
    'api_hash': '0f7a4f1ed6c06469bf0ecf70ce92b49d',
    'database_directory': "${io.Platform.script.path.toString()}/telegram",
    'files_directory': "${io.Platform.script.path.toString()}/telegram",
    'enable_storage_optimizer': true,
    'system_language_code': 'en',
    'application_version': 'v1',
    'device_model': 'dart',
    'system_version': 'azkadev'
  };
  Tdlib(this.pathTdl, [Map<String, dynamic>? option]) {
    if (option != null) {
      option.forEach((key, value) {
        optionDefault[key.toString().toLowerCase()] = value;
      });
    }
  }

  // ignore: non_constant_identifier_names
  ffi.DynamicLibrary TdlibPathFile() {
    return ffi.DynamicLibrary.open(pathTdl);
  }

  // ignore: non_constant_identifier_names
  ffi.Pointer Function() get client_create {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Pointer Function()>>(
            'td_json_client_create')
        .asFunction();
  }

  // ignore: non_constant_identifier_names
  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, double) get client_receive {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<pkgffi.Utf8> Function(
                    ffi.Pointer, ffi.Double)>>('td_json_client_receive')
        .asFunction();
  }

  // ignore: non_constant_identifier_names, unused_local_variable
  void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>) get client_send {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer,
                    ffi.Pointer<pkgffi.Utf8>)>>('td_json_client_send')
        .asFunction();
  }

  // ignore: non_constant_identifier_names, unused_local_variable
  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)
      get client_execute {
    return TdlibPathFile()
        .lookup<
            ffi.NativeFunction<
                ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer,
                    ffi.Pointer<pkgffi.Utf8>)>>('td_json_client_execute')
        .asFunction();
  }

  // ignore: non_constant_identifier_names, unused_local_variable
  void Function(ffi.Pointer) get client_destroy {
    return TdlibPathFile()
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer)>>(
            'td_json_client_destroy')
        .asFunction();
  }

  clientExecute(client, jsonobject) {
    var fetch = client_execute.call(
        client, convert.json.encode(jsonobject).toNativeUtf8());
    return convert.json.decode(fetch.toDartString());
  }

  invokeSync(client, jsonobject) {
    var fetch =
        client_execute(client, convert.json.encode(jsonobject).toNativeUtf8());
    return convert.json.decode(fetch.toDartString());
  }

  clientSend(client, jsonsend) {
    return client_send.call(
        client, convert.json.encode(jsonsend).toNativeUtf8());
  }

  String clienReceive(client, [double timeout = 10.0]) {
    try {
      return client_receive(client, timeout).toDartString();
      // ignore: empty_catches
    } catch (e) {
      return "";
    }
  }
}
