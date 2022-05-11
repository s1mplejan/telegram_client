import 'dart:convert';

import 'package:telegram_client/telegram_client.dart';
import 'package:args/args.dart';
import 'package:switchscript/switchscript.dart';

void main(List<String> args) async {
  try {
    var parser = ArgParser();
    parser.addOption("token", abbr: "t");
    parser.addOption("request", abbr: "r", defaultsTo: "getMe");
    parser.addOption("params", abbr: "p", defaultsTo: "{}");
    var results = parser.parse(args);
    if (results["token"] != null && results["token"].toString().isNotEmpty) {
      if (results["request"] != null &&
          results["request"].toString().isNotEmpty) {
        var tokenBot = results["token"].toString();
        if (tokenBot.split(":").length == 2 &&
            RegExp("^[0-9]+\$", caseSensitive: false)
                .hasMatch(tokenBot.split(":")[0].toString())) {
          var tg = Telegram(tokenBot, {});
          try {
            var parameters = {};
            if (results["params"] != null &&
                results["params"].toString().isNotEmpty) {
              try {
                parameters = json.decode(results["params"]);
              } catch (e) {
                return print("Parameters format failed");
              }
            }
            var req = await tg.api.request(results["request"], parameters);
            return print(JSON.stringify(req, null, 2));
          } catch (e) {
            return print(JSON.stringify(e, null, 2));
          }
        }
        return print("format token is bad");
      } else {
        return print("please add request parameters");
      }
    } else {
      return print("please add token parameters");
    }
  } catch (e) {
    print(e);
  }
}
