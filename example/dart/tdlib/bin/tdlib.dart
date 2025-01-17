// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:telegram_client/scheme/tdlib_scheme.dart' as tdlib_scheme;
import 'package:telegram_client/telegram_client.dart';

void main(List<String> arguments) async {
  print("started telegram client");
  int api_id = int.parse(Platform.environment["tg_api_id"] ?? "0");

  /// get api_id in https://my.telegram.org/auth
  String api_hash = Platform.environment["tg_api_hash"] ?? "0";

  ///  get api_hash in https://my.telegram.org/auth

  /// compile first https://tdlib.github.io/td/build.html?language=dart
  String path_tdlib = "/home/hexaminate/Documents/HEXAMINATE/app/specta/specta_userbot_telegram/libtdjson.so";

  Directory tg_dir = Directory.current;

  Tdlib tg = Tdlib(
    pathTdl: path_tdlib,
    clientOption: {
      "api_id": api_id,
      "api_hash": api_hash,
      "database_directory": tg_dir.path,
      "files_directory": tg_dir.path,
    },
  );

  tg.on(tg.event_update, (UpdateTd update) async {
    // print(json.encode(update.raw));

    /// authorization update
    if (update.raw["@type"] == "updateAuthorizationState") {
      if (update.raw["authorization_state"] is Map) {
        var authStateType = update.raw["authorization_state"]["@type"];

        /// init tdlib parameters
        await tg.initClient(
          update,
          clientId: update.client_id,
          tdlibParameters: update.client_option,
          isVoid: true,
        );

        if (authStateType == "authorizationStateLoggingOut") {}
        if (authStateType == "authorizationStateClosed") {
          print("close: ${update.client_id}");
          tg.exitClient(update.client_id);
        }
        if (authStateType == "authorizationStateWaitPhoneNumber") {
          stdout.write("Phone number: ");
          String phone_number = stdin.readLineSync().toString();

          /// use this if tdlib function not found method
          // await tg.invoke(
          //   "setAuthenticationPhoneNumber",
          //   parameters: {
          //     "phone_number": phone_number,
          //   },
          //   clientId: update.client_id,
          // );

          /// use call api if you can't see official docs
          await tg.callApi(
            tdlibFunction: tdlib_scheme.TdlibFunction.setAuthenticationPhoneNumber(
              phone_number: phone_number,
            ),
            clientId: update.client_id, // add this if your project more one client
          );

          /// use this if you wan't login as bot
          // await tg.callApi(
          //   tdlibFunction: TdlibFunction.checkAuthenticationBotToken(
          //     token: "1213141541:samksamksmaksmak",
          //   ),
          //   clientId: update.client_id, // add this if your project more one client
          // );

        }
        if (authStateType == "authorizationStateWaitCode") {
          stdout.write("Code: ");
          String code = stdin.readLineSync().toString();
          // await tg.invoke(
          //   "checkAuthenticationCode",
          //   parameters: {
          //     "code": code,
          //   },
          //   clientId: update.client_id,
          // );

          await tg.callApi(
            tdlibFunction: tdlib_scheme.TdlibFunction.checkAuthenticationCode(
              code: code,
            ),
            clientId: update.client_id, // add this if your project more one client
          );
        }
        if (authStateType == "authorizationStateWaitPassword") {
          stdout.write("Password: ");
          String password = stdin.readLineSync().toString();
          // await tg.invoke(
          //   "checkAuthenticationPassword",
          //   parameters: {
          //     "password": password,
          //   },
          //   clientId: update.client_id,
          // );

          await tg.callApi(
            tdlibFunction: tdlib_scheme.TdlibFunction.checkAuthenticationPassword(
              password: password,
            ),
            clientId: update.client_id, // add this if your project more one client
          );
        }

        if (authStateType == "authorizationStateReady") {
          Map get_me = await tg.getMe(clientId: update.client_id);
          print(get_me);
        }
      }
    }

    if (update.raw["@type"] == "updateNewMessage") {
      if (update.raw["message"] is Map) {
        /// tdlib scheme is not full real because i generate file origin to dart with my script but you can still use
        tdlib_scheme.Message message = tdlib_scheme.Message(update.raw["message"]);
        int chat_id = message.chat_id ?? 0;
        if (message.content.special_type == "messageText") {
          if (update.raw["message"]["content"]["text"] is Map && update.raw["message"]["content"]["text"]["text"] is String) {
            String text = (update.raw["message"]["content"]["text"]["text"] as String);
            if (RegExp(r"^/alive$", caseSensitive: false).hasMatch(text)) {
              // / use request if you wan't call api more easy and pretty like telegram bot api
              await tg.callApi(
                tdlibFunction: tdlib_scheme.TdlibFunction.sendMessage(
                  chat_id: chat_id,
                  options: tdlib_scheme.MessageSendOptions.create(from_background: true),
                  input_message_content: tdlib_scheme.InputMessageContent.create(text: tdlib_scheme.FormattedText.create(text: "Native Tdlib Scheme")),
                ),
              );

              return await tg.request(
                "sendMessage",
                parameters: {"chat_id": chat_id, "text": "alive telegram client @azkadev"},
                clientId: update.client_id,
              );
            }
          }
        }
      }
    }
  });

  await tg.initIsolate();
  print("succes init isolate");
}
