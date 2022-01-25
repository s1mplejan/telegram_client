class TelegramApi {
  final client;
  TelegramApi(this.client);

  invoke(String method, [var parameters = false]) async {
    if (method.isEmpty) {
      throw "";
    }
  }
}
