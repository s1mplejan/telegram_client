var { Client } = require("tdl");
var { TDLib } = require("tdl-tdlib-addon");
var folder = process.cwd();
class telegram {
    constructor(api_id, api_hash, pathTdLib= "./libtdjson.so", pathDb = "./db/", options = false) {
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

    async user(){

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
}

var tg = new telegram(273729, "0f7a4f1ed6c06469bf0ecf70ce92b49d");

tg.bot("1982824593:AAEfmTRizfc5PdsojCqjMLohxD3SKaDra9s");

tg.client.on("update", async function(update){

    console.log(JSON.stringify(update, null,2))
})


module.exports = {
    telegram
}