var { updateApi } = require("./update");

class telegramApi {

    constructor(handle) {
        this.handle = handle;
    }

    async request(method, option = {}) {
        if (typeof option["chat_id"] == "string" && option["chat_id"].length >= 5) {
            try {
                var searchPublicChat = await this.searchPublicChat(String(option["chat_id"]).replace(/(@)/ig, ""));
                if (searchPublicChat) {
                    if (searchPublicChat["_"] == "chat") {
                        option["chat_id"] = searchPublicChat["id"];
                    }
                }
            } catch (e) {

            }
        }
        if (typeof option["user_id"] == "string" && option["user_id"].length >= 5) {
            try {
                var searchPublicChat = await this.searchPublicChat(String(option["user_id"]).replace(/(@)/ig, ""));
                if (searchPublicChat) {
                    if (searchPublicChat["_"] == "chat") {
                        option["user_id"] = searchPublicChat["id"];
                    }
                }
            } catch (e) {

            }
        }

        if (RegExp(`^deleteMessage$`, "i").exec(method)) {
            return await this.deleteMessage(option["chat_id"], option["message_id"], true);
        }
        if (RegExp(`^searchPublicChat$`, "i").exec(method)) {
            var searchPublicChat = await this.searchPublicChat(option["username"]);
            if (searchPublicChat) {
                if (searchPublicChat["_"] == "chat") {
                    var getChat = await this.request("getChat", { "chat_id": searchPublicChat["id"] });
                    if (getChat["ok"]) {
                        return {
                            "status_bool": true,
                            "status_code": 200,
                            "result": getChat["result"]
                        };
                    } else {
                        return {
                            "status_bool": false,
                            "status_code": 400,
                            "result": {}
                        };

                    }
                }
            }
        }
        if (RegExp(`^searchPublicChats$`, "i").exec(method)) {
            var searchPublicChats = await this.searchPublicChats(option["query"]);
            if (searchPublicChats) {
                if (searchPublicChats["_"] == "chats") {
                    if (searchPublicChats["total_count"]) {
                        var chat_ids = searchPublicChats["chat_ids"];
                        var result = [];
                        for (var i = 0; i < chat_ids.length; i++) {
                            var loop_data = chat_ids[i];
                            try {
                                var getChat = await this.request("getChat", { "chat_id": loop_data });
                                if (getChat["ok"]) {
                                    result.push(getChat["result"]);
                                }
                            } catch (e) {

                            }

                        }
                        return {
                            "status_bool": true,
                            "status_code": 200,
                            "result": result
                        };

                    } else {
                        return {
                            "status_bool": false,
                            "status_code": 404,
                            "message": "Not found",
                            "result": []
                        };
                    }
                }

                throw {
                    "message": searchPublicChat
                };
            } else {
                throw {
                    "message": searchPublicChat
                };
            }
        }

        if (RegExp(`^sendBotStartMessage$`, "i").exec(method)) {
            var searchPublicChat = await this.searchPublicChat(option["username"]);
            if (searchPublicChat) {
                if (searchPublicChat["_"] == "chat") {
                    if (searchPublicChat["type"] && searchPublicChat["type"]["_"] == "chatTypePrivate") {
                        if (searchPublicChat["type"]["user_id"]) {
                            return await this.sendBotStartMessage(searchPublicChat["type"]["user_id"], searchPublicChat["type"]["user_id"], option["parameter"] ?? false);
                        }
                    }
                }

                throw {
                    "message": searchPublicChat
                };
            } else {
                throw {
                    "message": searchPublicChat
                };
            }
        }

        if (new RegExp(`^sendMessage$`, "i").exec(method)) {
            return await this.sendMessage(option["chat_id"], option["text"], option["parse_mode"], option["entities"], option["disable_web_page_preview"], option["disable_notification"], option["reply_to_message_id"], option["reply_markup"])
        }

        if (new RegExp(`^sendPhoto$`, "i").exec(method)) {
            return await this.sendPhoto(option["chat_id"], option["photo"], option["caption"], option["parse_mode"], option["entities"], option["disable_notification"], option["reply_to_message_id"], option["reply_markup"])

        }

        if (new RegExp(`^sendAudio$`, "i").exec(method)) {
            return await this.sendAudio(option["chat_id"], option["audio"], option["caption"], option["parse_mode"], option["entities"], option["disable_notification"], option["reply_to_message_id"], option["reply_markup"])
        }

        if (new RegExp(`^sendVoice$`, "i").exec(method)) {
            return await this.sendVoice(option["chat_id"], option["voice"], option["caption"], option["parse_mode"], option["entities"], option["disable_notification"], option["reply_to_message_id"], option["reply_markup"])

        }

        if (new RegExp(`^sendVideo$`, "i").exec(method)) {
            return await this.sendVideo(option["chat_id"], option["video"], option["caption"], option["parse_mode"], option["entities"], option["disable_notification"], option["reply_to_message_id"], option["reply_markup"])
        }

        if (new RegExp(`^leaveChat$`, "i").exec(method)) {
            return await this.leaveChat(option["chat_id"])
        }
        if (new RegExp(`^getMessage$`, "i").exec(method)) {
            var getMessage = await this.getMessage(option["chat_id"], option["message_id"]);
            var json = {};
            json["_"] = "updateNewMessage";
            json["message"] = getMessage;
            var lib = new updateApi(this);
            var update = await lib.update(json);
            return update;
        }

        if (new RegExp(`^answerCallbackQuery$`, "i").exec(method)) {
            return await this.answerCallbackQuery(option["callback_query_id"], option["text"], option["show_alert"], option["url"], option["cache_time"])
        }
        if (new RegExp(`^getChatAdministrators$`, "i").exec(method)) {
            return await this.getChatAdministrators(option["chat_id"])
        }

        if (new RegExp(`^getChatMember$`, "i").exec(method)) {
            var getChatMember = await this.getChatMember(option["chat_id"], option["user_id"])
            if (!getChatMember["_"]) {
                await this.getChat(option["chat_id"]);
                return await this.request("getChatMember", { "chat_id": option["chat_id"], "user_id": option["user_id"] });
            } else if (new RegExp(`^chatMember$`, "i").exec(getChatMember["_"])) {
                var json = {};
                var getUser = await this.request("getUser", { "chat_id": getChatMember["member_id"]["user_id"] })
                json["user"] = getUser["result"];
                json["join_date"] = getChatMember["joined_chat_date"];
                var status = getChatMember["status"];
                json["status"] = status["_"].toLocaleLowerCase().replace(/(chatmemberstatus)/ig, "");
                json["custom_title"] = status["custom_title"];
                json["can_be_edited"] = status["can_be_edited"];
                json["can_manage_chat"] = status["can_manage_chat"];
                json["can_change_info"] = status["can_change_info"];
                json["can_post_messages"] = status["can_post_messages"];
                json["can_edit_messages"] = status["can_edit_messages"];
                json["can_delete_messages"] = status["can_delete_messages"];
                json["can_invite_users"] = status["can_invite_users"];
                json["can_restrict_members"] = status["can_restrict_members"];
                json["can_pin_messages"] = status["can_pin_messages"];
                json["can_promote_members"] = status["can_promote_members"];
                json["can_manage_voice_chats"] = status["can_manage_voice_chats"];
                json["is_anonymous"] = status["is_anonymous"];
                return { ok: true, result: json };
            } else {
                return { ok: false, result: getChatMember };
            }
        }
        if (new RegExp(`^editMessageText$`, "i").exec(method)) {
            return await this.editMessageText(option["chat_id"], option["message_id"], option["text"], option["parse_mode"], option["entities"], option["disable_web_page_preview"], option["reply_markup"])
        }

        if (new RegExp(`^forwardMessage$`, "i").exec(method)) {
            return await this.forwardMessage(option["chat_id"], option["from_chat_id"], option["message_id"], false);
        }

        if (new RegExp(`^copyMessage$`, "i").exec(method)) {
            return await this.copyMessage(option["chat_id"], option["from_chat_id"], option["message_id"], option["caption"], option["parse_mode"], option["entities"], option["disable_notification"], option["reply_to_message_id"], option["reply_markup"]);
        }

        if (new RegExp(`^getChats$`, "i").exec(method)) {
            var getchats = await this.getChats()

            if (new RegExp("^chats$", "i").exec(getchats["_"])) {
                var json = {};
                if (getchats["total_count"] > 0) {
                    json["total_count"] = getchats["total_count"];
                    var array_data = []
                    for (var i = 0; i < getchats["chat_ids"].length; i++) {
                        var loop_data = getchats["chat_ids"][i];
                        var json_loop = {};
                        if (new RegExp("-.*", "i").exec(loop_data)) {
                            try {
                                var data = {
                                    "chat_id": loop_data
                                };
                                var getSupergroup = await this.request("getSupergroup", data);
                                if (getSupergroup["ok"]) {
                                    json_loop["id"] = loop_data;
                                    var result = getSupergroup["result"];
                                    if (result["username"]) {
                                        json_loop["username"] = result["username"];
                                    }
                                    if (result["type"]) {
                                        json_loop["type"] = result["type"];
                                    }
                                    json_loop["detail"] = result["detail"];
                                }
                            } catch (e) {

                            }
                        }
                        array_data.push(json_loop);
                    }
                    json["data"] = array_data;
                    return { "ok": true, "result": json };
                } else {
                    return { "ok": false };
                }
            } else {
                return { "ok": false };
            }
        }

        if (new RegExp(`^getSupergroupMembers$`, "i").exec(method)) {
            var getMembers = await this.getSupergroupMembers(option["chat_id"], option["offset"])
            if (new RegExp("^chatMembers$", "i").exec(getMembers["_"])) {
                var json_data = {};
                json_data["total_count"] = getMembers["total_count"];
                var array = [];
                for (var i = 0; i < getMembers["members"].length; i++) {
                    var loop_data = getMembers["members"][i];
                    var getUser = await this.getUser(loop_data["user_id"])
                    if (new RegExp("^user$", "i").exec(getUser["_"])) {
                        var json = {};
                        json["id"] = getUser["id"];
                        try {
                            if (new RegExp("^userTypeBot$", "i").exec(getUser.type["_"])) {
                                json["is_bot"] = true;
                            } else {
                                json["is_bot"] = false;
                            }
                        } catch (e) {
                            json["is_bot"] = false;
                        }
                        json["first_name"] = getUser["first_name"];
                        if (getUser["last_name"]) {
                            json["last_name"] = getUser["last_name"];
                        }
                        if (getUser["username"]) {
                            json["username"] = getUser["username"];
                        }
                        if (getUser["phone_number"]) {
                            json["phone_number"] = getUser["phone_number"];
                        }
                        if (loop_data["status"]["_"]) {
                            json["status"] = loop_data["status"]["_"].toLocaleLowerCase().replace(/(chatMemberStatus)/ig, "")
                        }

                        if (getUser["language_code"]) {
                            json["language_code"] = getUser["language_code"];
                        }
                        json["detail"] = {
                            "contact": getUser["is_contact"],
                            "mutual": getUser["is_mutual_contact"],
                            "verified": getUser["is_verified"],
                            "support": getUser["is_support"],
                            "scam": getUser["is_scam"],
                            "fake": getUser["is_fake"],
                            "acces": getUser["have_access"]
                        };
                        array.push(json);
                    }
                }
                json_data["data"] = array;
                return { "ok": true, "result": json_data };
            } else {
                return { "ok": false, "result": getMembers };

            }
        }
        if (new RegExp(`^joinChat$`, "i").exec(method)) {
            var joinChat = await this.joinChat(option["chat_id"])
            if (new RegExp("^ok$", "i").exec(joinChat["_"])) {
                return { "ok": true }
            } else {
                return { "ok": false }
            }
        }
        if (new RegExp(`^searchPublicChats$`, "i").exec(method)) {
            var searchPublicChats = await this.searchPublicChats(option.query)
            if (new RegExp("^chats$", "i").exec(searchPublicChats["_"])) {
                var json = {}
                if (searchPublicChats["total_count"] > 0) {
                    json.total_count = searchPublicChats["total_count"];
                    var array_data = []
                    for (var i = 0; i < searchPublicChats["chat_ids"].length; i++) {
                        var loop_data = searchPublicChats["chat_ids"][i];
                        var json_loop = {};
                        if (new RegExp("-.*", "i").exec(loop_data)) {
                            var data = {
                                "chat_id": loop_data
                            };
                            var getSupergroup = await this.request("getSupergroup", data);
                            if (getSupergroup["ok"]) {
                                json_loop["id"] = loop_data
                                var result = getSupergroup["result"]
                                if (result["username"]) {
                                    json_loop["username"] = result["username"]
                                }
                                if (result["type"]) {
                                    json_loop["type"] = result["type"];
                                }
                                json_loop["detail"] = result["detail"];
                            }
                        }
                        array_data.push(json_loop);

                    }
                    json["data"] = array_data;
                } else {
                    return { "ok": false };
                }
                return { "ok": true, "result": json };
            } else {
                return { "ok": false, "result": searchPublicChats };
            }
        }

        if (new RegExp(`^getSupergroup$`, "i").exec(method)) {
            var getSupergroup = await this.getSupergroup(option["chat_id"])
            if (new RegExp("^supergroup$", "i").exec(getSupergroup["_"])) {
                var json = {};
                json["id"] = Number(`-100${getSupergroup["id"]}`);
                if (getSupergroup["username"]) {
                    json["username"] = getSupergroup["username"];
                }
                if (getSupergroup["is_channel"]) {
                    json["type"] = "channel";
                } else {
                    json["type"] = "supergroup";
                }
                json["detail"] = {
                    "member_count": getSupergroup["member_count"],
                    "linked_chat": getSupergroup["has_linked_chat"],
                    "has_location": getSupergroup["has_location"],
                    "sign_messages": getSupergroup["sign_messages"],
                    "is_slow_mode_enabled": getSupergroup["is_slow_mode_enabled"],
                    "is_broadcast_group": getSupergroup["is_broadcast_group"],
                    "is_verified": getSupergroup["is_verified"],
                    "is_scam": getSupergroup["is_scam"],
                    "is_fake": getSupergroup["is_fake"]
                };
                return { "ok": true, "result": json };
            } else {
                return { "ok": false, "result": getSupergroup };
            }

        }
        if (new RegExp(`^getMe$`, "i").exec(method)) {
            var getMe = await this.getMe();
            if (new RegExp("^user$", "i").exec(getMe["_"])) {
                var json = {};
                json["id"] = getMe["id"];
                try {
                    if (new RegExp("^userTypeBot$", "i").exec(getMe["type"]["_"])) {
                        json["is_bot"] = true;
                    } else {
                        json["is_bot"] = false;
                    }
                } catch (e) {
                    json["is_bot"] = false;
                }
                json["first_name"] = getMe["first_name"];
                if (getMe["last_name"]) {
                    json["last_name"] = getMe["last_name"];
                }
                if (getMe["username"]) {
                    json["username"] = getMe["username"];
                }
                if (getMe["phone_number"]) {
                    json["phone_number"] = getMe["phone_number"];
                }
                if (getMe["status"]["_"]) {
                    json["status"] = getMe["status"]["_"].toLocaleLowerCase().replace(/(userStatus)/ig, "");
                }

                if (getMe["language_code"]) {
                    json["language_code"] = getMe["language_code"];
                }
                json["detail"] = {
                    "contact": getMe["is_contact"],
                    "mutual": getMe["is_mutual_contact"],
                    "verified": getMe["is_verified"],
                    "support": getMe["is_support"],
                    "scam": getMe["is_scam"],
                    "fake": getMe["is_fake"],
                    "acces": getMe["have_access"]
                };
                return { "ok": true, "result": json };
            } else {
                return { "ok": false, "result": getMe };
            }
        }

        if (RegExp(`^getUser$`, "i").exec(method)) {
            var getUser = await this.getUser(option["chat_id"]);
            if (new RegExp("^user$", "i").exec(getUser["_"])) {
                var json = {}
                json["id"] = Number(getUser["id"])
                try {
                    if (new RegExp("^userTypeBot$", "i").exec(getUser["type"]["_"])) {
                        json["is_bot"] = true
                    } else {
                        json["is_bot"] = false
                    }
                } catch (e) {
                    json["is_bot"] = false
                }
                json["first_name"] = getUser["first_name"];
                if (getUser["last_name"]) {
                    json["last_name"] = getUser["last_name"];
                }
                if (getUser["username"]) {
                    json["username"] = getUser["username"];
                }
                if (getUser["phone_number"]) {
                    json["phone_number"] = Number(getUser["phone_number"]);
                }
                if (getUser["status"]["_"]) {
                    json["status"] = String(getUser["status"]["_"]).replace(/(userStatus)/ig, "").toLocaleLowerCase();
                }
                json["type"] = "private";
                if (getUser["language_code"]) {
                    json["language_code"] = getUser["language_code"];
                }
                json["detail"] = {
                    "contact": getUser["is_contact"],
                    "mutual": getUser["is_mutual_contact"],
                    "verified": getUser["is_verified"],
                    "support": getUser["is_support"],
                    "scam": getUser["is_scam"],
                    "fake": getUser["is_fake"],
                    "acces": getUser["have_access"]
                };
                return { "ok": true, "result": json };
            } else {
                return { "ok": false, "result": getUser };
            }
        }
        if (new RegExp(`^getChat$`, "i").exec(method)) {
            var getchat = await this.getChat(option["chat_id"]);
            if (getchat && RegExp("^chat$", "i").exec(getchat["_"])) {
                var type_chat = String(getchat["type"]["_"]).toLocaleLowerCase().replace(/(chattype)/ig, "");
                var json = {};
                if (getchat["type"]["is_channel"]) {
                    var getSupergroup = await this.getSupergroup(option["chat_id"]);
                    var json = {};
                    json["id"] = Number(option["chat_id"]);
                    json["title"] = getchat["title"];
                    if (getSupergroup["username"]) {
                        json["username"] = getSupergroup["username"];
                    }
                    if (getSupergroup["status"]) {
                        json["status"] = String(getSupergroup["status"]["_"]).replace(/(chatMemberStatus)/ig, "").toLocaleLowerCase();
                    }
                    json["type"] = "channel";
                    json["detail"] = {
                        "member_count": getSupergroup["member_count"],
                        "has_linked_chat": getSupergroup["has_linked_chat"],
                        "has_location": getSupergroup["has_location"],
                        "sign_messages": getSupergroup["sign_messages"],
                        "is_slow_mode_enabled": getSupergroup["is_slow_mode_enabled"],
                        "is_broadcast_group": getSupergroup["is_broadcast_group"],
                        "is_verified": getSupergroup["is_verified"],
                        "is_scam": getSupergroup["is_scam"],
                        "is_fake": getSupergroup["is_fake"]
                    };
                    return { ok: true, result: json };
                } else if (RegExp("supergroup", "i").exec(type_chat)) {
                    var getSupergroup = await this.getSupergroup(option["chat_id"]);
                    var json = {};
                    json["id"] = Number(option["chat_id"]);
                    json["title"] = getchat["title"];
                    if (getSupergroup["username"]) {
                        json["username"] = getSupergroup["username"];
                    }
                    if (getSupergroup["status"]) {
                        json["status"] = String(getSupergroup["status"]["_"]).replace(/(chatMemberStatus)/ig, "").toLocaleLowerCase();
                    }
                    json["type"] = "supergroup";
                    json["detail"] = {
                        "member_count": getSupergroup["member_count"],
                        "has_linked_chat": getSupergroup["has_linked_chat"],
                        "has_location": getSupergroup["has_location"],
                        "sign_messages": getSupergroup["sign_messages"],
                        "is_slow_mode_enabled": getSupergroup["is_slow_mode_enabled"],
                        "is_broadcast_group": getSupergroup["is_broadcast_group"],
                        "is_verified": getSupergroup["is_verified"],
                        "is_scam": getSupergroup["is_scam"],
                        "is_fake": getSupergroup["is_fake"]
                    };
                    return { ok: true, result: json };
                } else if (RegExp("BasicGroup", "i").exec(type_chat)) {
                    var getBasicGroup = await this.getBasicGroup(option["chat_id"]);
                    var json = {};
                    json["id"] = Number(option["chat_id"]);
                    json["title"] = getchat["title"];
                    if (getBasicGroup["status"]) {
                        json["status"] = String(getBasicGroup["status"]["_"]).replace(/(chatMemberStatus)/ig, "").toLocaleLowerCase();
                    }
                    json["type"] = "group";
                    json["detail"] = {
                        "memberCount": getBasicGroup["member_count"]
                    };
                    return { ok: true, result: json };
                } else if (RegExp("private", "i").exec(type_chat)) {
                    var getUser = await this.getUser(option["chat_id"]);
                    if (new RegExp("^user$", "i").exec(getUser["_"])) {
                        var json = {}
                        json["id"] = Number(getUser["id"])
                        try {
                            if (new RegExp("^userTypeBot$", "i").exec(getUser["type"]["_"])) {
                                json["is_bot"] = true
                            } else {
                                json["is_bot"] = false
                            }
                        } catch (e) {
                            json["is_bot"] = false
                        }
                        json["first_name"] = getUser["first_name"]
                        if (getUser["last_name"]) {
                            json["last_name"] = getUser["last_name"]
                        }
                        if (getUser["username"]) {
                            json["username"] = getUser["username"]
                        }
                        if (getUser["phone_number"]) {
                            json["phone_number"] = Number(getUser["phone_number"])
                        }
                        if (getUser["status"]["_"]) {
                            json["status"] = String(getUser["status"]["_"]).replace(/(userStatus)/ig, "").toLocaleLowerCase();
                        }
                        json["type"] = "private";
                        if (getUser["language_code"]) {
                            json["language_code"] = getUser["language_code"]
                        }
                        json["detail"] = {
                            "contact": getUser["is_contact"],
                            "mutual": getUser["is_mutual_contact"],
                            "verified": getUser["is_verified"],
                            "support": getUser["is_support"],
                            "scam": getUser["is_scam"],
                            "fake": getUser["is_fake"],
                            "acces": getUser["have_access"]
                        };
                        return { "ok": true, "result": json };
                    } else {
                        return { "ok": false, "result": getUser };
                    }
                } else {
                    console.log(JSON.stringify(type_chat, null, 2))
                    return { "ok": false };
                }

            }
        }
    }

