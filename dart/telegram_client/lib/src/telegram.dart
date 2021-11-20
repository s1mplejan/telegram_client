// ignore: slash_for_doc_comments
/**
Licensed under the MIT License <http://opensource.org/licenses/MIT>.
SPDX-License-Identifier: MIT
Copyright (c) 2021 Azkadev Telegram Client <http://github.com/azkadev/telegram_client>.
Permission is hereby  granted, free of charge, to any  person obtaining a copy
of this software and associated  documentation files (the "Software"), to deal
in the Software  without restriction, including without  limitation the rights
to  use, copy,  modify, merge,  publish, distribute,  sublicense, and/or  sell
copies  of  the Software,  and  to  permit persons  to  whom  the Software  is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE  IS PROVIDED "AS  IS", WITHOUT WARRANTY  OF ANY KIND,  EXPRESS OR
IMPLIED,  INCLUDING BUT  NOT  LIMITED TO  THE  WARRANTIES OF  MERCHANTABILITY,
FITNESS FOR  A PARTICULAR PURPOSE AND  NONINFRINGEMENT. IN NO EVENT  SHALL THE
AUTHORS  OR COPYRIGHT  HOLDERS  BE  LIABLE FOR  ANY  CLAIM,  DAMAGES OR  OTHER
LIABILITY, WHETHER IN AN ACTION OF  CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE  OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 
**/

part of telegram_client;

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

  _Request get api {
    return _Request(_token, _options);
  }

  _Request newBot(String newToken) {
    var option = _options;
    option["type"] = "bot";
    return _Request(newToken, option);
  }

  _Request newUser(String newToken) {
    var option = _options;
    option["type"] = "user";
    return _Request(newToken, option);
  }
}