library telegram_client;

import 'dart:convert' as convert;
import 'package:switchscript/switchscript.dart' as switchscript;

part 'src/request.dart';

class Telegram {
  final String _tokenBot;
  // ignore: prefer_typing_uninitialized_variables
  final Map? _option;
  final Map _options = {
    "api": "https://api.telegram.org/bot",
  };
  Telegram(this._tokenBot, [this._option]) {
    if (_tokenBot.isEmpty) {
      throw "please fill token bot";
    }
    if (_option != null) {
      if (_option!.toBoolean && _option!.isType == "object") {
        _option!.forEach((key, value) {
          _options[key.toString()] = value;
        });
      }
    }
  }

  _Request get api {
    return _Request(_tokenBot, _options["api"].toString());
  }

  _Request newBot(String newToken) {
    var option = _option;
    option!["type"] = "bot";
    return _Request(newToken, _option);
  }

  _Request newUser(String newToken) {
    var option = _option;
    option!["type"] = "user";
    return _Request(newToken, option);
  }
}
