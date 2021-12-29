var { Client } = require("tdl");
var { TDLib } = require("tdl-tdlib-addon");
var lib = require("./index");
var folder = process.cwd();
class telegram {
    constructor(api_id, api_hash, pathDb = "./client/", pathTdLib = "./libtdjson.so") {
        var option = {
            "apiId": api_id,
            "apiHash": api_hash,
            "databaseDirectory": `${folder}/${pathDb}`,
            "filesDirectory": `${folder}/${pathDb}`,
            "skipOldUpdates": true,
            "verbosityLevel": 0,
            "tdlibParameters": {
                "enable_storage_optimizer": true,
                "system_language_code": 'en',
                "application_version": "v1",
                "device_model": "node js",
                "system_version": "v5"
            }
        };
        var tdlib = new TDLib(`${folder}/${pathTdLib}`);
        this.client = new Client(tdlib, option);
    }

    async getClient() {
        return this.client;
    }

    async user() {
        try {
            this.client.connect().catch(e => {
                console.log(e.message);
                return false;
            })
            this.client.login(() => {
                type: 'user'
            }).catch(e => {
                console.log(e.message);
                return false;
            })
            return true;
        } catch (e) {
            console.log(e.message);
            return false;
        }
    }

    async bot(token_bot) {
        await this.client.connect();
        var data = {
            type: 'bot',
            token: token_bot,
            getToken: () => token_bot
        };
        await this.client.login(() => data);
        console.log("login bot")
    }

    async on(type, callback) {
        if (RegExp("^update$", "i").exec(type)) {
            var clients = this.client;
            this.client.on("update", async function (updateTd) {
                var lib = require("./index");
                var tg = new lib.telegramApi(clients);
                var updateApi = new lib.updateApi(tg);
                var update = await updateApi.update(updateTd);
                return callback(update, updateTd);
            });
        }
        if (RegExp("^raw$", "i").exec(type)) {
            this.client.on("update", async function (updateTd) {
                return callback(updateTd);
            });
        }
    }
}

module.exports = {
    telegram
}