    async acceptCall(call_id, udp_p2p, udp_reflector, min_layer, max_layer, library_versions) {
        var data = {
            '_': "acceptCall",
            "call_id": call_id,
            "protocol": {
                udp_p2p: udp_p2p,
                udp_reflector: udp_reflector,
                min_layer: min_layer,
                max_layer: max_layer,
                library_versions: library_versions
            }
        }
        return await this.handle.invoke(data);
    }

    async acceptTermsOfService(terms_of_service_id) {
        var data = {
            '_': "acceptTermsOfService",
            terms_of_service_id: terms_of_service_id
        };
        return await this.handle.invoke(data);
    }
    async addChatMember(chat_id, user_id, forward_limit) {
        var typeChat = await this.typeChat_Id(chat_id);
        var data = {
            '_': "addChatMember",
            "chat_id": typeChat,
            "user_id": user_id
        };
        if (forward_limit) {
            data["forward_limit"] = forward_limit;
        }
        return await this.handle.invoke(data);
    }
    async addChatMembers(chat_id, user_ids) {
        var typeChat = await this.typeChat_Id(chat_id);
        var data = {
            '_': "addChatMembers",
            "chat_id": typeChat,
            "user_ids": user_ids
        }
        return await this.handle.invoke(data)
    }
    /*
    async addChatToList(chat_id, user_ids) {
        var typeChat = await this.typeChat_Id(chat_id)
        var data = {
            '_': "addChatMembers",
            chat_id: typeChat,
            chat_list: {

            }
        }
        return this.handle.invoke(data)
    }*/

