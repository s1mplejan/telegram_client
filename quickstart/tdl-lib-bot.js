var { telegram, telegramApi } = require("tdl-lib");
var token_bot = "";
var app_id = "";
var app_hash = "";
var id_bot = "";
var clientBot = new telegram(app_id, app_hash, `./ client / ${ id_bot } `);
var tg = new telegramApi(clientBot.client);

clientBot.on("update", async function (update, update_origin) {
    if (typeof update == "object") {
        if (typeof update["message"] == "object") {
            var msg = update["message"];
            var text = msg["text"] ?? "";
            var is_outgoing = msg["is_outgoing"];
            if (!is_outgoing) {
                if (text) {
                    if (text == "/start"){
                        return await tg.request("sendMessage", {
                            "chat_id": chat_id,
                            "text": "Hello world"
                        });
                    }
                }
            }
        }
    }
});
clientBot.bot(token_bot).then(async function (result) {
    console.log(result);
}).catch(async function (result) {
    console.log(result);
});