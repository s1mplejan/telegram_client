// ignore_for_file: non_constant_identifier_names, slash_for_doc_comments

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

/// Telegram Bot Api library:
/// example:
/// ```dart
/// TelegramBotApi tg = TelegramBotApi("token_bot");
/// tg.api.request("sendMessage", {
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
    "api": "https://api.telegram.org/"
  };

  /// list methods:
  /// api:
  /// ```dart
  /// tg.api.request("getMe");
  /// ```
  ///
  TelegramBotApi(this._token, [Map? option]) {
    if (_token.isEmpty) {
      throw "please fill token bot";
    }
    if (option != null) {
      _options.addAll(option);
    }
  }

  /// call latest [Bot Api](https://core.telegram.org/bots/api#available-methods)
  /// example:
  /// [sendMessage]()
  /// ```dart
  /// tg.api.request("sendMessage", {
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

class _Request {
  final String _token;

  final Map option;
  _Request(this._token, this.option);

  dynamic request(String method,
      [Map? parameters, bool? is_form = false]) async {
    parameters ??= {};
    is_form ??= false;
    if (is_form) {
      var option = {
        "method": "post",
      };
      var url =
          "${option["api"].toString()}${option["type"].toString()}${_token.toString()}/${method.toString()}";

      option["body"] = convert.json.encode(parameters);

      Map params = parameters;
      var form = MultipartRequest("post", Uri.parse(url));
      params.forEach((key, value) async {
        if (typeData(value) == "object") {
          if (typeData(value["is_post_file"]) == "boolean" &&
              value["is_post_file"]) {
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
      var option = {
        "method": "post",
      };
      var url =
          "${option["api"].toString()}${option["type"].toString()}${_token.toString()}/${method.toString()}";

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
          var url = option["api"].toString().toLowerCase() +
              "file/" +
              option["type"].toString().toLowerCase();
          getFile["result"]["file_url"] =
              url + _token.toString() + "/" + getFile["result"]["file_path"];
          return getFile;
        } else {
          return convert.json.decode(response.body);
        }
      } else {
        throw convert.json.decode(response.body);
      }
    }
  }

  dynamic requestForm(method, [var parameters]) async {
    return await request(method, parameters, true);
  }

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

  sendMessage(chat_id, text, [var parameters]) async {
    var option = {"chat_id": chat_id, "text": text};
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("sendMessage", option);
  }

  forwardMessage(chat_id, from_chat_id, message_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "from_chat_id": from_chat_id,
      "message_id": message_id,
    };
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("forwardMessage", option);
  }

  copydMessage(chat_id, from_chat_id, message_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "from_chat_id": from_chat_id,
      "message_id": message_id,
    };
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("copyMessage", option);
  }

  sendPhoto(chat_id, photo, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "photo": photo,
    };
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("sendPhoto", option);
  }

  sendAudio(chat_id, audio, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "audio": audio,
    };
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("sendAudio", option);
  }

  sendDocument(chat_id, document, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "document": document,
    };
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("sendDocument", option);
  }

  sendVideo(chat_id, video, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "video": video,
    };
    return await request("sendVideo", option);
  }

  sendAnimation(chat_id, animation, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "animation": animation,
    };
    return await request("sendAnimation", option);
  }

  sendVoice(chat_id, voice, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "voice": voice,
    };

    return await request("sendVoice", option);
  }

  sendVideoNote(chat_id, video_note, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "video_note": video_note,
    };

    return await request("sendVideoNote", option);
  }

  sendMediaGroup(chat_id, media, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "media": media,
    };

    return await request("sendMediaGroup", option);
  }

  sendLocation(chat_id, latitude, longitude, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude,
    };

    return await request("sendLocation", option);
  }

  editMessageLiveLocation(latitude, longitude, [var parameters]) async {
    var option = {
      "latitude": latitude,
      "longitude": longitude,
    };

    return await request("editMessageLiveLocation", option);
  }

  stopMessageLiveLocation([var parameters]) async {
    return await request("stopMessageLiveLocation", parameters);
  }

  sendVenue(chat_id, latitude, longitude, title, address,
      [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude,
      "title": title,
      "address": address,
    };

    return await request("sendVenue", option);
  }

  sendContact(chat_id, phone_number, first_name, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "phone_number": phone_number,
      "first_name": first_name,
    };

    return await request("sendContact", option);
  }

  sendPoll(chat_id, question, options, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "question": question,
      "options": options,
    };

    return await request("sendPoll", option);
  }

  sendDice(chat_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
    };
    return await request("sendDice", option);
  }

  sendChatAction(chat_id, action) async {
    var option = {"chat_id": chat_id, "action": action};
    return await request("sendChatAction", option);
  }

  getUserProfilePhotos(user_id, [var parameters]) async {
    var option = {
      "user_id": user_id,
    };

    return await request("getUserProfilePhotos", option);
  }

  getFile(file_id) async {
    var option = {"file_id": file_id};
    return await request("getFile", option);
  }

  banChatMember(chat_id, user_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
    };

    return await request("banChatMember", option);
  }

  unbanChatMember(chat_id, user_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
    };

    return await request("unbanChatMember", option);
  }

  restrictChatMember(chat_id, user_id, permissions, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
      "permissions": permissions,
    };

    return await request("restrictChatMember", option);
  }

  promoteChatMember(chat_id, user_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
    };
    return await request("promoteChatMember", option);
  }

  setChatAdministratorCustomTitle(chat_id, user_id, custom_title) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
      "custom_title": custom_title
    };
    return await request("setChatAdministratorCustomTitle", option);
  }

  setChatPermissions(chat_id, permissions) async {
    var option = {"chat_id": chat_id, "permissions": permissions};
    return await request("setChatPermissions", option);
  }

  exportChatInviteLink(chat_id) async {
    var option = {"chat_id": chat_id};
    return await request("exportChatInviteLink", option);
  }

  createChatInviteLink(chat_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
    };
    return await request("createChatInviteLink", option);
  }

  editChatInviteLink(chat_id, invite_link, [var parameters]) async {
    var option = {"chat_id": chat_id, "invite_link": invite_link};
    return await request("editChatInviteLink", option);
  }

  revokeChatInviteLink(chat_id, invite_link) async {
    var option = {"chat_id": chat_id, "invite_link": invite_link};
    return await request("revokeChatInviteLink", option);
  }

  approveChatJoinRequest(chat_id, user_id) async {
    var option = {"chat_id": chat_id, "user_id": user_id};
    return await request("approveChatJoinRequest", option);
  }

  declineChatJoinRequest(chat_id, user_id) async {
    var option = {"chat_id": chat_id, "user_id": user_id};
    return await request("declineChatJoinRequest", option);
  }

  setChatPhoto(chat_id, photo) async {
    var option = {"chat_id": chat_id, "photo": photo};
    return await request("setChatPhoto", option);
  }

  deleteChatPhoto(chat_id) async {
    var option = {"chat_id": chat_id};
    return await request("deleteChatPhoto", option);
  }

  setChatTitle(chat_id, title) async {
    var option = {"chat_id": chat_id, "title": title};
    return await request("setChatTitle", option);
  }
}
