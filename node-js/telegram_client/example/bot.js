var { Telegram } = require("../src/index");
var token_bot = "3131:asjakakmkad";
var chat_id = 183813;
var tg =  new Telegram(token_bot).api;

tg.sendMessage(chat_id, "helo world");

tg.requestForm("sendDocument", {
    "chat_id": chat_id,
    "document": tg.file("./bot.js")
});