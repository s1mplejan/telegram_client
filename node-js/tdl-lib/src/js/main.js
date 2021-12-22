var { Client } = require("tdl");
var { TDLib } = require("tdl-tdlib-addon");
var lib = require("./index");
var folder = process.cwd();
class telegram {
    constructor(api_id, api_hash, pathDb = "./client/", pathTdLib = "./libtdjson.so", options = false) {
        var option = {
            apiId: api_id,
            apiHash: api_hash,
            databaseDirectory: `${folder}/${pathDb}`,
            filesDirectory: `${folder}/${pathDb}`,
            skipOldUpdates: true,
            verbosityLevel: 0,
            tdlibParameters: {
                enable_storage_optimizer: true,
                system_language_code: 'en',
                application_version: "v1",
                device_model: "node js",
                system_version: "v5"
            }
        }
        if (options) {
            for (var key in options) {
                if (Object.hasOwnProperty.call(object, key)) {
                    var loop_data = options[key];
                    option[key] = loop_data;

                }
            }
        }
        var tdlib = new TDLib(`${folder}/${pathTdLib}`);
        this.client = new Client(tdlib, option);
    }

    async optionBuild(json, object) {
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
        }
        await this.client.login(() => data);
        console.log("login bot")
    }

    async on(type, callback) {
        if (RegExp("update", "i").exec(type)) {
            var clients = this.client;
            this.client.on("update", async function (updateTd) {
                var lib = require("./index");
                var tg = new lib.telegramApi(clients);
                var updateApi = new lib.updateApi(tg);
                var update = await updateApi.update(updateTd);
                return callback(update);
            })
        }
    }
}

module.exports = {
    telegram
}