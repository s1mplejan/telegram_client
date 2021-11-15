part of telegram_client;

class _Request {
  // ignore: prefer_typing_uninitialized_variables
  final _token;
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
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
    var url = "${Option["api"].toString()}${Option["type"].toString()}";
    if (switchscript.typeof(data) == "object") {
      option["body"] = convert.json.encode(data);
      var response = await switchscript.UrlFetchApp.fetch(
          "$url${_token.toString()}/${method.toString()}",
          option);
      if (response.statusCode == 200) {
        return convert.json.decode(response.body);
      } else {
        throw convert.json.decode(response.body);
      }
    } else {
      var response = await switchscript.UrlFetchApp.fetch(
          "url${_token.toString()}/${method.toString()}",
          option);
      if (response.statusCode == 200) {
        return convert.json.decode(response.body);
      } else {
        throw convert.json.decode(response.body);
      }
    }
  }

  _makeParams(originalObject, newObject) async {
    newObject.forEach((key, value) {
      originalObject[key.toString()] = value;
    });
    return originalObject;
  }

  _makeParamsSync(originalObject, newObject) {
    newObject.forEach((key, value) {
      originalObject[key.toString()] = value;
    });
    return originalObject;
  }

  // ignore: non_constant_identifier_names
  sendMessage(chat_id, text, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "text": text};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendMessage", option);
  }

  // ignore: non_constant_identifier_names
  forwardMessage(chat_id, from_chat_id, message_id, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "from_chat_id": from_chat_id,
      "message_id": message_id
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("forwardMessage", option);
  }

  // ignore: non_constant_identifier_names
  copydMessage(chat_id, from_chat_id, message_id, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "from_chat_id": from_chat_id,
      "message_id": message_id
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("copyMessage", option);
  }

  // ignore: non_constant_identifier_names
  sendPhoto(chat_id, photo, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "photo": photo};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendPhoto", option);
  }

  // ignore: non_constant_identifier_names
  sendAudio(chat_id, audio, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "audio": audio};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendAudio", option);
  }

  // ignore: non_constant_identifier_names
  sendDocument(chat_id, document, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "document": document};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendDocument", option);
  }

  // ignore: non_constant_identifier_names
  sendVideo(chat_id, video, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "video": video};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendVideo", option);
  }

  // ignore: non_constant_identifier_names
  sendAnimation(chat_id, animation, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "animation": animation};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendAnimation", option);
  }

  // ignore: non_constant_identifier_names
  sendVoice(chat_id, voice, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "voice": voice};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendVoice", option);
  }

  // ignore: non_constant_identifier_names
  sendVideoNote(chat_id, video_note, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "video_note": video_note};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendVideoNote", option);
  }

  // ignore: non_constant_identifier_names
  sendMediaGroup(chat_id, media, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "media": media};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendMediaGroup", option);
  }

  // ignore: non_constant_identifier_names
  sendLocation(chat_id, latitude, longitude, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendLocation", option);
  }

  // ignore: non_constant_identifier_names
  editMessageLiveLocation(latitude, longitude, [parameters]) async {
    Map optiondef = {"latitude": latitude, "longitude": longitude};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("editMessageLiveLocation", option);
  }

  // ignore: non_constant_identifier_names
  stopMessageLiveLocation([parameters]) async {
    Map optiondef = {};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("stopMessageLiveLocation", option);
  }

  // ignore: non_constant_identifier_names
  sendVenue(chat_id, latitude, longitude, title, address, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "latitude": latitude,
      "longitude": longitude,
      "title": title,
      "address": address
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendVenue", option);
  }

  // ignore: non_constant_identifier_names
  sendContact(chat_id, phone_number, first_name, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "phone_number": phone_number,
      "first_name": first_name
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendContact", option);
  }

  // ignore: non_constant_identifier_names
  sendPoll(chat_id, question, options, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "question": question,
      "options": options
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendPoll", option);
  }

  // ignore: non_constant_identifier_names
  sendDice(chat_id, [parameters]) async {
    Map optiondef = {"chat_id": chat_id};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("sendDice", option);
  }

  // ignore: non_constant_identifier_names
  sendChatAction(chat_id, action) async {
    Map optiondef = {"chat_id": chat_id, "action": action};
    return await request("sendChatAction", optiondef);
  }

  // ignore: non_constant_identifier_names
  getUserProfilePhotos(user_id, [parameters]) async {
    Map optiondef = {"user_id": user_id};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("getUserProfilePhotos", option);
  }

  // ignore: non_constant_identifier_names
  getFile(file_id) async {
    Map optiondef = {"file_id": file_id};
    return await request("getFile", optiondef);
  }

  // ignore: non_constant_identifier_names
  banChatMember(chat_id, user_id, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "user_id": user_id};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("banChatMember", option);
  }

  // ignore: non_constant_identifier_names
  unbanChatMember(chat_id, user_id, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "user_id": user_id};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("unbanChatMember", option);
  }

  // ignore: non_constant_identifier_names
  restrictChatMember(chat_id, user_id, permissions, [parameters]) async {
    Map optiondef = {
      "chat_id": chat_id,
      "user_id": user_id,
      "permissions": permissions
    };
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("restrictChatMember", option);
  }

  // ignore: non_constant_identifier_names
  promoteChatMember(chat_id, user_id, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "user_id": user_id};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("promoteChatMember", option);
  }

  // ignore: non_constant_identifier_names
  setChatAdministratorCustomTitle(chat_id, user_id, custom_title) async {
    Map optiondef = {
      "chat_id": chat_id,
      "user_id": user_id,
      "custom_title": custom_title
    };
    return await request("setChatAdministratorCustomTitle", optiondef);
  }

  // ignore: non_constant_identifier_names
  setChatPermissions(chat_id, permissions) async {
    Map optiondef = {"chat_id": chat_id, "permissions": permissions};
    return await request("setChatPermissions", optiondef);
  }

  /// asokaoskaosa
  // ignore: non_constant_identifier_names
  exportChatInviteLink(chat_id) async {
    Map optiondef = {"chat_id": chat_id};
    return await request("exportChatInviteLink", optiondef);
  }

  // ignore: non_constant_identifier_names
  createChatInviteLink(chat_id, [parameters]) async {
    Map optiondef = {"chat_id": chat_id};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("createChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  editChatInviteLink(chat_id, invite_link, [parameters]) async {
    Map optiondef = {"chat_id": chat_id, "invite_link": invite_link};
    // ignore: prefer_typing_uninitialized_variables
    var option;
    if (switchscript.typeof(parameters) == "object") {
      option = await _makeParams(optiondef, parameters);
    } else {
      option = optiondef;
    }
    return await request("editChatInviteLink", option);
  }

  // ignore: non_constant_identifier_names
  revokeChatInviteLink(chat_id, invite_link) async {
    Map optiondef = {"chat_id": chat_id, "invite_link": invite_link};
    return await request("revokeChatInviteLink", optiondef);
  }

  // ignore: non_constant_identifier_names
  approveChatJoinRequest(chat_id, user_id) async {
    Map optiondef = {"chat_id": chat_id, "user_id": user_id};
    return await request("approveChatJoinRequest", optiondef);
  }

  // ignore: non_constant_identifier_names
  declineChatJoinRequest(chat_id, user_id) async {
    Map optiondef = {"chat_id": chat_id, "user_id": user_id};
    return await request("declineChatJoinRequest", optiondef);
  }

  // ignore: non_constant_identifier_names
  setChatPhoto(chat_id, photo) async {
    Map optiondef = {"chat_id": chat_id, "photo": photo};
    return await request("setChatPhoto", optiondef);
  }

// ignore: non_constant_identifier_names
  deleteChatPhoto(chat_id) async {
    Map optiondef = {"chat_id": chat_id};
    return await request("deleteChatPhoto", optiondef);
  }

// ignore: non_constant_identifier_names
  setChatTitle(chat_id, title) async {
    Map optiondef = {"chat_id": chat_id, "title": title};
    return await request("setChatTitle", optiondef);
  }

  //--
}
