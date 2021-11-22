// azka dev

var fetch = require("node-fetch");
var { Api } = require("./api");
class Telegram {

    constructor(token, options = {}) {
        this.optiondef = {
            botPath: "/bot/",
            userPath: "/user/",
            port: 8080,
            type: "bot",
            api: false,
            logger: false
        };
        this.url = (options.api) ? this.optiondef.api = options.api : options.api = 'https://api.telegram.org/';
        this.options = this.invokeSync(this.optiondef, options);
        this.token = token;
        this.api = new Api(token, this.options);
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
}