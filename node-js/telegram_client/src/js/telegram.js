// azka dev

var nodefetch = require("node-fetch");
var { Api } = require("./api");
class Telegram {

    constructor(token, options = {}) {
        this.options = {
            botPath: "/bot/",
            userPath: "/user/",
            port: 8080,
            type: "bot",
            api: 'https://api.telegram.org/',
            logger: false,
            ...options,
        };
        this.token = token;
        this.api = new Api(token, this.options);
    }
    async loginUser(phone, url) {
        if (!phone || ! url) {
            throw {
                message: "please use token"
            };
        }
        var option = {
            'method': 'POST',
            'headers': {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            "body": JSON.stringify({
                "phone_number": phone
            })
        };
        var url = `${url}/userlogin`;
        var response = await nodefetch(url, option); 
        if (response.status == 200) {
            return await response.json();
        } else {
            var msg = await response.json();
            throw {
                message: msg
            };
        }
    }
    newBot(token) {
        var option = this.options;
        option.type = "bot";
        return {
            api: new Api(token, option)
        };
    }

    newUser(token) {
        var option = this.options;
        option.type = "user";
        return {
            api: new Api(token, option)
        };
    }
}

module.exports = {
    Telegram
};