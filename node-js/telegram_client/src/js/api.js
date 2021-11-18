// azka dev
const nodefetch = require("node-fetch");
class Api {
    constructor(token, options) {
        this.token = token;
        this.options = options;
    }
    async request(method, data = false) {
        if (!method) {
            throw {
                message: "please use token"
            };
        }
        var option = {
            'method': 'POST',
            'headers': {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        };
        if (data) {
            option.body = JSON.stringify(data);
        }
        var url = this.options.api + String(this.options.type).toLocaleLowerCase();
        var response = await nodefetch(url + this.token + "/" + method, option);
        if (this.options.logger) {
            console.log(JSON.stringify(response, null, 2));
        }
        if (response.status == 200) {
            return await response.json();
        } else {
            var msg = await response.json();
            throw {
                message: msg
            };
        }

    }

    async invoke(json, object) {
        if (object) {
            for (var key in object) {
                if (Object.hasOwnProperty.call(object, key)) {
                    var loop_data = object[key];
                    json[key] = loop_data;
                }
            }
            return json;
        } else {
            return json;
        }
    }

    invokeSync(json, object) {
        if (object) {
            for (var key in object) {
                if (Object.hasOwnProperty.call(object, key)) {
                    var loop_data = object[key];
                    json[key] = loop_data;
                }
            }
            return json;
        } else {
            return json;
        }
    }

    requestForm(method, data) {
        return this.request(method, data);
    }

    typeFile(data) {
        if (RegExp(`[\/\.]`, "i").exec(data)) {
            var file = `file://${process.cwd()}/${data}`;
        } else {
            var file = data;
        }
        return file;
    }

    async listadmin(msg_chat_id) {
        var data = {
            "chat_id": msg_chat_id
        };
        return this.request("getChatAdministrators", data);
    }
    async checkadmin(chat_id, check_user) {
        var parameter = {
            "chat_id": chat_id
        };
        var admins = await this.request("getChatAdministrators", parameter);
        var ok = admins.result;
        var data = [];
        try {
            for (var row = 0; row < ok.length; row++) {
                data.push(ok[row].user.id);
            }
            if (data.indexOf(check_user) > -1) {
                return true;
            } else {
                return false;
            }
        } catch (e) {
            return false;
        }
    }

    listadminSync(msg_chat_id) {
        var data = {
            "chat_id": msg_chat_id
        };
        return this.requestSync("getChatAdministrators", data)
    }

    checkadminSync(chat_id, check_user) {
        var parameter = {
            "chat_id": chat_id
        };
        var admins = this.requestSync("getChatAdministrators", parameter)
        var ok = admins.result;
        var data = [];
        try {
            for (var row = 0; row < ok.length; row++) {
                data.push(ok[row].user.id);
            }
            if (data.indexOf(check_user) > -1) {
                return true;
            } else {
                return false;
            }
        } catch (e) {
            return false;
        }
    }
    async getUpdates(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("getUpdates", param);
    }
    async setwebhook(url, parameter = false) {
        var json = {
            "url": url
        };
        var param = await this.invoke(json, parameter);
        return this.request("setWebhook", param);
    }
    async deleteWebhook(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("deleteWebhook", param);
    }
    async getWebhookInfo() {
        return this.request("getWebhookInfo");
    }
    async WebhookInfo(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("WebhookInfo", param);
    }
    async getMe() {
        return this.request("getMe");
    }
    async logOut() {
        return this.request("logOut");
    }
    async close() {
        return this.request("close");
    }
    async sendMessage(chat_id, text, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "text": text
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendMessage", param);
    }
    async forwardMessage(chat_id, from_chat_id, message_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "from_chat_id": from_chat_id,
            "message_id": message_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("forwardMessage", param);
    }
    async copyMessage(chat_id, from_chat_id, message_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "from_chat_id": from_chat_id,
            "message_id": message_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("copyMessage", param);
    }

    async sendPhoto(chat_id, photo, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "photo": this.typeFile(photo)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendPhoto", param);
    }
    async sendAudio(chat_id, audio, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "audio": this.typeFile(audio)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendAudio", param);
    }
    async sendDocument(chat_id, document, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "document": this.typeFile(document)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendDocument", param);
    }
    async sendVideo(chat_id, video, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "video": this.typeFile(video)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendVideo", param);
    }
    async sendAnimation(chat_id, animation, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "animation": this.typeFile(animation)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendAnimation", param);
    }
    async sendVoice(chat_id, voice, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "voice": this.typeFile(voice)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendVoice", param);
    }
    async sendVideoNote(chat_id, video_note, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "video_note": this.typeFile(video_note)
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendVideoNote", param);
    }
    async sendMediaGroup(chat_id, media, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "media": media
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendMediaGroup", param);
    }
    async sendLocation(chat_id, latitude, longitude, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "latitude": latitude,
            "longitude": longitude
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendLocation", param);
    }
    async editMessageLiveLocation(latitude, longitude, parameter = false) {
        var json = {
            "latitude": latitude,
            "longitude": longitude
        };
        var param = await this.invoke(json, parameter);
        return this.request("editMessageLiveLocation", param);
    }
    async stopMessageLiveLocation(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("stopMessageLiveLocation", param);
    }
    async sendVenue(chat_id, latitude, longitude, title, adress, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "latitude": latitude,
            "longitude": longitude,
            "title": title,
            "adress": adress
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendVenue", param);
    }
    async sendContact(chat_id, phone_number, first_name, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "phone_number": phone_number,
            "first_name": first_name
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendContact", param);
    }
    async sendPoll(chat_id, question, options, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "question": question,
            "options": options
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendPoll", param);
    }
    async sendDice(chat_id, parameter = false) {
        var json = {
            "chat_id": chat_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("sendDice", param);
    }
    async sendChatAction(chat_id, action) {
        var json = {
            "chat_id": chat_id,
            "action": action
        };
        return this.request("sendChatAction", json);
    }
    async getUserProfilePhotos(user_id, parameter = false) {
        var json = {
            "user_id": user_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("getUserProfilePhotos", param);
    }
    async getFile(file_id) {
        var json = {
            "file_id": file_id
        };
        return this.request("getFile", json);
    }
    async banChatMember(chat_id, user_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("banChatMember", param);
    }
    async unbanChatMember(chat_id, user_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("unbanChatMember", param);
    }
    async banChatMember(chat_id, user_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("banChatMember", param);
    }
    async restrictChatMember(chat_id, user_id, permissions, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            "permissions": permissions
        };
        var param = await this.invoke(json, parameter);
        return this.request("restrictChatMember", param);
    }
    async promoteChatMember(chat_id, user_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("promoteChatMember", param);
    }

    async setChatAdministratorCustomTitle(chat_id, user_id, custom_title) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            "custom_title": custom_title
        };
        return this.request("setChatAdministratorCustomTitle", json);
    }
    async setChatPermissions(chat_id, permissions) {
        var json = {
            "chat_id": chat_id,
            "permissions": permissions
        };
        return this.request("setChatPermissions", json);
    }
    async exportChatInviteLink(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("exportChatInviteLink", json);
    }
    async createChatInviteLink(chat_id, parameter = false) {
        var json = {
            "chat_id": chat_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("createChatInviteLink", param);
    }
    async editChatInviteLink(chat_id, invite_link, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "invite_link": invite_link
        };
        var param = await this.invoke(json, parameter);
        return this.request("editChatInviteLink", param);
    }
    async revokeChatInviteLink(chat_id, invite_link) {
        var json = {
            "chat_id": chat_id,
            "invite_link": invite_link
        };
        return this.request("revokeChatInviteLink", json);
    }
    async setChatPhoto(chat_id, photo) {
        var json = {
            "chat_id": chat_id,
            "photo": this.typeFile(photo)
        };
        return this.request("setChatPhoto", json);
    }
    async deleteChatPhoto(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("deleteChatPhoto", json);
    }
    async setChatTitle(chat_id, title) {
        var json = {
            "chat_id": chat_id,
            "title": title
        };
        return this.request("setChatTitle", json);
    }
    async setChatDescription(chat_id, parameter = false) {
        var json = {
            "chat_id": chat_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("setChatDescription", param);
    }
    async pinChatMessage(chat_id, message_id, parameter = false) {
        var json = {
            "chat_id": chat_id,
            "message_id": message_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("pinChatMessage", param);
    }
    async unpinChatMessage(chat_id, message_id) {
        var json = {
            "chat_id": chat_id,
            "message_id": message_id
        };
        return this.request("unpinChatMessage", json);
    }
    async unpinAllChatMessages(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("unpinAllChatMessages", json);
    }
    async leaveChat(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("leaveChat", json);
    }
    async getChat(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("getChat", json);
    }
    async getChatAdministrators(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("getChatAdministrators", json);
    }
    async getChatMemberCount(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("getChatMemberCount", json);
    }
    async getChatMember(chat_id, user_id) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id
        };
        return this.request("getChatMember", json);
    }
    async setChatStickerSet(chat_id, sticker_set_name) {
        var json = {
            "chat_id": chat_id,
            "sticker_set_name": sticker_set_name
        };
        return this.request("setChatStickerSet", json);
    }
    async deleteChatStickerSet(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return this.request("deleteChatStickerSet", json);
    }
    async answerCallbackQuery(callback_query_id, parameter = false) {
        var json = {
            "callback_query_id": callback_query_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("answerCallbackQuery", param);
    }
    async setMyCommands(commands, parameter = false) {
        var json = {
            "commands": commands
        };
        var param = await this.invoke(json, parameter);
        return this.request("setMyCommands", param);
    }
    async deleteMyCommands(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("deleteMyCommands", param);
    }
    async getMyCommands(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("getMyCommands", param);
    }
    async editMessageText(text, parameter = false) {
        var json = {
            "text": text
        };
        var param = await this.invoke(json, parameter);
        return this.request("editMessageText", param);
    }
    async editMessageCaption(parameter = false) {
        var json = {};
        var param = await this.invoke(json, parameter);
        return this.request("editMessageCaption", param);
    }
    async editMessageMedia(media, parameter = false) {
        var json = {
            "media": media
        };
        var param = await this.invoke(json, parameter);
        return this.request("editMessageMedia", param);
    }
    async stopPoll(chat_id, parameter = false) {
        var json = {
            "chat_id": chat_id
        };
        var param = await this.invoke(json, parameter);
        return this.request("stopPoll", param);
    }
    async deleteMessage(chat_id, message_id) {
        var json = {
            "chat_id": chat_id,
            "message_id": message_id
        };
        return this.request("deleteMessage", json);
    }
}

module.exports = {
    Api
};