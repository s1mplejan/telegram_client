// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:tdlib/tdlib.dart' as tdlib;
import 'package:telegram_client/tdlib/tdlib.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> arguments) async {
  int api_id = 0;
  String api_hash = "";
  String path_tdlib = "libtdjson.so";
  Directory tg_dir = Directory.current;
  Tdlib tg = Tdlib(
    path_tdlib,
    clientOption: TdlibFunction.setTdlibParameters(api_id: api_id, api_hash: api_hash, database_directory: tg_dir.path, files_directory: tg_dir.path).toJson(),
  );

  tg.on(tg.event_update, (UpdateTd update) async {


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
            tdlibFunction: TdlibFunction.setAuthenticationPhoneNumber(
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
            tdlibFunction: TdlibFunction.checkAuthenticationCode(
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
            tdlibFunction: TdlibFunction.checkAuthenticationPassword(
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

    

  });

  await tg.initIsolate();
}
