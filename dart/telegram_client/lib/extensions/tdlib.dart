// ignore_for_file: non_constant_identifier_names, empty_catches, unused_local_variable, unnecessary_brace_in_string_interps

part of telegram_client;

/// extension tdlib for make
extension TdlibMethodExtensions on Tdlib {
  Future<Map> banAutoChat({
    required Object chat_id,
    required Object target_chat_id,
    required List<Map> target_ban_chats,
    bool is_ban_members = false,
    List<int>? whiteListUserIds,
    int? clientId,
    dynamic Function(Map data, int client_id)? onProcces,
  }) async {
    whiteListUserIds ??= [];
    var get_chat_user = await request(
      "getChat",
      parameters: {
        "chat_id": target_chat_id,
      },
      clientId: clientId,
    );
    await request(
      "sendMessage",
      parameters: {
        "chat_id": chat_id,
        "text": "Process",
      },
      clientId: clientId,
    );
    late List<int> gban_user_ids = [];

    if (get_chat_user["result"] is Map) {
      if (get_chat_user["result"]["type"] is String) {
        String get_chat_user_type = (get_chat_user["result"]["type"] as String);
        if (get_chat_user_type == "private") {
          gban_user_ids.add(get_chat_user["result"]["id"]);
        } else {
          if (is_ban_members) {
            await request(
              "sendMessage",
              parameters: {
                "chat_id": chat_id,
                "text": "Fetch all member\nProcess ini lebih lama",
              },
              clientId: clientId,
            );
            var get_ban_member = await getAllMembers(
              chat_id: get_chat_user["result"]["id"],
              clientId: clientId,
            );
            if (get_ban_member["user_ids"] is List) {
              List ban_member_user_ids = get_ban_member["user_ids"];
              for (var i = 0; i < ban_member_user_ids.length; i++) {
                var loop_data = ban_member_user_ids[i];
                if (!gban_user_ids.contains(loop_data)) {
                  gban_user_ids.add(loop_data);
                }
              }
            }
          } else {
            var getChatAdministrators = await request(
              "getChatAdministrators",
              parameters: {
                "chat_id": get_chat_user["result"]["id"],
              },
              clientId: clientId,
            );
            List<Map> administrators =
                (getChatAdministrators['administrators'] as List).cast<Map>();
            late bool isNotOwned = true;
            for (var admin_index = 0;
                admin_index < administrators.length;
                admin_index++) {
              try {
                Map admin = administrators[admin_index];

                if (whiteListUserIds.contains(admin["user_id"])) {
                  isNotOwned = false;
                }
                if (isNotOwned) {
                  if (!gban_user_ids.contains(admin["user_id"])) {
                    gban_user_ids.add(admin["user_id"]);
                  }
                }
              } catch (e) {}
            }
          }
        }
      }
    }
    List failed = [];
    for (var chatIndex = 0; chatIndex < target_ban_chats.length; chatIndex++) {
      try {
        var chat = target_ban_chats[chatIndex];
        if (chat["username"] is String) {
          var chatUsername = "@${chat["username"]}";
          var msg_text =
              "start gban: ${chatUsername} ${chatIndex} ${target_ban_chats.length}";
          await Future.delayed(Duration(seconds: 2));
          await request(
            "sendMessage",
            parameters: {
              "chat_id": chat_id,
              "text": msg_text,
            },
            clientId: clientId,
          );
          await Future.delayed(Duration(milliseconds: 2));
          try {
            await request(
              "getChat",
              parameters: {
                "chat_id": chatUsername,
              },
              clientId: clientId,
            );
          } catch (e) {
            continue;
          }
        } else {
          var chatUsername = "@${chat["id"]}";
          var msg_text =
              "start gban: ${chatUsername} ${chatIndex} ${target_ban_chats.length}";
          await Future.delayed(Duration(seconds: 2));
          await request(
            "sendMessage",
            parameters: {
              "chat_id": chat_id,
              "text": msg_text,
            },
            clientId: clientId,
          );
          await Future.delayed(Duration(milliseconds: 2));
          try {
            await request(
              "getChat",
              parameters: {
                "chat_id": chatUsername,
              },
              clientId: clientId,
            );
          } catch (e) {
            continue;
          }
        }

        for (var index = 0; index < gban_user_ids.length; index++) {
          int gban_user_id = gban_user_ids[index];
          await Future.delayed(Duration(milliseconds: 500));
          try {
            var ban = await invoke(
              "banChatMember",
              parameters: {
                "chat_id": chat["id"],
                "member_id": {
                  "@type": "messageSenderUser",
                  "user_id": gban_user_id,
                },
              },
              clientId: clientId,
              isVoid: true,
            );
          } catch (e) {
            if (e is Map) {
              if (e["parameters"] is Map &&
                  e["parameters"]["retry_after"] is int) {
                failed.add(gban_user_id);
              } else {
                if (e["message"] != "PARTICIPANT_ID_INVALID") {}
              }
            } else {}
          }
        }
      } catch (e) {
        print(e);
      }
    }
    return {
      "@type": "bannedChats",
      "data_succes": [],
      "data_failed": failed,
    };
  }

