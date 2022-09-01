// ignore_for_file: non_constant_identifier_names, unused_local_variable, empty_catches

import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:telegram_client/telegram_client.dart';
import 'package:path/path.dart';

void main(List<String> args) async {
  stdout.write("Token: ");
  var token = stdin.readLineSync().toString();
  if (token.isEmpty) {
    print("please add token bot");
    exit(1);
  }
  TelegramBotApi tg = TelegramBotApi(token);
  Map getMe = await tg.request("getMe");
  Map get_me_data = getMe["result"];
  Hive.init(join(Directory.current.path, "db"));
  Box box = await Hive.openBox(get_me_data["id"].toString());

  Map getAll = box.toMap();
  List<String> lists_scheme = ["channel", "supergroup", "private", "group"];
  if (getAll.isEmpty) {
    for (var i = 0; i < lists_scheme.length; i++) {
      String loop_data = lists_scheme[i];
      if (loop_data.isNotEmpty) {
        await Future.delayed(Duration(microseconds: 1));
        await box.put(loop_data.toLowerCase(), []);
      }
    }
  } else {
    for (var i = 0; i < lists_scheme.length; i++) {
      String loop_data = lists_scheme[i];
      if (loop_data.isNotEmpty) {
        if (getAll[loop_data] is List == false) {
          await Future.delayed(Duration(microseconds: 1));
          await box.put(loop_data.toLowerCase(), []);
        }
      }
    }
  }

  getValue(String key, {defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  setValue(String key, value) async {
    return await box.put(key, value);
  }

  tg.on("update", (UpdateApi update_api) async {
    var update = update_api.raw;

    await Future.delayed(Duration(microseconds: 1));
    Map getAll = box.toMap();
    List<String> lists_scheme = ["channel", "supergroup", "private", "group"];
    if (getAll.isEmpty) {
      for (var i = 0; i < lists_scheme.length; i++) {
        String loop_data = lists_scheme[i];
        if (loop_data.isNotEmpty) {
          await Future.delayed(Duration(microseconds: 1));
          await box.put(loop_data.toLowerCase(), []);
        }
      }
    } else {
      for (var i = 0; i < lists_scheme.length; i++) {
        String loop_data = lists_scheme[i];
        if (loop_data.isNotEmpty) {
          if (getAll[loop_data] is List == false) {
            await Future.delayed(Duration(microseconds: 1));
            await box.put(loop_data.toLowerCase(), []);
          }
        }
      }
    }

    if (update["message"] is Map) {
      var msg = update["message"] as Map;
      var text = msg["text"];
      var caption = msg["caption"];
      var msgr = msg["reply_to_message"];
      var msg_id = msg["message_id"];
      var user_id = msg["from"]["id"];

      // varible to get information chat
      var chat_id = msg["chat"]["id"];
      var chat_type = msg["chat"]["type"]
          .toString()
          .replaceAll(RegExp(r"super", caseSensitive: false), "");
      var chat_title = msg["chat"]["title"] ?? "";
      var chat_first_name = msg["chat"]["first_name"] ?? "";
      var chat_last_name = msg["chat"]["last_name"] ?? "";
      var chat_full_name = "$chat_first_name $chat_last_name";
      var chat_username = (msg["chat"]["username"] is String)
          ? "@${msg["chat"]["username"]}"
          : "";
      var chat_name = (msg["chat"]["title"] is String)
          ? msg["chat"]["title"]
          : chat_full_name;
      // varible to get information sender in chat
      var from_id = msg["from"]["id"];
      var from_first_name = msg["from"]["first_name"];
      var from_last_name = msg["from"]["last_name"] ?? "";
      var from_full_name = "$from_first_name $from_first_name";
      var from_username = (msg["from"]["username"] is String)
          ? "@${msg["from"]["username"]}"
          : "";
      var from_language_code = msg["from"]["language_code"] ?? "id";
      var mention_from_markdown = "[$from_full_name](tg://user?id=$user_id)";
      var mention_from_html =
          "<a href='tg://user?id=$user_id'>$from_full_name</a>";
      Map get_data_state = {};

      if (msg["text"] is Map) {
        if (RegExp("/start", caseSensitive: false).hasMatch(msg["text"])) {
          return await tg.request("sendMessage", parameters: {
            "chat_id": chat_id,
            "text": "Hello world",
            "reply_markup": {
              "inline_keyboard": [
                [
                  {
                    "text": "Telegram Client",
                    "url": "https://github.com/azkadev/telegram_client"
                  }
                ]
              ]
            }
          });
        }
      }

      try {
        var get_data = getValue(chat_type.toLowerCase(), defaultValue: []);
        if (get_data is Map &&
            get_data.isNotEmpty &&
            get_data["state"] is Map) {
          get_data_state = get_data["state"];
        }
      } catch (e) {}

      if (get_data_state.isNotEmpty &&
          get_data_state["chat_id"] == chat_id &&
          get_data_state["user_id"] == user_id) {
        if (get_data_state["settings"] is String &&
            (get_data_state["settings"] as String).isNotEmpty) {
          if (get_data_state["message_id"] is int) {
            try {
              await tg.request("deleteMessage", parameters: {
                "chat_id": chat_id,
                "message_id": get_data_state["message_id"],
              });
            } catch (e) {}
          }
          try {} catch (e) {}
        }
      }

      return await tg.request("sendMessage",
          parameters: {"chat_id": chat_id, "text": json.encode(update)});
    }
  });
  await tg.initIsolate();
}