    async addContact(user_id, first_name, last_name = "", phone_number = "", vcard = "", share_phone_number = false) {

        var data = {
            '_': "addContact",
            "contact": {
                "phone_number": phone_number,
                "first_name": first_name,
                "last_name": last_name,
                "vcard": vcard,
                "user_id": user_id
            },
            "share_phone_number": share_phone_number
        };
        return await this.handle.invoke(data);
    }
    parseMode(text, parse_mode, entities) {
        var pesan = { "text": text };
        var parseMode = 'textParseModeHTML'
        if (typeof parse_mode == "string") {
            parse_mode = parse_mode.toLowerCase();
            if (parse_mode == 'markdown') {
                parseMode = 'textParseModeMarkdown'
            } else if (parse_mode == 'html') {
                parseMode = 'textParseModeHTML';
            } else {
                parse_mode = false;
            }
        }

        if (typeof parse_mode == "string") {
            pesan = this.handle.execute({
                "_": 'parseTextEntities',
                "parse_mode": { "_": parseMode },
                "text": text
            });
        }

        if (entities) {
            pesan = {
                _: 'formattedText',
                text: text,
                entities: entities
            };
        }
        return pesan;
    }


    async invoke(method, parameters = false) {
        var data = {
            '_': method
        };
        if (parameters) {
            libForEach(parameters, (nilai, index) => {
                data[index] = nilai
            });
        }
        return await this.handle.invoke(data);
    }




