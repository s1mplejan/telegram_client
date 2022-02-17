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

// ignore_for_file: prefer_typing_uninitialized_variables
part of telegram_client;

class _Request {
  final _token;
  // ignore: non_constant_identifier_names
  final Option;
  _Request(this._token, this.Option);

  // ignore: non_constant_identifier_names
  dynamic request(var method, [var parameters, var is_form]) async {
    if (typeData(method) != "string") {
      throw "tolong tulis method dalam bentuk string!";
    }
    var option = {
      "method": "post",
    };
    var url =
        "${Option["api"].toString()}${Option["type"].toString()}${_token.toString()}/${method.toString()}";
    if (typeData(parameters) == "object") {
      option["body"] = convert.json.encode(parameters);
    }

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
      return convert.json.decode(response.body);
    } else {
      throw convert.json.decode(response.body);
    }
  }

  dynamic requestForm(method, [var parameters]) async {
    return await request(method, parameters, true);
  }

  // ignore: non_constant_identifier_names
  sendMessage(chat_id, text, [var parameters]) async {
    var option = {"chat_id": chat_id, "text": text};
    if (typeData(parameters) == "object") {
      option.addAll(parameters);
    }
    return await request("sendMessage", option);
  }

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
  sendVideo(chat_id, video, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "video": video,
    };
    return await request("sendVideo", option);
  }

  // ignore: non_constant_identifier_names
  sendAnimation(chat_id, animation, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "animation": animation,
    };
    return await request("sendAnimation", option);
  }

  // ignore: non_constant_identifier_names
  sendVoice(chat_id, voice, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "voice": voice,
    };

    return await request("sendVoice", option);
  }

  // ignore: non_constant_identifier_names
  sendVideoNote(chat_id, video_note, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "video_note": video_note,
    };

    return await request("sendVideoNote", option);
  }

  // ignore: non_constant_identifier_names
  sendMediaGroup(chat_id, media, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "media": media,
    };

    return await request("sendMediaGroup", option);
  }

  // ignore: non_constant_identifier_names
  sendLocation(chat_id, latitude, longitude, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude,
    };

    return await request("sendLocation", option);
  }

  // ignore: non_constant_identifier_names
  editMessageLiveLocation(latitude, longitude, [var parameters]) async {
    var option = {
      "latitude": latitude,
      "longitude": longitude,
    };

    return await request("editMessageLiveLocation", option);
  }

  // ignore: non_constant_identifier_names
  stopMessageLiveLocation([var parameters]) async {
    return await request("stopMessageLiveLocation", parameters);
  }

  // ignore: non_constant_identifier_names
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

  // ignore: non_constant_identifier_names
  sendContact(chat_id, phone_number, first_name, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "phone_number": phone_number,
      "first_name": first_name,
    };

    return await request("sendContact", option);
  }

  // ignore: non_constant_identifier_names
  sendPoll(chat_id, question, options, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "question": question,
      "options": options,
    };

    return await request("sendPoll", option);
  }

  // ignore: non_constant_identifier_names
  sendDice(chat_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
    };

    return await request("sendDice", option);
  }

  // ignore: non_constant_identifier_names
  sendChatAction(chat_id, action) async {
    var option = {"chat_id": chat_id, "action": action};
    return await request("sendChatAction", option);
  }

  // ignore: non_constant_identifier_names
  getUserProfilePhotos(user_id, [var parameters]) async {
    var option = {
      "user_id": user_id,
    };

    return await request("getUserProfilePhotos", option);
  }

  // ignore: non_constant_identifier_names
  getFile(file_id) async {
    var option = {"file_id": file_id};
    return await request("getFile", option);
  }

  // ignore: non_constant_identifier_names
  banChatMember(chat_id, user_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
    };

    return await request("banChatMember", option);
  }

  // ignore: non_constant_identifier_names
  unbanChatMember(chat_id, user_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
    };

    return await request("unbanChatMember", option);
  }

  // ignore: non_constant_identifier_names
  restrictChatMember(chat_id, user_id, permissions, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
      "permissions": permissions,
    };

    return await request("restrictChatMember", option);
  }

  // ignore: non_constant_identifier_names
  promoteChatMember(chat_id, user_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
    };
    return await request("promoteChatMember", option);
  }

  // ignore: non_constant_identifier_names
  setChatAdministratorCustomTitle(chat_id, user_id, custom_title) async {
    var option = {
      "chat_id": chat_id,
      "user_id": user_id,
      "custom_title": custom_title
    };
    return await request("setChatAdministratorCustomTitle", option);
  }

  // ignore: non_constant_identifier_names
  setChatPermissions(chat_id, permissions) async {
    var option = {"chat_id": chat_id, "permissions": permissions};
    return await request("setChatPermissions", option);
  }

  /// asokaoskaosa
  // ignore: non_constant_identifier_names
  exportChatInviteLink(chat_id) async {
    var option = {"chat_id": chat_id};
    return await request("exportChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  createChatInviteLink(chat_id, [var parameters]) async {
    var option = {
      "chat_id": chat_id,
    };
    return await request("createChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  editChatInviteLink(chat_id, invite_link, [var parameters]) async {
    var option = {"chat_id": chat_id, "invite_link": invite_link};

    return await request("editChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  revokeChatInviteLink(chat_id, invite_link) async {
    var option = {"chat_id": chat_id, "invite_link": invite_link};
    return await request("revokeChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  approveChatJoinRequest(chat_id, user_id) async {
    var option = {"chat_id": chat_id, "user_id": user_id};
    return await request("approveChatJoinRequest", option);
  }

  // ignore: non_constant_identifier_names
  declineChatJoinRequest(chat_id, user_id) async {
    var option = {"chat_id": chat_id, "user_id": user_id};
    return await request("declineChatJoinRequest", option);
  }

  // ignore: non_constant_identifier_names
  setChatPhoto(chat_id, photo) async {
    var option = {"chat_id": chat_id, "photo": photo};
    return await request("setChatPhoto", option);
  }

// ignore: non_constant_identifier_names
  deleteChatPhoto(chat_id) async {
    var option = {"chat_id": chat_id};
    return await request("deleteChatPhoto", option);
  }

// ignore: non_constant_identifier_names
  setChatTitle(chat_id, title) async {
    var option = {"chat_id": chat_id, "title": title};
    return await request("setChatTitle", option);
  }

  //--
}
