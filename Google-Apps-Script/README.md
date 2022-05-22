# Telegram CLient Google Apps Script

### ID LIBRARY

```bash
MX7LM0tJegNLBVVQUN-ggUvzwAZJHGahx
```

```bash
1fj-M9xvQdMazpGPwXKXvqkgZlvuAu50ICkbZ0VGtX27GX_V4Q4Z0WTuo
```

### Quick Start

- Bot
    ```javascript
    var lib = new telegramclient.telegram("token_bot");
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
    var lib = new telegramclient.telegram("paste_your_tokenhere", { "type": "user", "api": "api_userbot" });
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

## methods

### constructor
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |      `token`      | string token bot |           |   `yes`    |
| 2  | `options` |  [object](#options-constructor)    |           |    `no`    |
- examples
```js
var lib = new telegramclient.telegram("token_bot", {
    "api": "url_api"
});
```

### options constructor

|  key   | value  | Deskripsi | `required` |
|-------:|:------:|:----------|:----------:|
| `api` | string url api telegram bot default: `https://api.telegram.org/` | |`no` |
| `type` | string `bot` or `user` default: `bot` | | `no` |

### api

```js
var lib = new telegramclient.telegram("token_bot");
var tg = lib.api;
```

#### request
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |      `methods`      | [string](https://core.telegram.org/bots/api#available-methods) | tulis nama method sesuai yang kamu inginkan  |   `yes`    |
| 2  | `parameters` |  [object](https://core.telegram.org/bots/api#available-methods)    | parameters di butuhkan jika method membutuhkannya |    `no`    |
| 3  | `form` |  boolean default: false    | jika anda kirim file dari web maka tulis true |    `no`    |
| 4  | `blob` |  boolean default: false    |           |    `no`    |
- examples
```js
request("sendMessage", {
    "chat_id": 1234567,
    "text": "hello world"
});
```