    typeFile(content) {

        var data = {}

        if (/^http/i.exec(content)) {
            data = {
                '_': 'inputFileRemote',
                id: content
            };
        } else if (/^(\/|\.\.?\/|~\/)/i.exec(content)) { // deteksi : awal / atau ./ ../ atau ~/
            data = {
                '_': 'inputFileLocal',
                path: content
            };
        } else if (typeof content === 'number') {
            data = {
                '_': 'inputFileId',
                id: content
            };
        } else {
            data = {
                '_': 'inputFileRemote',
                id: content
            };

            // mode blob belum aku masukkan, butuh waktu buat coba-coba
        }

        return data;

    }
    async getCallbackQueryAnswer(chat_id, message_id, data) {
        var option = {
            "_": "getCallbackQueryAnswer",
            "chat_id": chat_id,
            "message_id": message_id,
            "payload": {
                "_": "callbackQueryPayloadData",
                "data": Buffer.from(data).toString('base64')
            }
        };
        return await this.handle.invoke(option);
    }
    async createPrivateChat(user_id, force = false) {
        var option = {
            "_": "createPrivateChat",
            "user_id": user_id,
            "force": force
        };
        return await this.handle.invoke(option);
    }
    async sendBotStartMessage(chat_id, bot_user_id, parameter) {
        var option = {
            "_": "sendBotStartMessage",
            "bot_user_id": bot_user_id,
            "chat_id": chat_id
        };
        if (parameter) {
            option["parameter"] = parameter;
        }
        return await this.handle.invoke(option);
    }
    async deleteMessage(chat_id, message_id, revoke = true) {
        message_id = message_id.constructor === Array ? message_id : [message_id]
        var data = {
            '_': "deleteMessages",
            "chat_id": chat_id,
            "message_ids": message_id,
            "revoke": revoke
        };
        return await this.handle.invoke(data);
    }
    // fungsi seperti Bot API

