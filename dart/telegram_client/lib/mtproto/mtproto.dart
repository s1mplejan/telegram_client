// ignore_for_file: non_constant_identifier_names

part of telegram_client;

class Mtproto {
  Mtproto();
  void connect() {}
  on(String type_update, void Function(String data) callback) {
    if (type_update == "update") {
      return callback("hello world");
    }
  }

invoke(String method, [Map? parameters]){

    parameters ??= {};
}
invokeSync(String method, [Map? parameters]){

    parameters ??= {};
}
  request(String method, [Map? parameters]) {
    parameters ??= {};

  }
}
