// azka dev
const nodefetch = require("node-fetch");
const FormData = require('form-data');
const form = new FormData();
var fs = require("fs");
class Api {
    constructor(token, options) {
        this.token = token;
        this.options = options;
    }
    async request(method, parameter = false, is_form_data = false) {
        if (typeof method != "string" && String(method).length == 0) {
            throw {
                "message": "please use token"
            };
        }
        if (typeof is_form_data != "boolean") {
            throw {
                "message": "parameter form must be boolean"
            };
        }
        var option = {};
        if (is_form_data) {
            option = {
                'method': 'post'
            };
            for (const key in parameter) {
                if (Object.hasOwnProperty.call(parameter, key)) {
                    var element = parameter[key];
                    if (typeof element == "object") {
                        if (element["is_post_file"]) {
                            form.append(key, element["buffer"], element["option"]);
                        } else {
                            form.append(key, JSON.stringify(element));
                        }
                    } else if (typeof element != "string") {
                        form.append(key, String(element));
                    } else {
                        form.append(key, element);
                    }
                }
            }
            if (typeof parameter == "object") {
                option["body"] = form;
            }
        } else {
            option = {
                'method': 'POST',
                'headers': {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                }
            };
            if (typeof parameter == "object") {
                option["body"] = JSON.stringify(parameter);
            }
        }

        var url = this["options"]["api"] + String(this["options"]["type"]).toLocaleLowerCase();
        var response = await nodefetch(url + this["token"] + "/" + method, option);
        if (this["options"]["logger"]) {
            console.log(JSON.stringify(response, null, 2));
        }
        if (response.status == 200) {
            if (String(method).toLocaleLowerCase() == "getfile") {
                var getFile = await response.json();
                var url = this["options"]["api"] + "file/" + String(this["options"]["type"]).toLocaleLowerCase();
                getFile["result"]["links"] = url + this["token"] + "/" + getFile["result"]["file_path"];
                return getFile;
            } else {
                return await response.json();
            }
        } else {
            var msg = await response.json();
            throw {
                message: msg
            };
        }

    }

    async requestForm(method, data) {
        return await this.request(method, data, true);
    }

    file(path, option = false) {
        var json = {
            "is_post_file": true
        };
        if (typeof path != "string") {

        }
        if (RegExp("^(./|\/)", "i").exec(path)) {
            var filename = String(path).replace(/(.*[\/\\])/i, "");
            if (typeof option == "object") {
                json["option"] = {
                    "filename": filename,
                    ...option
                };
            } else {
                json["option"] = {
                    "filename": filename,
                };
            }
            json["buffer"] = fs.readFileSync(path);
            return json;
        } else {
            return path;
        }
    }

    fileUpload(data, option) {
        var json = {
            "is_post_file": true
        };
        if (typeof path != "string") {

        }
        if (typeof data === "object") {
            if (typeof option == "object") {
                json["option"] = {
                    "filename": data["name"],
                    ...option
                };
            } else {
                json["option"] = {
                    "filename":  data["name"],
                };
            }
            json["buffer"] = Buffer.from(data["data"]["data"]);
            return json;
        } else {
            return data;
        }
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
        return await this.request("getChatAdministrators", data);
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

    async getUpdates(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("getUpdates", json);
    }
    async setwebhook(url, parameter = {}) {
        var json = {
            "url": url,
            ...parameter
        };
        return await this.request("setWebhook", json);
    }
    async deleteWebhook(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("deleteWebhook", json);
    }
    async getWebhookInfo() {
        return await this.request("getWebhookInfo");
    }
    async WebhookInfo(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("WebhookInfo", json);
    }
    async getMe() {
        return await this.request("getMe");
    }
    async logOut() {
        return await this.request("logOut");
    }
    async close() {
        return await this.request("close");
    }
    async sendMessage(chat_id, text, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "text": text,
            ...parameter
        };

        return await this.request("sendMessage", json);
    }
    async forwardMessage(chat_id, from_chat_id, message_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "from_chat_id": from_chat_id,
            "message_id": message_id,
            ...parameter
        };

