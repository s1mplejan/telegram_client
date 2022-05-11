var readline = require("readline");
var rl = readline.createInterface({
    "input": process.stdin,
    "output": process.stdout
});
var { telegram, telegramApi } = require("tdl-lib");
var token_bot = "";
var app_id = "";
var app_hash = "";
var id_user = "";
var clientUser = new telegram(app_id, app_hash, `./client/${id_user}`);
var tg_user = new telegramApi(clientUser.client);

clientUser.on("update", async function (update, update_origin) {

    if (typeof update == "object") {

        if (RegExp("^updateAuthorizationState$", "i").exec(update['_'])) {

            if (RegExp("^authorizationStateWaitPhoneNumber$", "i").exec(update["authorization_state"]['_'])) {
                rl.question("phone_number:", async function (result) {
                    return await tg_user.setAuthenticationPhoneNumber(result);
                });
            }

            if (RegExp(`^authorizationStateWaitCode$`, "i").exec(update["authorization_state"]['_'])) {
                rl.question("code:", async function (result) {
                    return await tg_user.checkAuthenticationCode(result);
                });
            }

            if (RegExp(`^authorizationStateWaitPassword$`, "i").exec(update["authorization_state"]['_'])) {
                rl.question("password:", async function (result) {
                    return await tg_user.checkAuthenticationPassword(result);
                });
            }

            if (RegExp(`^authorizationStateReady$`, "i").exec(update.authorization_state['_'])) {
                console.log("succes login");
            }
        }

        if (typeof update["message"] == "object") {
            var msg = update["message"];
            var text = msg["text"] ?? "";

            if (text) {
                if (text == "ping") {
                    return await tg_user.request("sendMessage", {
                        "chat_id": msg["chat"]["id"],
                        "text": "Hello world"
                    });
                }
            }

        }

    }
});

clientUser.user().then(async function (result) {

});