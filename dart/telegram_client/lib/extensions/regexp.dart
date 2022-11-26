// ignore_for_file: non_constant_identifier_names

part of telegram_client;

/// extension tdlib for make
extension RegExpExtensionTelegram on RegExp {
  /// test method

  bool exec(dynamic input) {
    try {
      if (input is String == false) {
        input = input.toString();
      }
      return hasMatch(input);
    } catch (e) {
      return false;
    }
  }
}