  /// delete chat history
  Future<Map> blockedChatMembers({
    required chat_id,
    bool is_delete_chat_history = false,
    bool remove_from_chat_list = false,
    bool revoke = false,
    bool is_blocked = true,
    int? clientId,
    bool isVoid = false,
    Duration? delayDuration,
    Duration? delayLoop,
    Duration? invokeTimeOut,
    String? extra,
    dynamic Function(Map data, int client_id)? onProcces,
  }) async {
    delayLoop ??= Duration(milliseconds: 500);
    Map members = await getAllMembers(
        chat_id: chat_id, clientId: clientId, onProcces: onProcces);
    late Map jsonRespond = {
      "@type": "users",
      "users": [],
    };
    if (members["user_ids"] is List) {
      late List<Map> users = [];
      List<int> member_user_ids = (members["user_ids"] as List).cast<int>();
      for (var i = 0; i < member_user_ids.length; i++) {
        int user_id = member_user_ids[i];
        await Future.delayed(delayLoop);
        try {
          Map toggle_message_sender_is_blocked =
              await toggleMessageSenderIsBlocked(
            user_id: user_id,
            is_blocked: is_blocked,
            clientId: clientId,
            isVoid: isVoid,
          );
          toggle_message_sender_is_blocked["user_id"] = user_id;
          users.add(toggle_message_sender_is_blocked);
          if (is_delete_chat_history) {
            await Future.delayed(delayLoop);
            try {
              await deleteChatHistory(
                  chat_id: user_id,
                  remove_from_chat_list: remove_from_chat_list,
                  revoke: revoke,
                  clientId: clientId,
                  isVoid: isVoid);
            } catch (e) {}
          }
        } catch (e) {
          users.add({"@type": "error", "user_id": user_id});
        }
      }
      try {
        jsonRespond["users"] = users;
      } catch (e) {}
    }
    return jsonRespond;
  }

  /// delete chat history
  Future<Map> deleteChatHistory({
    required chat_id,
    bool remove_from_chat_list = true,
    bool revoke = true,
    int? clientId,
    bool isVoid = false,
    Duration? delayDuration,
    Duration? invokeTimeOut,
    String? extra,
  }) async {
    return await request(
      "deleteChatHistory",
      parameters: {
        "chat_id": chat_id,
        "remove_from_chat_list": remove_from_chat_list,
        "revoke": revoke,
      },
      clientId: clientId,
      isVoid: isVoid,
      extra: extra,
    );
  }

  /// toggle message sender is block
  Future<Map> toggleMessageSenderIsBlocked({
    required int user_id,
    bool is_blocked = false,
    int? clientId,
    bool isVoid = false,
    String? extra,
  }) async {
    return await request(
      "toggleMessageSenderIsBlocked",
      parameters: {
        "sender_id": {
          "@type": "messageSenderUser",
          "user_id": user_id,
        },
        "is_blocked": is_blocked,
      },
      clientId: clientId,
      isVoid: isVoid,
      extra: extra,
    );
  }

  /// get all members
  Future<Map> getAllMembers({
    required chat_id,
    bool isDetail = false,
    int? clientId,
    Duration? delayLoop,
    dynamic Function(Map data, int client_id)? onProcces,
  }) async {
    delayLoop ??= Duration(milliseconds: 500);
    Map chatResult = await getChat(
      chat_id,
      clientId: clientId,
      is_more_detail: true,
    );
    if (chatResult["ok"] == false) {
      return {"@type": "error"};
    }
    Map chat = chatResult["result"];
    late num member_count = 0;
    if (chat["detail"] is Map && chat["detail"]["member_count"] is int) {
      member_count = chat["detail"]["member_count"];
    }
    List<num> list_offset = TgUtils.createOffset(
      totalCount: member_count.toInt(),
      limitCount: 200,
    );
    late List user_ids = [];
    for (var i = 0; i < list_offset.length; i++) {
      var loop_data = list_offset[i];
      await Future.delayed(Duration(seconds: 2));
      var getSupergroupMembers = await request(
        "getSupergroupMembers",
        parameters: {
          "supergroup_id": int.parse("${chat["id"]}"
              .replaceAll(RegExp(r"^-100", caseSensitive: false), "")),
          "offset": loop_data,
          "limit": 200,
        },
        clientId: clientId,
      );
      late List members = [];
      if (getSupergroupMembers["members"] is List) {
        members = getSupergroupMembers["members"];
      }
      for (var ii = 0; ii < members.length; ii++) {
        late Map member = {};
        if (members[ii] is Map) {
          member = members[ii];
        }
        if (member.isNotEmpty) {
          if (member["member_id"] is Map) {
            int memberUserId = member["member_id"]["user_id"];
            if (!user_ids.contains(memberUserId)) {
              if (!isDetail) {
                if (onProcces != null) {
                  onProcces.call(
                    {
                      "@type": "user",
                      "id": memberUserId,
                    },
                    client_id,
                  );
                }
              }
              user_ids.add(memberUserId);
            }
          }
        }
      }
    }
    if (isDetail) {
      await Future.delayed(Duration(seconds: 2));
      late List<Map> array = [];
      for (var i = 0; i < user_ids.length; i++) {
        await Future.delayed(delayLoop);
        try {
          int user_id = user_ids[i];
          Map user_detail = await getUser(user_id, clientId: clientId);
          array.add(user_detail["result"] as Map);
          if (onProcces != null) {
            onProcces.call(
              user_detail["result"] as Map,
              client_id,
            );
          }
        } catch (e) {
          array.add({"@type": "error", "user_id": user_ids[i]});
        }
      }
      return {
        "@type": "members",
        "users": array,
      };
    } else {
      return {
        "@type": "members",
        "user_ids": user_ids,
      };
    }
  }
}
