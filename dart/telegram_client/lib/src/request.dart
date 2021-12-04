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

  dynamic request(method, [Map? data]) async {
    var option = {
      "method": "post",
      "header": {
        'Accept': 'application/json',
        "Content-Type": "application/json",
      },
    };
    var url =
        "${Option["api"].toString()}${Option["type"].toString()}${_token.toString()}/${method.toString()}";
    if (data != null) {
      option["body"] = convert.json.encode(data);
    }
    var response = await switchscript.UrlFetchApp.fetch(url, option);
    if (response.statusCode == 200) {
      return convert.json.decode(response.body);
    } else {
      throw convert.json.decode(response.body);
    }
  }

  // ignore: non_constant_identifier_names
  sendMessage(chat_id, text, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "text": text,
      ...parameters ?? {},
    };
    return await request("sendMessage", option);
  }

  // ignore: non_constant_identifier_names
  forwardMessage(chat_id, from_chat_id, message_id,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "from_chat_id": from_chat_id,
      "message_id": message_id,
      ...parameters ?? {},
    };
    return await request("forwardMessage", option);
  }

  // ignore: non_constant_identifier_names
  copydMessage(chat_id, from_chat_id, message_id,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "from_chat_id": from_chat_id,
      "message_id": message_id,
      ...parameters ?? {},
    };
    return await request("copyMessage", option);
  }

  // ignore: non_constant_identifier_names
  sendPhoto(chat_id, photo, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "photo": photo,
      ...parameters ?? {},
    };
    return await request("sendPhoto", option);
  }

  // ignore: non_constant_identifier_names
  sendAudio(chat_id, audio, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "audio": audio,
      ...parameters ?? {},
    };
    return await request("sendAudio", option);
  }

  // ignore: non_constant_identifier_names
  sendDocument(chat_id, document, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "document": document,
      ...parameters ?? {},
    };
    return await request("sendDocument", option);
  }

  // ignore: non_constant_identifier_names
  sendVideo(chat_id, video, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "video": video,
      ...parameters ?? {},
    };
    return await request("sendVideo", option);
  }

  // ignore: non_constant_identifier_names
  sendAnimation(chat_id, animation, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "animation": animation,
      ...parameters ?? {},
    };
    return await request("sendAnimation", option);
  }

  // ignore: non_constant_identifier_names
  sendVoice(chat_id, voice, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "voice": voice,
      ...parameters ?? {},
    };

    return await request("sendVoice", option);
  }

  // ignore: non_constant_identifier_names
  sendVideoNote(chat_id, video_note, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "video_note": video_note,
      ...parameters ?? {},
    };

    return await request("sendVideoNote", option);
  }

  // ignore: non_constant_identifier_names
  sendMediaGroup(chat_id, media, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "media": media,
      ...parameters ?? {},
    };

    return await request("sendMediaGroup", option);
  }

  // ignore: non_constant_identifier_names
  sendLocation(chat_id, latitude, longitude,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude,
      ...parameters ?? {},
    };

    return await request("sendLocation", option);
  }

  // ignore: non_constant_identifier_names
  editMessageLiveLocation(latitude, longitude,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "latitude": latitude,
      "longitude": longitude,
      ...parameters ?? {},
    };

    return await request("editMessageLiveLocation", option);
  }

  // ignore: non_constant_identifier_names
  stopMessageLiveLocation([Map<String, dynamic>? parameters]) async {
    Map option = {...parameters ?? {}};

    return await request("stopMessageLiveLocation", option);
  }

  // ignore: non_constant_identifier_names
  sendVenue(chat_id, latitude, longitude, title, address,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude,
      "title": title,
      "address": address,
      ...parameters ?? {},
    };

    return await request("sendVenue", option);
  }

  // ignore: non_constant_identifier_names
  sendContact(chat_id, phone_number, first_name,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "phone_number": phone_number,
      "first_name": first_name,
      ...parameters ?? {},
    };

    return await request("sendContact", option);
  }

  // ignore: non_constant_identifier_names
  sendPoll(chat_id, question, options,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "question": question,
      "options": options,
      ...parameters ?? {},
    };

    return await request("sendPoll", option);
  }

  // ignore: non_constant_identifier_names
  sendDice(chat_id, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      ...parameters ?? {},
    };

    return await request("sendDice", option);
  }

  // ignore: non_constant_identifier_names
  sendChatAction(chat_id, action) async {
    Map option = {"chat_id": chat_id, "action": action};
    return await request("sendChatAction", option);
  }

  // ignore: non_constant_identifier_names
  getUserProfilePhotos(user_id, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "user_id": user_id,
      ...parameters ?? {},
    };

    return await request("getUserProfilePhotos", option);
  }

  // ignore: non_constant_identifier_names
  getFile(file_id) async {
    Map option = {"file_id": file_id};
    return await request("getFile", option);
  }

  // ignore: non_constant_identifier_names
  banChatMember(chat_id, user_id, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "user_id": user_id,
      ...parameters ?? {},
    };

    return await request("banChatMember", option);
  }

  // ignore: non_constant_identifier_names
  unbanChatMember(chat_id, user_id, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "user_id": user_id,
      ...parameters ?? {},
    };

    return await request("unbanChatMember", option);
  }

  // ignore: non_constant_identifier_names
  restrictChatMember(chat_id, user_id, permissions,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "user_id": user_id,
      "permissions": permissions,
      ...parameters ?? {},
    };

    return await request("restrictChatMember", option);
  }

  // ignore: non_constant_identifier_names
  promoteChatMember(chat_id, user_id,
      [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      "user_id": user_id,
      ...parameters ?? {},
    };
    return await request("promoteChatMember", option);
  }

  // ignore: non_constant_identifier_names
  setChatAdministratorCustomTitle(chat_id, user_id, custom_title) async {
    Map option = {
      "chat_id": chat_id,
      "user_id": user_id,
      "custom_title": custom_title
    };
    return await request("setChatAdministratorCustomTitle", option);
  }

  // ignore: non_constant_identifier_names
  setChatPermissions(chat_id, permissions) async {
    Map option = {"chat_id": chat_id, "permissions": permissions};
    return await request("setChatPermissions", option);
  }

  /// asokaoskaosa
  // ignore: non_constant_identifier_names
  exportChatInviteLink(chat_id) async {
    Map option = {"chat_id": chat_id};
    return await request("exportChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  createChatInviteLink(chat_id, [Map<String, dynamic>? parameters]) async {
    Map option = {
      "chat_id": chat_id,
      ...parameters ?? {},
    };

    return await request("createChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  editChatInviteLink(chat_id, invite_link,
      [Map<String, dynamic>? parameters]) async {
    Map option = {"chat_id": chat_id, "invite_link": invite_link};

    return await request("editChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  revokeChatInviteLink(chat_id, invite_link) async {
    Map option = {"chat_id": chat_id, "invite_link": invite_link};
    return await request("revokeChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  approveChatJoinRequest(chat_id, user_id) async {
    Map option = {"chat_id": chat_id, "user_id": user_id};
    return await request("approveChatJoinRequest", option);
  }

  // ignore: non_constant_identifier_names
  declineChatJoinRequest(chat_id, user_id) async {
    Map option = {"chat_id": chat_id, "user_id": user_id};
    return await request("declineChatJoinRequest", option);
  }

  // ignore: non_constant_identifier_names
  setChatPhoto(chat_id, photo) async {
    Map option = {"chat_id": chat_id, "photo": photo};
    return await request("setChatPhoto", option);
  }

// ignore: non_constant_identifier_names
  deleteChatPhoto(chat_id) async {
    Map option = {"chat_id": chat_id};
    return await request("deleteChatPhoto", option);
  }

// ignore: non_constant_identifier_names
  setChatTitle(chat_id, title) async {
    Map option = {"chat_id": chat_id, "title": title};
    return await request("setChatTitle", option);
  }

  //--
}
