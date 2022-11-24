// ignore_for_file: depend_on_referenced_packages

import 'package:telegram_client/telegram_client.dart';

/// extension tdlib for make
extension TelegramBotApiTypeFileMethodExtensions on TelegramBotApi {
  /// test method
  Map typeFile(dynamic content) {
    Map data = {};
    if (content is String) {
      if (RegExp(r"^http", caseSensitive: false).hasMatch(content)) {
        data = {"@type": 'inputFileRemote', "data": content};
      }
      if (content is int) {
        data = {"@type": 'inputFileId', "data": content};
      } else {
        data = {"@type": 'inputFileRemote', "data": content};
      }
    } else {
      data = {"@type": 'inputFileRemote', "data": content};
    }
    return data;
  }
}
