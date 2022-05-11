/// azka dev

var telegram = class Telegram {

    constructor(token, options = {}) {
        this.optiondef = {
            type: "bot",
            api: false
        };
        if (options.api) {
            if (RegExp("(\/$|^https?)", "i").exec(options.api)) {
                this.optiondef.api = options.api;
            } else {
                throw {
                    "message": "tolong isi value dengan benar"
                };
            }
        } else {
            options.api = 'https://api.telegram.org/';
        }
        this.options = this.invokeSync(this.optiondef, options);
        this.token = token;
        this.api = new Apis(token, this.options);
    }



    loginUser(phone, url) {
        var options = {
            'method': 'post',
            'contentType': 'application/json'
        };
        options['payload'] = JSON.stringify(
            {
                "phone_number": phone
            }
        );

        var url = `${url}/userlogin`;
        var response = UrlFetchApp.fetch(url, options);
        if (response.getResponseCode() == 200) {
            return JSON.parse(response.getContentText());

        }
        return false;
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

    doPost(e) {
        if (e.postData.type == "application/json") {
            var update = JSON.parse(e.postData.contents);
            if (update) {
                return update;
            }
        }
        return {};
    }

    newBot(token) {
        var option = this.options;
        option.type = "bot";
        return {
            api: new Apis(token, option)
        };
    }

    newUser(token) {
        var option = this.options;
        option.type = "user";
        return {
            api: new Apis(token, option)
        };
    }

}