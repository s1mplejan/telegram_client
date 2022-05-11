# Telegram Client node js


### Quick Start

- Bot
    ```javascript
    var { Telegram } = require("../src/index");
    var lib = new Telegram("token_bot");
    var tg = lib.api;

    function setWebhook() {
        var url = "url_deployc";
        var option = {
            "url": url
        };
        var data = tg.request("setWebhook", option);
        console.log(data);
    }

    function doGet(e) {
        return ContentService.createTextOutput("hello");
    }

    function doPost(e) {
        if (e.postData.type == "application/json") {
            var update = JSON.parse(e.postData.contents);
            if (update) {
                if (update.message) {
                    var msg = update.message;
                    if (text) {
                        if (msg.text == "/start") {
                            var option = {
                                "chat_id": msg.chat.id,
                                "text": "Hay this start message"
                            };
                            return tg.request("sendMessage", option);
                        } else {
                            var option = {
                                "chat_id": msg.chat.id,
                                "text": "echo " + text
                            };
                            return tg.request("sendMessage", option);
                        }
                    } else {
                        var option = {
                            "chat_id": msg.chat.id,
                            "text": "Hello you"
                        };
                        return tg.request("sendMessage", option);
                    }
                }
            }
        }
    }
    ```
- Userbot

    ```javascript
    var { Telegram } = require("../src/index");
    var lib = new Telegram("paste_your_tokenhere", { "type": "user", "api": "api_userbot" });
    var tg = lib.api;

    function getToken(){
        var data = lib.loginUser("phone_number_int", "url_api");
        console.log(JSON.stringify(data, null, 2));
    }

    function login(){
        var option = {
            "code": "code_telegram"
        };
        var data = tg.request("authcode", option);
        console.log(JSON.stringify(data, null, 2));   
    }

    function setWebhook() {
        var url = "urlDeploy";
        var option = {
            "url": url
        };
        var data = tg.request("setWebhook", option);
        console.log(data);
    }

    function doGet(e) {
        return ContentService.createTextOutput("hello");
    }

    function doPost(e) {
        if (e.postData.type == "application/json") {
            var update = JSON.parse(e.postData.contents);
            if (update) {
                if (update.message) {
                    var msg = update.message;
                    if (text) {
                        if (msg.text == "/start")  {
                            var option = {
                                "chat_id": msg.chat.id,
                                "text": "Hay this start message"
                            };
                            return tg.request("sendMessage", option);
                        } else {
                            var option = {
                                "chat_id": msg.chat.id,
                                "text": "echo " + text
                            };
                            return tg.request("sendMessage",   option);
                        }
                    } else {
                        var option = {
                            "chat_id": msg.chat.id,
                            "text": "Hello you"
                        };
                        return tg.request  ("sendMessage", option);
                    }
                }
            }
        }
    }
    ```
