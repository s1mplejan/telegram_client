import 'dart:async';
import 'dart:isolate';

import 'package:hexaminate/hexaminate.dart';
import 'package:telegram_client/telegram_client.dart';
import 'dart:io';

void main() async {
  try {
    var path = Directory.current.path;
    var option = {
      'api_id': 1917085,
      'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
      'database_directory': "$path/user",
      'files_directory': "$path/user",
    };
    Tdlib tg = Tdlib("/usr/lib/libtdjson.so", option);
    bool is_login = false;
    tg.on("update", (UpdateTd update) async {
      try {
        if (update.raw["@type"] == "updateAuthorizationState") {
          if (typeof(update.raw["authorization_state"]) == "object") {
            var authStateType = update.raw["authorization_state"]["@type"];
            if (authStateType == "authorizationStateWaitPhoneNumber") {
              stdout.write("Phone number: ");
              var phoneNumber = stdin.readLineSync().toString();
              print(await tg.requestApi("setAuthenticationPhoneNumber",
                  {"phone_number": phoneNumber}));
            }
            if (authStateType == "authorizationStateWaitCode") {
              stdout.write("Code: ");
              var code = stdin.readLineSync().toString();
              print(await tg
                  .requestApi("checkAuthenticationCode", {"code": code}));
            }
            if (authStateType == "authorizationStateWaitPassword") {
              var code = "Azkariani90";
              print(await tg.requestApi(
                  "checkAuthenticationPassword", {"password": code}));
            }
            if (authStateType == "authorizationStateReady") {
              print("succes login");
            }
          }
        }
      } catch (e) {
        print(e);
      }
    });
    await tg.user(); // ru
  } catch (e) {
    print(e);
  }
}
