// ignore_for_file: non_constant_identifier_names, slash_for_doc_comments, empty_catches

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

import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:hexaminate/hexaminate.dart';

/// Telegram Bot Api library:
/// example:
/// ```dart
/// TelegramBotApi tg = TelegramBotApi("token_bot");
/// tg.api.request("sendMessage", parameters: {
///   "chat_id": 12345,
///   "text": "Hello world"
/// });
/// ````
///
class TelegramBotApi {
  final String _token;

  final Map _options = {
    "botPath": "/bot/",
    "userPath": "/user/",
    "port": 8080,
    "type": "bot",
    "logger": false,
    "api": "https://api.telegram.org/",
    "allowed_updates": [
      "message",
      "edited_message",
      "channel_post",
      "edited_channel_post",
      "inline_query",
      "chosen_inline_result",
      "callback_query",
      "shipping_query",
      "pre_checkout_query",
      "poll",
      "poll_answer",
      "my_chat_member",
      "chat_member",
      "chat_join_request"
    ],
  };

  /// list methods:
  /// api:
  /// ```dart
  /// tg.api.request("getMe");
  /// ```
  ///
  TelegramBotApi(this._token, [Map? option]) {
    if (option != null) {
      _options.addAll(option);
    }
  }

  /// call latest [Bot Api](https://core.telegram.org/bots/api#available-methods)
  /// example:
  /// [sendMessage]()
  /// ```dart
  /// tg.api.request("sendMessage", parameters: {
  ///    "chat_id": 12345,
  ///    "text": "hello world",
  ///    "reply_markup": {
  ///       "inline_keyboard": [
  ///           [
  ///               {
  ///                 "text": "Azkadev",
  ///                 "url": "https://github.com/azkadev"
  ///               }
  ///           ]
  ///       ]
  ///    }
  /// });
  /// ```
  ///

  /// call api latest [bot api](https://core.telegram.org/bots/api#available-methods)
  /// example:
  /// ```dart
  /// request("sendMessage", parameters: {
  ///   "chat_id": 123456,
  ///   "text": "<b>Hello</b> <code>word</code>",
  ///   "parse_mode": "html"
  /// });
  /// ```
   dynamic request(String method, {Map? parameters, bool is_form = false, String? tokenBot}) async {
    parameters ??= {};
    tokenBot ??= _token;
    var option = {
      "method": "post",
    };
    var url = "${_options["api"].toString()}${_options["type"].toString()}${tokenBot.toString()}/${method.toString()}";
    if (is_form) {
      Map params = parameters;
      var form = MultipartRequest("post", Uri.parse(url));
      params.forEach((key, value) async {
        if (typeData(value) == "object") {
          if (typeData(value["is_post_file"]) == "boolean" && value["is_post_file"]) {
            var files = await MultipartFile.fromPath(key, value["file_path"]);
            form.files.add(files);
          } else {
            form.fields[key] = convert.json.encode(value);
          }
        } else if (typeData(value) == "string") {
          form.fields[key] = value;
        } else {
          form.fields[key] = value.toString();
        }
      });
      var response = await form.send();
      if (response.statusCode == 200) {
        var res = await Response.fromStream(response);
        return convert.json.decode(res.body);
      } else {
        var res = await Response.fromStream(response);
        throw convert.json.decode(res.body);
      }
    } else {
      option["body"] = convert.json.encode(parameters);
      var response = await post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
        body: option["body"],
      );
      if (response.statusCode == 200) {
        if (method.toString().toLowerCase() == "getfile") {
          var getFile = convert.json.decode(response.body);
          var url = "${option["api"].toString().toLowerCase()}file/${option["type"].toString().toLowerCase()}";
          getFile["result"]["file_url"] = "$url$_token/${getFile["result"]["file_path"]}";
          return getFile;
        } else {
          return convert.json.decode(response.body);
        }
      } else {
        var json = convert.json.decode(response.body);
        throw json;
      }
    }
  }

  /// call api latest [bot api](https://core.telegram.org/bots/api#available-methods) with upload file
  /// example:
  /// ```dart
  /// requestForm("sendDocument", parameters: {
  ///   "chat_id": 123456,
  ///   "document": tg.file("./doc.json"),
  ///   "parse_mode": "html"
  /// });
  /// ```
  dynamic requestForm(method, {var parameters, String? tokenBot}) async {
    tokenBot ??= _token;
    return await request(method, parameters: parameters, is_form: true, tokenBot: tokenBot);
  }
  /// example:
  /// ```dart
  /// tg.file("./doc.json"),
  /// ```
  dynamic file(path, [var option]) {
    Map<String, dynamic> jsonData = {"is_post_file": true};
    if (RegExp(r"^(./|/)", caseSensitive: false).hasMatch(path)) {
      var filename = path
          .toString()
          .replaceAll(RegExp(r"^(./|/)", caseSensitive: false), "");
      jsonData["file_name"] = filename;
      jsonData["file_path"] = path;
      if (typeData(option) == "object") {
        jsonData.addAll(option);
      }
    } else {
      jsonData["is_post_file"] = false;
      jsonData["file_path"] = path;
    }
    return jsonData;
  }
}
