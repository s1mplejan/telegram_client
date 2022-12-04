// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:telegram_client/tdlib/tdlib.dart';
import 'package:telegram_client/scheme/tdlib_scheme.dart' as tdlib_scheme;

void main(List<String> arguments) async {
  Args args = Args(arguments);
  print(args.arguments);
  Tdlib tg = Tdlib(clientOption: {
    'database_directory': "./db_tg/",
    'files_directory': "./db_tg/",
    "use_test_dc": true,
  });

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
            tdlibFunction:
                tdlib_scheme.TdlibFunction.setAuthenticationPhoneNumber(
              phone_number: phone_number,
            ),
            clientId:
                update.client_id, // add this if your project more one client
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
            clientId:
                update.client_id, // add this if your project more one client
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
            tdlibFunction:
                tdlib_scheme.TdlibFunction.checkAuthenticationPassword(
              password: password,
            ),
            clientId:
                update.client_id, // add this if your project more one client
          );
        }

        if (authStateType == "authorizationStateReady") {
          Map get_me = await tg.getMe(clientId: update.client_id);
          print(get_me);
        }
      }
    }
    print(update.raw);
  });

  await tg.initIsolate();

  stdin.listen((event) async {
    var res = await tg.request("getMe", parameters: {
      "username": "azkadevtestdc",
    });
    print(json.encode(res));
  });
}
