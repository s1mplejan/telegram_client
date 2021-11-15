library telegram_client;

import 'dart:convert' as convert;
import 'package:switchscript/switchscript.dart' as switchscript;
part 'src/request.dart';

class Telegram {
  final String _token;
  // ignore: prefer_typing_uninitialized_variables
  final Map? _option;
  final Map _options = {
    "botPath": "/bot/",
    "userPath": "/user/",
    "port": 8080,
    "type": "bot",
    "logger": false,
    "api": "https://api.telegram.org/"
  };
  Telegram(this._token, [this._option]) {
    if (_token.isEmpty) {
      throw "please fill token bot";
    }
    if (_option != null) {
      if (_option!.toBoolean && _option!.isType == "object") {
        _option!.forEach((key, value) {
          if (key.toString().toLowerCase() == "api") {
            if (RegExp("\/\$", caseSensitive: false).hasMatch(key.toString())) {
              _options[key.toString().toLowerCase()] = value;
            } else {
              _options[key.toString().toLowerCase()] = "${value.toString()}/";
            }
          } else {
            _options[key.toString().toLowerCase()] = value;
          }
        });
      }
    }
  }

  opt() {
    print(_options);
  }

  _Request get api {
    return _Request(_token, _options);
  }
  
  _Request newBot(String newToken) {
    var option = _options;
    option["type"] = "bot";
    return _Request(newToken, _option);
  }

  _Request newUser(String newToken) {
    var option = _options;
    option["type"] = "user";
    return _Request(newToken, option);
  }
}
