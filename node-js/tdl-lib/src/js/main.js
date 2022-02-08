var { Client } = require("tdl");
var { TDLib } = require("tdl-tdlib-addon");
var folder = process.cwd();
class telegram {
    constructor(pathDb = "./client/", client= {}) {
        if (typeof client != "object"){
            client = {};
        }
        if (!client){
            client = {};
        }
        var option = {
            "apiId": 1917085,
            "apiHash": "a612212e6ac3ff1f97a99b2e0f050894",
            "databaseDirectory": `${folder}/${pathDb}`,
            "filesDirectory": `${folder}/${pathDb}`,
            "skipOldUpdates": true,
            "verbosityLevel": 0,
            "tdlibParameters": {
                "enable_storage_optimizer": true,
                "system_language_code": 'en',
                "application_version": "v1",
                "device_model": "Desktop",
                "system_version": "v5"
            },
            "pathTdLib": `${folder}/./libtdjson.so`,
            ...client
        };
        var tdlib = new TDLib(option["pathTdLib"]);
        this.option = option;
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
            });
            this.client.login(() => {
                type: 'user'
            }).catch(e => {
                console.log(e.message);
                return false;
            });
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
            var option = this.option;
            this.client.on("update", async function (updateTd) {
                var lib = require("./index");
                var tg = new lib.telegramApi(clients);
                var updateApi = new lib.updateApi(tg);
                var update = await updateApi.update(updateTd);
                return callback(update, updateTd, tg, option);
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