    async getMe() {
        return await this.handle.invoke({ _: 'getMe' })
    }

    async getMessageLocally(chat_id, message_id) {
        var data = {
            '_': "getMessageLocally",
            chat_id: chat_id,
            message_id: message_id
        };
        return await this.handle.invoke(data)
    }
    async sendMessage(chat_id, text, parse_mode = false, entities = false, disable_web_page_preview = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        var pesan = this.parseMode(text, parse_mode, entities);
        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };
        if (disable_notification) {
            data["disable_notification"] = disable_notification;
        }
        if (reply_to_message_id) {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (reply_markup) {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        data["input_message_content"] = {
            '_': "inputMessageText",
            "text": pesan,
            "disable_web_page_preview": disable_web_page_preview,
            "clear_draft": false
        };
        return await this.handle.invoke(data);
    }


    async editMessageText(chat_id, message_id, text, parse_mode = false, entities = false, disable_web_page_preview = false, reply_markup = false) {
        var pesan = this.parseMode(text, parse_mode, entities)
        var data = {
            '_': "editMessageText",
            "chat_id": chat_id,
            "message_id": message_id,
            "input_message_content": {}
        }
        if (reply_markup) {
            data["reply_markup"] = this.reply_markup(reply_markup)
        }
        data["input_message_content"] = {
            '_': "inputMessageText",
            "text": pesan,
            "disable_web_page_preview": disable_web_page_preview,
            "clear_draft": false
        };
        return await this.handle.invoke(data);
    }

    reply_markup(keyboard) {
        try {
            if (keyboard["inline_keyboard"].length > 0) {
                var json = { "_": "replyMarkupInlineKeyboard" }
                var array_rows = []
                for (var i = 0; i < keyboard["inline_keyboard"].length; i++) {
                    var loop_array_keyboard = keyboard["inline_keyboard"][i]
                    var array_loop = []
                    for (var ii = 0; ii < loop_array_keyboard.length; ii++) {
                        var in_loop_array_keyboard = loop_array_keyboard[ii]
                        var in_json_keyboard = { "_": "inlineKeyboardButton" }
                        if (in_loop_array_keyboard["text"]) {
                            in_json_keyboard["text"] = in_loop_array_keyboard["text"];
                        }

                        if (in_loop_array_keyboard["url"]) {
                            in_json_keyboard["type"] = {
                                "_": "inlineKeyboardButtonTypeUrl",
                                "url": in_loop_array_keyboard["url"]
                            };
                        }

                        if (in_loop_array_keyboard["callback_data"]) {
                            in_json_keyboard["type"] = {
                                "_": "inlineKeyboardButtonTypeCallback",
                                "data": Buffer.from(in_loop_array_keyboard["callback_data"]).toString('base64')
                            };
                        }
                        array_loop.push(in_json_keyboard);
                    }
                    array_rows.push(array_loop);
                }
                json.rows = array_rows;
                return json;
            }

        } catch (e) {
            console.log(e);
            return null;
        }
    }

    async sendChatAction(chat_id, type = 'typing') {
        var action = 'chatActionTyping';
        switch (type.toLowerCase()) {
            case 'photo':
                action = 'chatActionUploadingPhoto'
                break;
            case 'document':
                action = 'chatActionUploadingDocument'
                break;
            case 'video':
                action = 'chatActionUploadingVideo'
                break;
            case 'voice':
            case 'audio':
                action = 'chatActionRecordingVoiceNote'
                break;
            case 'location':
            case 'venue':
                action = 'chatActionChoosingLocation'
                break;
            case 'cancel':
                action = 'chatActionCancel'
                break;
            case 'typing':
            default:
                action = 'chatActionTyping'
                break;
        }

        return await this.handle.invoke({
            '_': "sendChatAction",
            "chat_id": chat_id,
            'action': { '_': action }
        });

    }

    async getMessage(chat_id, message_id) {
        return await this.handle.invoke({
            '_': "getMessage",
            "chat_id": chat_id,
            "message_id": message_id
        });
    }

    async forwardMessage(chat_id, from_chat_id, message_id, send_copy = true, reply_markup) {
        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {
                '_': "inputMessageForwarded",
                "from_chat_id": from_chat_id,
                "message_id": message_id,
                "copy_options": {
                    '_': "messageCopyOptions",
                    "send_copy": send_copy
                }
            }
        };
        if (reply_markup) {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        return await this.handle.invoke(data);
    }

    async copyMessage(chat_id, from_chat_id, message_id, new_caption = false, parse_mode = "html", entities = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "options": {},
            "input_message_content": {
                '_': "inputMessageForwarded",
                "from_chat_id": from_chat_id,
                "message_id": message_id,
                "copy_options": {
                    '_': "messageCopyOptions",
                    "send_copy": true
                }
            }
        };
        if (new_caption) {
            var pesan = this.parseMode(new_caption, parse_mode, entities);
            data["input_message_content"]["copy_options"]["replace_caption"] = true;
            data["input_message_content"]["copy_options"]["new_caption"] = pesan;
        }
        if (disable_notification) {
            data["options"]["disable_notification"] = disable_notification;
        }
        if (reply_to_message_id) {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (reply_markup) {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        return await this.handle.invoke(data);
    }


    async pinChatMessage(chat_id, message_id, disable_notification = false, only_for_self = false) {
        var data = {
            '_': "pinChatMessage",
            "chat_id": chat_id,
            "message_id": message_id
        };

        if (disable_notification) {
            data["disable_notification"] = disable_notification;
        }

        if (only_for_self) {
            data["only_for_self"] = only_for_self;
        }

        return await this.handle.invoke(data);
    }

    async unpinChatMessage(chat_id, message_id) {
        var data = {
            '_': "unpinChatMessage",
            "chat_id": chat_id,
            "message_id": message_id
        };
        return await this.handle.invoke(data)
    }

    async unpinAllMessages(chat_id) {
        var data = {
            '_': "unpinAllMessages",
            "chat_id": chat_id
        };
        return await this.handle.invoke(data);
    }

    async getUser(user_id) {
        var data = {
            '_': "getUser",
            "user_id": user_id
        };
        return await this.handle.invoke(data);
    }

    async custom(Method, parameters) {
        var data = {
            '_': "sendCustomRequest",
            "method": Method,
            "parameters": parameters
        };
        return await this.handle.invoke(data);
    }

    async getUserFullInfo(user_id, nau = false) {
        var param = {
            '_': "getUserFullInfo",
            "user_id": user_id
        };
        var data = await this.handle.invoke(param);
        if (nau) {
            return data;
        }
        try {
            if (new RegExp("^userFullInfo$", "i").exec(data["_"])) {
                if (new RegExp("^chatPhoto$", "i").exec(data["photo"]["_"])) {
                    if (data["photo"]["sizes"].length > 0) {
                        var json = {}
                        var size_photo = []
                        var photo = data["photo"]["sizes"];
                        for (var i = 0; i < photo.length; i++) {
                            var photo_json = photo[i]
                            var json_photo = {}
                            if (new RegExp("^remoteFile$", "i").exec(photo_json["photo"]["remote"]["_"])) {
                                json_photo["file_id"] = photo_json["photo"]["remote"]["id"];
                            }
                            if (photo_json["photo"]["remote"]["unique_id"]) {
                                json_photo["file_unique_id"] = photo_json["photo"]["remote"]["unique_id"];
                            }
                            json_photo["file_size"] = photo_json["photo"]["size"];
                            json_photo["width"] = photo_json["width"];
                            json_photo["height"] = photo_json["height"];

                            size_photo.push(json_photo);
                        }
                        json["photo"] = size_photo
                        json["bio"] = data["bio"];
                        return json;
                    }
                }
            } else {
                return data;
            }
        } catch (e) {
            var json = {}
            json.photo = []
            json.bio = false
            return json
        }
    }
    async getUserProfilePhotos(user_id, offset = 0, limit = 1) {
        var data = {
            '_': "getUserProfilePhotos",
            "user_id": user_id,
            "offset": offset,
            "limit": limit
        };
        return await this.handle.invoke(data)
    }

    async searchChatsOnServer(query, limit = 1) {
        var data = {
            '_': "searchChatsOnServer",
            'query': query,
            "limit": limit
        };
        return await this.handle.invoke(data)
    }
    async searchPublicChat(username) {
        var data = {
            '_': "searchPublicChat",
            'username': username
        };
        return await this.handle.invoke(data)
    }
    async searchPublicChats(query = "") {
        var data = {
            '_': "searchPublicChats",
            'query': query
        };
        return await this.handle.invoke(data)
    }

    async sendPhoto(chat_id, photo, caption = false, parse_mode = false, caption_entities = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        // { '_': 'inputFileBlob', name: file.name, size: file.size, data: file },
        var detailData = this.typeFile(photo)

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };
        if (typeof disable_notification == "boolean") {
            data["disable_notification"] = disable_notification;
        }

        if (typeof reply_to_message_id == "number") {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (typeof reply_markup == "object") {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        data["input_message_content"] = {
            '_': "inputMessagePhoto",
            "photo": detailData,
        };
        if (caption) {
            var text = this.parseMode(caption, parse_mode, caption_entities);
            data["input_message_content"]["caption"] = text;
        }

        return await this.handle.invoke(data);
    }

    async sendDocument(chat_id, document, caption = false, parse_mode = false, caption_entities = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        // { '_': 'inputFileBlob', name: file.name, size: file.size, data: file },
        var detailData = this.typeFile(document)

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };

        if (typeof disable_notification == "boolean") {
            data["disable_notification"] = disable_notification;
        }

        if (typeof reply_to_message_id == "number") {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (typeof reply_markup == "object") {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        data["input_message_content"] = {
            '_': "inputMessageDocument",
            "document": detailData,
        };

        if (caption) {
            var text = this.parseMode(caption, parse_mode, caption_entities);
            data["input_message_content"]["caption"] = text;
        }

        return await this.handle.invoke(data)
    }

    async sendVideo(chat_id, video, caption = false, parse_mode = false, caption_entities = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        // { '_': 'inputFileBlob', name: file.name, size: file.size, data: file },
        var detailData = this.typeFile(video)

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };

        if (typeof disable_notification == "boolean") {
            data["disable_notification"] = disable_notification;
        }

        if (typeof reply_to_message_id == "number") {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (typeof reply_markup == "object") {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        data["input_message_content"] = {
            '_': "inputMessageVideo",
            "video": detailData,
        };

        if (caption) {
            var text = this.parseMode(caption, parse_mode, caption_entities);
            data["input_message_content"]["caption"] = text;
        }

        return this.handle.invoke(data)
    }

    async sendAudio(chat_id, audio, caption = false, parse_mode = false, caption_entities = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        // { '_': 'inputFileBlob', name: file.name, size: file.size, data: file },
        var detailData = this.typeFile(audio);

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };


        if (typeof disable_notification == "boolean") {
            data["disable_notification"] = disable_notification;
        }

        if (typeof reply_to_message_id == "number") {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (typeof reply_markup == "object") {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }

        data["input_message_content"] = {
            '_': "inputMessageAudio",
            "audio": detailData,
        };

        if (caption) {
            var text = this.parseMode(caption, parse_mode, caption_entities);
            data["input_message_content"]["caption"] = text;
        }

        return await this.handle.invoke(data);
    }

    async sendVoice(chat_id, voice, caption = false, parse_mode = false, caption_entities = false, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        // { '_': 'inputFileBlob', name: file.name, size: file.size, data: file },
        var detailData = this.typeFile(voice);

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };


        if (typeof disable_notification == "boolean") {
            data["disable_notification"] = disable_notification;
        }

        if (typeof reply_to_message_id == "number") {
            data["reply_to_message_id"] = reply_to_message_id;
        }
        if (typeof reply_markup == "object") {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }

        data["input_message_content"] = {
            '_': "inputMessageVoiceNote",
            "voice_note": detailData,
        };


        if (caption) {
            var text = this.parseMode(caption, parse_mode, caption_entities);
            data["input_message_content"]["caption"] = text;
        }

        return await this.handle.invoke(data);
    }

    async sendSticker(chat_id, sticker, disable_notification = false, reply_to_message_id = false, reply_markup = false) {
        // { '_': 'inputFileBlob', name: file.name, size: file.size, data: file },
        var detailData = this.typeFile(sticker)

        var data = {
            '_': "sendMessage",
            "chat_id": chat_id,
            "input_message_content": {}
        };

        if (typeof disable_notification == "boolean") {
            data["disable_notification"] = disable_notification;
        }

        if (typeof reply_to_message_id == "number") {
            data["reply_to_message_id"] = reply_to_message_id;
        }

        data["input_message_content"] = {
            '_': "inputMessageSticker",
            "sticker": detailData,
        };
        if (typeof reply_markup == "object") {
            data["reply_markup"] = this.reply_markup(reply_markup);
        }
        return await this.handle.invoke(data);
    }

    async answerCallbackQuery(callback_query_id, text = false, show_alert = false, url = false, cache_time = false) {
        var data = {
            '_': "answerCallbackQuery",
            "callback_query_id": callback_query_id
        };
        if (text) {
            data["text"] = text;
        }
        if (show_alert) {
            data["show_alert"] = show_alert;
        }
        if (url) {
            data["url"] = url;
        }
        if (cache_time) {
            data["cache_time"] = cache_time;
        }
        return await this.handle.invoke(data);
    }

    // userbot

    async searchPublicChats(query) {
        var data = {
            '_': "searchPublicChats",
            "query": query
        };
        return await this.handle.invoke(data);
    }

    async viewMessages(chat_id, message_id, force_read = false) {
        message_id = message_id.constructor === Array ? message_id : [message_id]
        var data = {
            '_': "viewMessages",
            "chat_id": chat_id,
            "message_ids": message_id
        };

        if (typeof force_read == "boolean") {
            data["force_read"] = force_read;
        }

        return await this.handle.invoke(data);
    }

    async getChatStatistics(chat_id) {
        var data = {
            '_': "getChatStatistics",
            "chat_id": chat_id
        };
        return await this.handle.invoke(data);
    }

    async getChats() {
        return await this.handle.invoke({
            '_': 'getChats',
            "offset_order": '9223372036854775807',
            "offset_chat_id": 0,
            "limit": Math.floor(Math.random() * 9999999)
        });
    }

    // Returns information about a chat by its identifier, this is an offline request if the current user is not a bot.
    async getChat(chat_id) {
        var data = {
            '_': "getChat",
            "chat_id": Number(chat_id)
        };
        return await this.handle.invoke(data);
    }

    async getBasicGroup(chat_id) {
        var chat_id = String(chat_id).replace(/(-100|-)/ig, "");
        var data = {
            '_': "getBasicGroup",
            "basic_group_id": Number(chat_id)
        };
        return await this.handle.invoke(data);
    }


    async getChatAdministrators(chat_id) {
        var data = {
            '_': "getChatAdministrators",
            "chat_id": chat_id
        };
        var data = await this.handle.invoke(data);
        if (new RegExp("^chatAdministrators$", "i").exec(data["_"])) {
            var json = {};
            var array_admin = [];
            if (data["administrators"].length > 0) {
                for (var i = 0; i < data["administrators"].length; i++) {
                    var loop_admin = data["administrators"][i];
                    var json_data = {};
                    var getChatMember = await this.getChatMember(chat_id, loop_admin["user_id"]);
                    var getUser = await this.getUser(loop_admin["user_id"]);
                    var json_user = {};
                    json_user["id"] = loop_admin["user_id"];
                    json_user["first_name"] = getUser["first_name"];
                    if (getUser["last_name"]) {
                        json_user["last_name"] = getUser["last_name"];
                    }
                    if (getUser["username"]) {
                        json_user["username"] = getUser["username"];
                    }
                    if (getUser["status"]["_"]) {
                        json_user["status"] = getUser["status"]["_"].toLowerCase().replace(/(userStatus)/ig, "");
                    }
                    if (getUser["phone_number"]) {
                        json_user["phone_number"] = getUser["phone_number"];
                    }
                    if (getUser["language_code"]) {
                        json_user["language_code"] = getUser["language_code"];
                    }
                    var json_user_detail = {};
                    json_user_detail.contact = getUser.is_contact
                    json_user_detail.mutual = getUser.is_mutual_contact
                    json_user_detail.verified = getUser.is_verified
                    json_user_detail.support = getUser.is_support
                    json_user_detail.scam = getUser.is_scam
                    json_user_detail.fake = getUser.is_fake

                    json_user_detail.detail = json_user_detail
                    json_data.user = json_user
                    if (getChatMember["status"]["_"]) {
                        json_data["status"] = getChatMember["status"]["_"].toLowerCase().replace(/(chatMemberStatus)/ig, "")
                    }
                    array_admin.push(json_data)
                }
            }
            json.ok = true
            json.result = array_admin
            return json
        }
    }

    async getChatMember(chat_id, user_id) {
        var data = {
            '_': "getChatMember",
            "chat_id": chat_id,
            "member_id": {
                "_": "messageSenderUser",
                "user_id": user_id
            }
        };
        return await this.handle.invoke(data);

    }
    async getChatList() {
        var { chat_ids } = await this.getChats()

        const chats = [];
        for (const chat_id of chat_ids) {
            const chat = await this.request("getChat", { chat_id: chat_id })
            if (chat.ok) {
                chats.push(chat.result);
            }
        }
        if (chats.length > 0) {
            return { oke: true, result: chats };
        } else {
            return { ok: false };
        }
    }

    async destroy() {
        var data = {
            '_': "destroy"
        };
        return await this.handle.invoke(data)
    }

    async joinChat(chat_id) {
        return await this.handle.invoke({
            '_': 'joinChat',
            "chat_id": chat_id
        });
    }

    async joinChatByInviteLink(link) {
        return await this.handle.invoke({
            '_': 'joinChatByInviteLink',
            "invite_link": link
        });
    }

    async leaveChat(chat_id) {
        return await this.handle.invoke({
            '_': "leaveChat",
            "chat_id": chat_id
        });
    }

    async setBio(bio) {
        return await this.handle.invoke({
            '_': "setBio",
            "bio": bio
        });
    }

    async setUsername(username) {
        return await this.handle.invoke({
            '_': "setUsername",
            "username": username
        });
    }

    async getChatHistory(chat_id, from_message_id, offset, limit, only_local = false) {
        return await this.handle.invoke({
            '_': "getChatHistory",
            "chat_id": chat_id,
            "from_message_id": from_message_id,
            "offset": offset,
            "limit": limit,
            "only_local": only_local
        });
    }

    async getFile(file_id) {
        return await this.handle.invoke({
            '_': "getFile",
            "file_id": file_id
        });
    }

    async createCall(user_id, is_video) {
        return await this.handle.invoke({
            '_': "createCall",
            'user_id': user_id,
            'protocol': {
                '_': 'callProtocol',
                'udp_p2p': true,
                'udp_reflector': true,
                'min_layer': 65,
                'max_layer': 65,
            },
            'is_video': is_video
        })
    }
    async getSupergroup(chat_id) {
        var chat_id = String(chat_id).replace(/(-100|-)/ig, "")
        return await this.handle.invoke({
            '_': "getSupergroup",
            'supergroup_id': Number(chat_id)
        });
    }
    async getSupergroupMembers(chat_id, offset = 0) {
        if (new RegExp("^-.*", "i").exec(chat_id)) {
            chat_id = String(chat_id).replace(/(-100)/ig, "")
        } else {
            chat_id = chat_id
        }
        var hasil = await this.handle.invoke({
            '_': "getSupergroupMembers",
            'supergroup_id': Number(chat_id),
            'offset': offset,
            'limit': 200
        })
        return hasil;
    }
    async getSupergroupFullInfo(chat_id) {
        var chat_id = chat_id
        if (RegExp("^-.*", "i").exec(chat_id)) {
            chat_id = String(chat_id).replace(/(-100)/ig, "")
        } else {
            chat_id = chat_id
        }
        return await this.handle.invoke({
            '_': "getSupergroupFullInfo",
            'supergroup_id': chat_id
        });
    }
    async typeChat_Id(chat_id) {
        if (typeof chat_id == "string") {
            var searchPublicChat = await this.searchPublicChat(String(chat_id).replace(/(@)/ig, ""));
            if (searchPublicChat["_"]) {
                return searchPublicChat["id"];
            }
        } else {
            return chat_id;
        }
    }

    async typeMessage_id(message_id) {
        if (new RegExp("^https://|t.me", "i").exec(message_id)) {
            var getMessageLinkInfo = await this.getMessageLinkInfo(message_id);
            if (getMessageLinkInfo["_"]) {
                if (getMessageLinkInfo["message"]) {
                    return getMessageLinkInfo["message"]["id"];
                }
            }
        } else {
            return message_id;
        }
    }
    async reportChat(chat_id, type = "custom", text = "report", message_id) {
        var check = await this.typeChat_Id(chat_id)
        var getMessageLinkInfo = await this.typeMessage_id(message_id)
        var data = {
            '_': "reportChat",
            'chat_id': check,
            'message_ids': [getMessageLinkInfo]
        };
        if (new RegExp("^porn$", "i").exec(type)) {
            data["reason"] = {
                '_': "chatReportReasonCustom",
                "text": text
            }
        } else if (new RegExp("^custom$", "i").exec(type)) {
            data["reason"] = {
                '_': "chatReportReasonCustom",
                "text": text
            }
        }
        return await this.handle.invoke(data);
    }
    async getMessageLink(chat_id, message_id, for_album = false, for_comment = false) {
        var data = {
            '_': "getMessageLink",
            'chat_id': chat_id,
            'message_id': message_id,
        };
        if (for_album) {
            data["for_album"] = for_album;
        }

        if (for_comment) {
            data["for_comment"] = for_comment;
        }
        return await this.handle.invoke(data);
    }
    async getMessageLinkInfo(link) {
        return await this.handle.invoke({
            '_': "getMessageLinkInfo",
            'url': link
        });
    }
    async sendChatScreenshotTakenNotification(chat_id) {
        return await this.handle.invoke({
            '_': "sendChatScreenshotTakenNotification",
            'chat_id': chat_id
        });
    }

}

function libForEach(obj, fn) {
    // Don't bother if no value provided
    if (obj === null || typeof obj === 'undefined') {
        return;
    }

    // Force an array if not already something iterable
    if (typeof obj !== 'object') {
        /*eslint no-param-reassign:0*/
        obj = [obj];
    }

    if (typeof obj === "array") {
        // Iterate over array values
        for (var i = 0, l = obj.length; i < l; i++) {
            fn.call(null, obj[i], i, obj);
        }
    } else {
        // Iterate over object keys
        for (var key in obj) {
            if (Object.prototype.hasOwnProperty.call(obj, key)) {
                fn.call(null, obj[key], key, obj);
            }
        }
    }
}

module.exports = {
    telegramApi
}
