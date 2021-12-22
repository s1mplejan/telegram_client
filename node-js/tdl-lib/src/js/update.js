function string(update) {
    var data = JSON.stringify(update, null, 2)
    return data
}

class updateApi {

    constructor(tg) {
        this.tg = tg;
    }

    async update(update) {
        try {
            //--! update message !--\\
            if (new RegExp(`^updateNewMessage$`, "i").exec(update._)) {
                if (update.message.is_channel_post) {
                    var json = {}
                    if (update.message.is_outgoing ? true : true) {
                        json.outgoing = update.message.is_outgoing ? true : false;
                    }
                    if (update.message.id) {
                        json.message_id = Number(update.message.id);
                    }
                    if (update.message.sender) {
                        var fromJson = {}
                        var senderUserId = update.message.sender.user_id ? update.message.sender.user_id : false
                        var senderChatId = update.message.sender.chat_id ? update.message.sender.chat_id : false
                        if (senderUserId) {
                            var getUser = await this.tg.request("getUser", { chat_id: senderUserId });
                            if (getUser.ok) {
                                fromJson = getUser.result;
                            } else {
                                throw new Error(getUser);
                            }
                        }
                        if (senderChatId) {
                            fromJson.id = Number(senderChatId);
                        }
                        json.from = fromJson;
                    }
                    if (update.message.chat_id) {
                        var chatJson = {};
                        var chatId = update.message.chat_id;
                        var getChat = await this.tg.request("getChat", { chat_id: chatId });
                        if (getChat.ok) {
                            var chatJson = getChat.result;
                        } else {
                            throw new Error(getChat.result);
                        }
                        json.chat = chatJson;
                    }
                    if (update.message.date) {
                        json.date = Number(update.message.date);
                    }

                    if (update.message.reply_to_message_id && update.message.reply_in_chat_id) {
                        var getMessage = await this.tg.getMessage(update.message.reply_in_chat_id, update.message.reply_to_message_id);
                        var replyTo = await this.replyMessage({ message: getMessage });
                        json.reply_to_message = replyTo.message
                    }
                    if (update.message.content) {
                        if (new RegExp("^messageText$", "i").exec(update.message.content._) && update.message.content.text && new RegExp("^formattedText$", "i").exec(update.message.content.text._)) {
                            json.text = update.message.content.text.text;
                        }
                        //--! detect photo message !--\\
                        if (new RegExp("^messagePhoto$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                            if (new RegExp("^photo$", "i").exec(update.message.content.photo._)) {
                                var size_photo = []
                                var photo = update.message.content.photo.sizes
                                for (var i = 0; i < photo.length; i++) {
                                    var photo_json = photo[i]
                                    var json_photo = {}
                                    if (new RegExp("^remoteFile$", "i").exec(photo_json.photo.remote._)) {
                                        json_photo.file_id = photo_json.photo.remote.id
                                    }
                                    if (photo_json.photo.remote.unique_id) {
                                        json_photo.file_unique_id = photo_json.photo.remote.unique_id
                                    }
                                    json_photo.file_size = photo_json.photo.size
                                    json_photo.width = photo_json.width
                                    json_photo.height = photo_json.height

                                    size_photo.push(json_photo)
                                }
                                json.photo = size_photo
                            }
                        }
                        //--! detect video message !--\\
                        if (new RegExp("^messageVideo$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                            if (new RegExp("^video$", "i").exec(update.message.content.video._)) {
                                var json_video = {}
                                var content_video = update.message.content.video
                                json_video.duration = content_video.duration
                                json_video.height = content_video.height
                                json_video.file_name = content_video.file_name
                                json_video.mime_type = content_video.mime_type
                                if (new RegExp("^thumbnail$", "i").exec(update.message.content.video.thumbnail._)) {
                                    var content_thumb = content_video.thumbnail
                                    var json_thumb = {}
                                    json_video.thumb = json_thumb
                                    json_thumb.file_id = content_thumb.file.remote.id
                                    json_thumb.file_unique_id = content_thumb.file.remote.unique_id
                                    json_thumb.file_size = content_thumb.file.size
                                    json_thumb.width = content_thumb.width
                                    json_thumb.height = content_thumb.height
                                }
                                json_video.file_id = content_video.video.remote.id
                                json_video.file_size = content_video.video.size
                                json.video = json_video
                            }
                        }
                        if (update.message.content.caption && update.message.content.caption.text) {
                            json.caption = update.message.content.caption.text;
                        }
                    }
                    return { channel_post: json };
                } else {
                    var json = {}
                    if (update.message.is_outgoing ? true : true) {
                        json.outgoing = update.message.is_outgoing ? true : false;
                    }
                    if (update.message.id) {
                        json.message_id = Number(update.message.id);
                    }
                    if (update.message.sender) {
                        var fromJson = {}
                        var senderUserId = update.message.sender.user_id ? update.message.sender.user_id : false
                        var senderChatId = update.message.sender.chat_id ? update.message.sender.chat_id : false
                        if (senderUserId) {
                            var getUser = await this.tg.request("getUser", { chat_id: senderUserId });
                            if (getUser.ok) {
                                fromJson = getUser.result;
                            } else {
                                throw new Error(getUser);
                            }
                        }
                        if (senderChatId) {
                            fromJson.id = Number(senderChatId);
                        }
                        json.from = fromJson;
                    }
                    if (update.message.chat_id) {
                        var chatJson = {};
                        var chatId = update.message.chat_id;
                        var getChat = await this.tg.request("getChat", { chat_id: chatId });
                        if (getChat.ok) {
                            var chatJson = getChat.result;
                        } else {
                            throw new Error(getChat.result);
                        }
                        json.chat = chatJson;
                    }
                    if (update.message.date) {
                        json.date = Number(update.message.date);
                    }
                    if (update.message.reply_to_message_id && update.message.reply_in_chat_id) {
                        try {
                            var getMessage = await this.tg.getMessage(update.message.reply_in_chat_id, update.message.reply_to_message_id);
                            var replyTo = await this.replyMessage({ message: getMessage });
                            if (replyTo) {
                                if (replyTo.message) {
                                    json.reply_to_message = replyTo.message
                                }
                            }
                        } catch (e) {
                        }
                    }
                    if (update.message.content) {
                        if (update.message.content.text && new RegExp("^messageText$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.text._)) {
                            json.text = update.message.content.text.text;
                        }
                        //--! detect photo message !--\\
                        if (new RegExp("^messagePhoto$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                            if (update.message.content.photo && new RegExp("^photo$", "i").exec(update.message.content.photo._)) {
                                var size_photo = []
                                var photo = update.message.content.photo.sizes
                                for (var i = 0; i < photo.length; i++) {
                                    var photo_json = photo[i]
                                    var json_photo = {}
                                    if (new RegExp("^remoteFile$", "i").exec(photo_json.photo.remote._)) {
                                        json_photo.file_id = photo_json.photo.remote.id
                                    }
                                    if (photo_json.photo.remote.unique_id) {
                                        json_photo.file_unique_id = photo_json.photo.remote.unique_id
                                    }
                                    json_photo.file_size = photo_json.photo.size
                                    json_photo.width = photo_json.width
                                    json_photo.height = photo_json.height

                                    size_photo.push(json_photo)
                                }
                                json.photo = size_photo
                            }
                        }
                        //--! detect video message !--\\
                        if (new RegExp("^messageVideo$", "i").exec(update.message.content._) && update.message.content.caption && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                            if (update.message.content.video && new RegExp("^video$", "i").exec(update.message.content.video._)) {
                                var json_video = {}
                                var content_video = update.message.content.video
                                json_video.duration = content_video.duration
                                json_video.height = content_video.height
                                json_video.file_name = content_video.file_name
                                json_video.mime_type = content_video.mime_type
                                try {
                                    if (update.message.content.video.thumbnail && new RegExp("^thumbnail$", "i").exec(update.message.content.video.thumbnail._)) {
                                        var content_thumb = content_video.thumbnail
                                        var json_thumb = {}
                                        json_video.thumb = json_thumb
                                        json_thumb.file_id = content_thumb.file.remote.id
                                        json_thumb.file_unique_id = content_thumb.file.remote.unique_id
                                        json_thumb.file_size = content_thumb.file.size
                                        json_thumb.width = content_thumb.width
                                        json_thumb.height = content_thumb.height
                                    }
                                } catch (e) {
                                }
                                json_video.file_id = content_video.video.remote.id
                                json_video.file_size = content_video.video.size
                                json.video = json_video
                            }
                        }
                        if (update.message.content.caption && update.message.content.caption.text) {
                            json.caption = update.message.content.caption.text;
                        }

                        if (update.message.content.text && update.message.content.text.text && update.message.content.text.entities.length > 0) {
                            var array_entities = []
                            for (var i = 0; i < update.message.content.text.entities.length; i++) {
                                var data_entities = update.message.content.text.entities[i]
                                var json_entities = {}
                                json_entities.offset = data_entities.offset
                                json_entities.length = data_entities.length
                                array_entities.push(json_entities)
                                if (data_entities.type._) {
                                    var type_entities = data_entities.type._.toLocaleLowerCase().replace(/(textEntityType)/ig, "").replace(/(textUrl)/ig, "text_link").replace(/(botcommand)/ig, "bot_command").replace(/(mentionname)/ig, "text_mention")
                                    json_entities.type = type_entities
                                    if (data_entities.type.url) {
                                        json_entities.url = data_entities.type.url
                                    }
                                    if (new RegExp("^text_mention$", "i").exec(type_entities) && data_entities.type.user_id) {
                                        var entitiesUserId = data_entities.type.user_id ? data_entities.type.user_id : false
                                        var fromJson = {}
                                        if (entitiesUserId) {
                                            var getUser = await this.tg.request("getUser", { chat_id: entitiesUserId });
                                            if (getUser.ok) {
                                                fromJson = getUser.result;
                                            } else {
                                                throw new Error(getUser);
                                            }
                                        }
                                        json_entities.user = fromJson
                                    }
                                }
                            }
                            json.entities = array_entities
                        }

                        if (update.message.content.caption && update.message.content.caption.text && update.message.content.caption.entities.length > 0) {
                            var array_entities = []
                            for (var i = 0; i < update.message.content.caption.entities.length; i++) {
                                var data_entities = update.message.content.caption.entities[i]
                                var json_entities = {}
                                json_entities.offset = data_entities.offset
                                json_entities.length = data_entities.length
                                array_entities.push(json_entities)
                                if (data_entities.type._) {
                                    var type_entities = data_entities.type._.toLocaleLowerCase().replace(/(textEntityType)/ig, "").replace(/(textUrl)/ig, "text_link").replace(/(botcommand)/ig, "bot_command").replace(/(mentionname)/ig, "text_mention")
                                    json_entities.type = type_entities
                                    if (data_entities.type.url) {
                                        json_entities.url = data_entities.type.url
                                    }
                                    if (new RegExp("^text_mention$", "i").exec(type_entities) && data_entities.type.user_id) {
                                        var entitiesUserId = data_entities.type.user_id ? data_entities.type.user_id : false
                                        var fromJson = {}
                                        if (entitiesUserId) {
                                            var getUser = await this.tg.request("getUser", { chat_id: entitiesUserId });
                                            if (getUser.ok) {
                                                fromJson = getUser.result;
                                            } else {
                                                throw new Error(getUser);
                                            }
                                        }
                                        json_entities.user = fromJson
                                    }
                                }
                            }
                            json.entities = array_entities
                        }
                    }
                    return { message: json }
                }
                //--! callback_query !--\\
            } else if (new RegExp(`^updateNewCallbackQuery$`, "i").exec(update._)) {
                var json_data = { "callback_query": {} };
                var json = json_data.callback_query
                if (update.id) {
                    json.id = update.id
                }
                var senderUserId = update.sender_user_id ? update.sender_user_id : false
                var fromJson = {}
                if (senderUserId) {
                    var getUser = await this.tg.request("getUser", { chat_id: senderUserId });
                    if (getUser.ok) {
                        fromJson = getUser.result;
                    } else {
                        throw new Error(getUser);
                    }
                    json.from = fromJson
                }

                if (update.chat_id) {
                    if (update.message_id) {
                        var getMessage = await this.tg.getMessage(update.chat_id, update.message_id);
                        var replyTo = await this.replyMessage({ message: getMessage });
                        json.message = replyTo.message;
                    }
                    var chatJson = {};
                    var chatId = update.chat_id;
                    var getChat = await this.tg.request("getChat", { chat_id: chatId });
                    if (getChat.ok) {
                        var chatJson = getChat.result;
                    } else {
                        throw new Error(getChat.result);
                    }
                    json.chat = chatJson;
                    json.chat_instance = update.chat_instance;
                    json.data = Buffer.from(update.payload.data, 'base64').toString('utf8');
                }
                return json_data;
            } else if (new RegExp(`^updateChatMember$`, "i").exec(update._)) {
                var json_data = { "chat_member": {} }
                var json = json_data.chat_member;
                if (update.chat_id) {
                    var chatJson = {};
                    var chatId = update.chat_id;
                    var getChat = await this.tg.request("getChat", { chat_id: chatId });
                    if (getChat.ok) {
                        var chatJson = getChat.result;
                    } else {
                        throw new Error(getChat.result);
                    }
                    json.chat = chatJson;
                }
                if (update.actor_user_id) {
                    var fromJson = {};
                    var getUser = await this.tg.request("getUser", { chat_id: update.actor_user_id });
                    if (getUser.ok) {
                        fromJson = getUser.result;
                    } else {
                        throw new Error(getUser);
                    }

                    json.user = fromJson;
                }

                if (update.date) {
                    json.date = update.date
                }

                if (update.old_chat_member && update.old_chat_member.member_id && update.old_chat_member.member_id.user_id && update.old_chat_member._) {
                    var oldChatMemberUserId = update.old_chat_member.member_id.user_id;
                    var data_json = { "user": {} };
                    var fromJson = {};
                    if (oldChatMemberUserId) {
                        var getUser = await this.tg.request("getUser", { chat_id: oldChatMemberUserId });
                        if (getUser.ok) {
                            fromJson = getUser.result;
                        } else {
                            throw new Error(getUser);
                        }
                    }
                    data_json.join_date = update.old_chat_member.joined_chat_date;
                    data_json.status = update.old_chat_member.status._.replace(/(chatMemberStatus)/ig, "").toLocaleLowerCase();
                    data_json.user = fromJson;
                    json.old_chat_member = data_json
                }

                if (update.new_chat_member && update.new_chat_member.member_id && update.new_chat_member.member_id.user_id && update.new_chat_member._) {
                    var newChatMemberUserId = update.new_chat_member.member_id.user_id;
                    var data_json = { "user": {} };
                    var fromJson = {};
                    if (newChatMemberUserId) {
                        var getUser = await this.tg.request("getUser", { chat_id: newChatMemberUserId });
                        if (getUser.ok) {
                            fromJson = getUser.result;
                        } else {
                            throw new Error(getUser);
                        }
                    }
                    data_json.join_date = update.new_chat_member.joined_chat_date;
                    data_json.status = update.new_chat_member.status._.replace(/(chatMemberStatus)/ig, "").toLocaleLowerCase();
                    data_json.user = fromJson;
                    json.new_chat_member = data_json
                }
                try {
                    if (update.invite_link && update.invite_link._) {
                        var data_json = { "user": {} };
                        var inviteLinkUserId = update.invite_link.creator_user_id ? update.invite_link.creator_user_id : false
                        if (inviteLinkUserId) {
                            var getUser = await this.tg.request("getUser", { chat_id: inviteLinkUserId });
                            if (getUser.ok) {
                                data_json.user = getUser.result;
                            } else {
                                throw new Error(getUser);
                            }
                        }
                        data_json.invite_link = update.invite_link.invite_link
                        data_json.is_primary = update.invite_link.is_primary
                        data_json.is_revoked = update.invite_link.is_revoked
                        data_json.expire_date = update.invite_link.expire_date
                        data_json.member_limit = update.invite_link.member_limit
                        json.invite_link = data_json
                    }
                } catch (e) {

                }
                return json_data
            } else if (RegExp("^updateMessageSendSucceeded$", "i").exec(update._)) {
                return { message_send: update };
            } else if (RegExp("^updateMessageSendFailed$", "i").exec(update._)) {
                return { message_failed: update };
            } else {
                return update;
            }
        } catch (e) {
            console.log(JSON.stringify(update, null, 2));
            console.log(e);
            return false;
        }
    }

    async replyMessage(update) {
        if (update.message.is_channel_post) {
            var json = {}
            if (update.message.is_outgoing ? true : true) {
                json.outgoing = update.message.is_outgoing ? true : false;
            }
            if (update.message.id) {
                json.message_id = Number(update.message.id);
            }
            if (update.message.sender) {
                var fromJson = {}
                var senderUserId = update.message.sender.user_id ? update.message.sender.user_id : false
                var senderChatId = update.message.sender.chat_id ? update.message.sender.chat_id : false
                if (senderUserId) {
                    var getUser = await this.tg.request("getUser", { chat_id: senderUserId });
                    if (getUser.ok) {
                        fromJson = getUser.result;
                    } else {
                        throw new Error(getUser);
                    }
                }
                if (senderChatId) {
                    fromJson.id = Number(senderChatId);
                }
                json.from = fromJson;
            }
            if (update.message.chat_id) {
                var chatJson = {};
                var chatId = update.message.chat_id;
                var getChat = await this.tg.request("getChat", { chat_id: chatId });
                if (getChat.ok) {
                    var chatJson = getChat.result;
                } else {
                    throw new Error(getChat.result);
                }
                json.chat = chatJson;
            }
            if (update.message.date) {
                json.date = Number(update.message.date);
            }

            if (update.message.reply_to_message_id && update.message.reply_in_chat_id) {
                var getMessage = await this.tg.getMessage(update.message.reply_in_chat_id, update.message.reply_to_message_id);
                var replyTo = await this.replyMessage({ message: getMessage });
                json.reply_to_message = replyTo.message
            }
            if (update.message.content) {
                if (new RegExp("^messageText$", "i").exec(update.message.content._) && update.message.content.text && new RegExp("^formattedText$", "i").exec(update.message.content.text._)) {
                    json.text = update.message.content.text.text;
                }
                //--! detect photo message !--\\
                if (new RegExp("^messagePhoto$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                    if (new RegExp("^photo$", "i").exec(update.message.content.photo._)) {
                        var size_photo = []
                        var photo = update.message.content.photo.sizes
                        for (var i = 0; i < photo.length; i++) {
                            var photo_json = photo[i]
                            var json_photo = {}
                            if (new RegExp("^remoteFile$", "i").exec(photo_json.photo.remote._)) {
                                json_photo.file_id = photo_json.photo.remote.id
                            }
                            if (photo_json.photo.remote.unique_id) {
                                json_photo.file_unique_id = photo_json.photo.remote.unique_id
                            }
                            json_photo.file_size = photo_json.photo.size
                            json_photo.width = photo_json.width
                            json_photo.height = photo_json.height

                            size_photo.push(json_photo)
                        }
                        json.photo = size_photo
                    }
                }
                //--! detect video message !--\\
                if (new RegExp("^messageVideo$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                    if (new RegExp("^video$", "i").exec(update.message.content.video._)) {
                        var json_video = {}
                        var content_video = update.message.content.video
                        json_video.duration = content_video.duration
                        json_video.height = content_video.height
                        json_video.file_name = content_video.file_name
                        json_video.mime_type = content_video.mime_type
                        if (new RegExp("^thumbnail$", "i").exec(update.message.content.video.thumbnail._)) {
                            var content_thumb = content_video.thumbnail
                            var json_thumb = {}
                            json_video.thumb = json_thumb
                            json_thumb.file_id = content_thumb.file.remote.id
                            json_thumb.file_unique_id = content_thumb.file.remote.unique_id
                            json_thumb.file_size = content_thumb.file.size
                            json_thumb.width = content_thumb.width
                            json_thumb.height = content_thumb.height
                        }
                        json_video.file_id = content_video.video.remote.id
                        json_video.file_size = content_video.video.size
                        json.video = json_video
                    }
                }
                if (update.message.content.caption && update.message.content.caption.text) {
                    json.caption = update.message.content.caption.text;
                }
            }
            return { channel_post: json }
        } else {
            var json = {}
            if (update.message.is_outgoing ? true : true) {
                json.outgoing = update.message.is_outgoing ? true : false;
            }
            if (update.message.id) {
                json.message_id = Number(update.message.id);
            }
            if (update.message.sender) {
                var fromJson = {}
                var senderUserId = update.message.sender.user_id ? update.message.sender.user_id : false
                var senderChatId = update.message.sender.chat_id ? update.message.sender.chat_id : false
                if (senderUserId) {
                    var getUser = await this.tg.request("getUser", { chat_id: senderUserId });
                    if (getUser.ok) {
                        fromJson = getUser.result;
                    } else {
                        throw new Error(getUser);
                    }
                }
                if (senderChatId) {
                    fromJson.id = Number(senderChatId);
                }
                json.from = fromJson;
            }
            if (update.message.chat_id) {
                var chatJson = {};
                var chatId = update.message.chat_id;
                var getChat = await this.tg.request("getChat", { chat_id: chatId });
                if (getChat.ok) {
                    var chatJson = getChat.result;
                } else {
                    throw new Error(getChat.result);
                }
                json.chat = chatJson;
            }
            if (update.message.date) {
                json.date = Number(update.message.date);
            }
            if (update.message.reply_to_message_id && update.message.reply_in_chat_id) {
                try {
                    var getMessage = await this.tg.getMessage(update.message.reply_in_chat_id, update.message.reply_to_message_id);
                    var replyTo = await this.replyMessage({ message: getMessage });
                    if (replyTo) {
                        if (replyTo.message) {
                            json.reply_to_message = replyTo.message
                        }
                    }
                } catch (e) {
                }
            }
            if (update.message.content) {
                if (update.message.content.text && new RegExp("^messageText$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.text._)) {
                    json.text = update.message.content.text.text;
                }
                //--! detect photo message !--\\
                if (new RegExp("^messagePhoto$", "i").exec(update.message.content._) && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                    if (update.message.content.photo && new RegExp("^photo$", "i").exec(update.message.content.photo._)) {
                        var size_photo = []
                        var photo = update.message.content.photo.sizes
                        for (var i = 0; i < photo.length; i++) {
                            var photo_json = photo[i]
                            var json_photo = {}
                            if (new RegExp("^remoteFile$", "i").exec(photo_json.photo.remote._)) {
                                json_photo.file_id = photo_json.photo.remote.id
                            }
                            if (photo_json.photo.remote.unique_id) {
                                json_photo.file_unique_id = photo_json.photo.remote.unique_id
                            }
                            json_photo.file_size = photo_json.photo.size
                            json_photo.width = photo_json.width
                            json_photo.height = photo_json.height

                            size_photo.push(json_photo)
                        }
                        json.photo = size_photo
                    }
                }
                //--! detect video message !--\\
                if (new RegExp("^messageVideo$", "i").exec(update.message.content._) && update.message.content.caption && new RegExp("^formattedText$", "i").exec(update.message.content.caption._)) {
                    if (update.message.content.video && new RegExp("^video$", "i").exec(update.message.content.video._)) {
                        var json_video = {}
                        var content_video = update.message.content.video
                        json_video.duration = content_video.duration
                        json_video.height = content_video.height
                        json_video.file_name = content_video.file_name
                        json_video.mime_type = content_video.mime_type
                        try {
                            if (update.message.content.video.thumbnail && new RegExp("^thumbnail$", "i").exec(update.message.content.video.thumbnail._)) {
                                var content_thumb = content_video.thumbnail
                                var json_thumb = {}
                                json_video.thumb = json_thumb
                                json_thumb.file_id = content_thumb.file.remote.id
                                json_thumb.file_unique_id = content_thumb.file.remote.unique_id
                                json_thumb.file_size = content_thumb.file.size
                                json_thumb.width = content_thumb.width
                                json_thumb.height = content_thumb.height
                            }
                        } catch (e) {
                        }
                        json_video.file_id = content_video.video.remote.id
                        json_video.file_size = content_video.video.size
                        json.video = json_video
                    }
                }
                if (update.message.content.caption && update.message.content.caption.text) {
                    json.caption = update.message.content.caption.text;
                }

                if (update.message.content.text && update.message.content.text.text && update.message.content.text.entities.length > 0) {
                    var array_entities = []
                    for (var i = 0; i < update.message.content.text.entities.length; i++) {
                        var data_entities = update.message.content.text.entities[i]
                        var json_entities = {}
                        json_entities.offset = data_entities.offset
                        json_entities.length = data_entities.length
                        array_entities.push(json_entities)
                        if (data_entities.type._) {
                            var type_entities = data_entities.type._.toLocaleLowerCase().replace(/(textEntityType)/ig, "").replace(/(textUrl)/ig, "text_link").replace(/(botcommand)/ig, "bot_command").replace(/(mentionname)/ig, "text_mention")
                            json_entities.type = type_entities
                            if (data_entities.type.url) {
                                json_entities.url = data_entities.type.url
                            }
                            if (new RegExp("^text_mention$", "i").exec(type_entities) && data_entities.type.user_id) {
                                var entitiesUserId = data_entities.type.user_id ? data_entities.type.user_id : false
                                var fromJson = {}
                                if (entitiesUserId) {
                                    var getUser = await this.tg.request("getUser", { chat_id: entitiesUserId });
                                    if (getUser.ok) {
                                        fromJson = getUser.result;
                                    } else {
                                        throw new Error(getUser);
                                    }
                                }
                                json_entities.user = fromJson
                            }
                        }
                    }
                    json.entities = array_entities
                }

                if (update.message.content.caption && update.message.content.caption.text && update.message.content.caption.entities.length > 0) {
                    var array_entities = []
                    for (var i = 0; i < update.message.content.caption.entities.length; i++) {
                        var data_entities = update.message.content.caption.entities[i]
                        var json_entities = {}
                        json_entities.offset = data_entities.offset
                        json_entities.length = data_entities.length
                        array_entities.push(json_entities)
                        if (data_entities.type._) {
                            var type_entities = data_entities.type._.toLocaleLowerCase().replace(/(textEntityType)/ig, "").replace(/(textUrl)/ig, "text_link").replace(/(botcommand)/ig, "bot_command").replace(/(mentionname)/ig, "text_mention")
                            json_entities.type = type_entities
                            if (data_entities.type.url) {
                                json_entities.url = data_entities.type.url
                            }
                            if (new RegExp("^text_mention$", "i").exec(type_entities) && data_entities.type.user_id) {
                                var entitiesUserId = data_entities.type.user_id ? data_entities.type.user_id : false
                                var fromJson = {}
                                if (entitiesUserId) {
                                    var getUser = await this.tg.request("getUser", { chat_id: entitiesUserId });
                                    if (getUser.ok) {
                                        fromJson = getUser.result;
                                    } else {
                                        throw new Error(getUser);
                                    }
                                }
                                json_entities.user = fromJson
                            }
                        }
                    }
                    json.entities = array_entities
                }

            }
            return { message: json }
        }
    }


}

/*

if (update.message.forward_info) {
    var msg_forward = update.message.forward_info
    if (msg_forward._) {
        var type = msg_forward.origin._.toLocaleLowerCase().replace(/(messageForwardOrigin)/ig, "")
        if (new RegExp("^user$", "i").exec(type)) {
            var from_detail = await this.tg.getUser(Number(msg_forward.origin.sender_user_id))
            var json_forward = {}
            json_forward.id = Number(msg_forward.origin.sender_user_id)
            try {
                if (new RegExp("^userTypeBot$", "i").exec(from_detail.type._)) {
                    json_forward.is_bot = true
                } else {
                    json_forward.is_bot = false
                }
            } catch (e) {
                json_forward.is_bot = false
            }
            json_forward.first_name = from_detail.first_name
            if (from_detail.last_name) {
                json_forward.last_name = from_detail.last_name
            }
            if (from_detail.username) {
                json_forward.username = from_detail.username
            }
            if (from_detail.phone_number) {
                json_forward.phone_number = from_detail.phone_number
            }
            if (from_detail.status) {
                json_forward.status = from_detail.status._.toLocaleLowerCase().replace(/(userStatus)/ig, "")
            }
            if (from_detail.language_code) {
                json_forward.language_code = from_detail.language_code
            }
            json_forward.detail = {
                "contact": from_detail.is_contact,
                "mutual": from_detail.is_mutual_contact,
                "verified": from_detail.is_verified,
                "support": from_detail.is_support,
                "scam": from_detail.is_scam,
                "fake": from_detail.is_fake
            }
            json.forward_from = json_forward
            json.forward_date = msg_forward.date
        }
        if (new RegExp("^channel$", "i").exec(type)) {
            var json_forward = {}
            var data = {
                "chat_id": Number(msg_forward.origin.chat_id)
            }
            var getChat = await this.tg.getChat(data.chat_id)
            var supergroup_detail = await this.tg.getSupergroup(getChat.type.supergroup_id)
            var from_json = {}
            json_forward.id = Number(msg_forward.origin.chat_id)
            json_forward.title = getChat.title
            if (supergroup_detail.username) {
                json_forward.username = supergroup_detail.username
            }
            json_forward.type = "channel"
            json.forward_from_chat = json_forward
            json.forward_date = msg_forward.date
        }

    }
}
*/
module.exports = {
    updateApi
}