        return await this.request("forwardMessage", json);
    }
    async copyMessage(chat_id, from_chat_id, message_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "from_chat_id": from_chat_id,
            "message_id": message_id,
            ...parameter
        };

        return await this.request("copyMessage", json);
    }

    async sendPhoto(chat_id, photo, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "photo": this.typeFile(photo),
            ...parameter
        };

        return await this.request("sendPhoto", json);
    }
    async sendAudio(chat_id, audio, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "audio": this.typeFile(audio),
            ...parameter
        };
        return await this.request("sendAudio", json);
    }
    async sendDocument(chat_id, document, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "document": this.typeFile(document),
            ...parameter
        };
        return await this.request("sendDocument", json);
    }
    async sendVideo(chat_id, video, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "video": this.typeFile(video),
            ...parameter
        };
        return await this.request("sendVideo", json);
    }
    async sendAnimation(chat_id, animation, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "animation": this.typeFile(animation),
            ...parameter
        };
        return await this.request("sendAnimation", json);
    }
    async sendVoice(chat_id, voice, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "voice": this.typeFile(voice),
            ...parameter
        };

        return await this.request("sendVoice", json);
    }
    async sendVideoNote(chat_id, video_note, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "video_note": this.typeFile(video_note),
            ...parameter
        };

        return await this.request("sendVideoNote", json);
    }
    async sendMediaGroup(chat_id, media, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "media": media,
            ...parameter
        };

        return await this.request("sendMediaGroup", json);
    }
    async sendLocation(chat_id, latitude, longitude, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "latitude": latitude,
            "longitude": longitude,
            ...parameter
        };
        return await this.request("sendLocation", json);
    }
    async editMessageLiveLocation(latitude, longitude, parameter = {}) {
        var json = {
            "latitude": latitude,
            "longitude": longitude,
            ...parameter
        };
        return await this.request("editMessageLiveLocation", json);
    }
    async stopMessageLiveLocation(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("stopMessageLiveLocation", json);
    }
    async sendVenue(chat_id, latitude, longitude, title, adress, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "latitude": latitude,
            "longitude": longitude,
            "title": title,
            "adress": adress,
            ...parameter
        };

        return await this.request("sendVenue", json);
    }
    async sendContact(chat_id, phone_number, first_name, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "phone_number": phone_number,
            "first_name": first_name,
            ...parameter
        };

        return await this.request("sendContact", json);
    }
    async sendPoll(chat_id, question, options, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "question": question,
            "options": options,
            ...parameter
        };

        return await this.request("sendPoll", json);
    }
    async sendDice(chat_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            ...parameter
        };
        return await this.request("sendDice", json);
    }
    async sendChatAction(chat_id, action) {
        var json = {
            "chat_id": chat_id,
            "action": action
        };
        return await this.request("sendChatAction", json);
    }
    async getUserProfilePhotos(user_id, parameter = {}) {
        var json = {
            "user_id": user_id,
            ...parameter
        };
        return await this.request("getUserProfilePhotos", json);
    }
    async getFile(file_id) {
        var json = {
            "file_id": file_id
        };
        var getFile = await this.request("getFile", json);
        var url = this["options"]["api"] + "file/" + String(this["options"]["type"]).toLocaleLowerCase();
        getFile["result"]["links"] = url + this["token"] + "/" + getFile["result"]["file_path"];
        return getFile;
    }
    async banChatMember(chat_id, user_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            ...parameter
        };
        return await this.request("banChatMember", json);
    }
    async unbanChatMember(chat_id, user_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            ...parameter
        };

        return await this.request("unbanChatMember", json);
    }
    async banChatMember(chat_id, user_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            ...parameter
        };

        return await this.request("banChatMember", json);
    }
    async restrictChatMember(chat_id, user_id, permissions, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            "permissions": permissions,
            ...parameter
        };

        return await this.request("restrictChatMember", json);
    }
    async promoteChatMember(chat_id, user_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            ...parameter
        };

        return await this.request("promoteChatMember", json);
    }

    async setChatAdministratorCustomTitle(chat_id, user_id, custom_title) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id,
            "custom_title": custom_title
        };
        return await this.request("setChatAdministratorCustomTitle", json);
    }
    async setChatPermissions(chat_id, permissions) {
        var json = {
            "chat_id": chat_id,
            "permissions": permissions
        };
        return await this.request("setChatPermissions", json);
    }
    async exportChatInviteLink(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("exportChatInviteLink", json);
    }
    async createChatInviteLink(chat_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            ...parameter
        };

        return await this.request("createChatInviteLink", json);
    }
    async editChatInviteLink(chat_id, invite_link, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "invite_link": invite_link,
            ...parameter
        };

        return await this.request("editChatInviteLink", json);
    }
    async revokeChatInviteLink(chat_id, invite_link) {
        var json = {
            "chat_id": chat_id,
            "invite_link": invite_link
        };
        return await this.request("revokeChatInviteLink", json);
    }
    async setChatPhoto(chat_id, photo) {
        var json = {
            "chat_id": chat_id,
            "photo": this.typeFile(photo)
        };
        return await this.request("setChatPhoto", json);
    }
    async deleteChatPhoto(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("deleteChatPhoto", json);
    }
    async setChatTitle(chat_id, title) {
        var json = {
            "chat_id": chat_id,
            "title": title
        };
        return await this.request("setChatTitle", json);
    }
    async setChatDescription(chat_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            ...parameter
        };

        return await this.request("setChatDescription", json);
    }
    async pinChatMessage(chat_id, message_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            "message_id": message_id,
            ...parameter
        };

        return await this.request("pinChatMessage", json);
    }
    async unpinChatMessage(chat_id, message_id) {
        var json = {
            "chat_id": chat_id,
            "message_id": message_id
        };
        return await this.request("unpinChatMessage", json);
    }
    async unpinAllChatMessages(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("unpinAllChatMessages", json);
    }
    async leaveChat(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("leaveChat", json);
    }
    async getChat(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("getChat", json);
    }
    async getChatAdministrators(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("getChatAdministrators", json);
    }
    async getChatMemberCount(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("getChatMemberCount", json);
    }
    async getChatMember(chat_id, user_id) {
        var json = {
            "chat_id": chat_id,
            "user_id": user_id
        };
        return await this.request("getChatMember", json);
    }
    async setChatStickerSet(chat_id, sticker_set_name) {
        var json = {
            "chat_id": chat_id,
            "sticker_set_name": sticker_set_name
        };
        return await this.request("setChatStickerSet", json);
    }
    async deleteChatStickerSet(chat_id) {
        var json = {
            "chat_id": chat_id
        };
        return await this.request("deleteChatStickerSet", json);
    }
    async answerCallbackQuery(callback_query_id, parameter = {}) {
        var json = {
            "callback_query_id": callback_query_id,
            ...parameter
        };
        return await this.request("answerCallbackQuery", json);
    }
    async setMyCommands(commands, parameter = {}) {
        var json = {
            "commands": commands,
            ...parameter
        };

        return await this.request("setMyCommands", json);
    }
    async deleteMyCommands(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("deleteMyCommands", json);
    }
    async getMyCommands(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("getMyCommands", json);
    }
    async editMessageText(text, parameter = {}) {
        var json = {
            "text": text,
            ...parameter
        };
        return await this.request("editMessageText", json);
    }
    async editMessageCaption(parameter = {}) {
        var json = {
            ...parameter
        };
        return await this.request("editMessageCaption", json);
    }
    async editMessageMedia(media, parameter = {}) {
        var json = {
            "media": media,
            ...parameter
        };
        return await this.request("editMessageMedia", json);
    }
    async stopPoll(chat_id, parameter = {}) {
        var json = {
            "chat_id": chat_id,
            ...parameter
        };
        return await this.request("stopPoll", json);
    }
    async deleteMessage(chat_id, message_id) {
        var json = {
            "chat_id": chat_id,
            "message_id": message_id
        };
        return await this.request("deleteMessage", json);
    }
}

module.exports = {
    Api
};