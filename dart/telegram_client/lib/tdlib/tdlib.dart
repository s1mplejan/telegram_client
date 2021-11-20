part of telegram_client;

class Tdlib {
  String pathTdl;
  Tdlib(this.pathTdl);

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
  ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>) get client_execute {
    return TdlibPathFile().lookup<
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

  clienReceive(client, [double timeout = 10.0]) {
    try {
      return client_receive(client, timeout).toDartString();
    } catch (e) {
      return convert.json.encode({"@type": "error", "result": "eror update"});
    }
  }
}
