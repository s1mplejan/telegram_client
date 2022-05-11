var ffi = require('ffi-napi');
const EventEmitter = require('events');
var timer = require("node:timers/promises");
var folder = process.cwd();
class Tdlib {

    constructor(path_tdlib = "", option_tdlib = {}) {

        if (!option_tdlib) {
            option_tdlib = {};
        } else if (typeof option_tdlib != "object") {
            option_tdlib = {};
        }

        this.libm = ffi.Library(path_tdlib, {
            'td_create_client_id': ["int", []],
            'td_send': ["void", ["int", "char"]],
            'td_receive': ["char", ["double"]],
            'td_execute': ["char", ["char"]],
            'td_json_client_create': ['pointer', []],
            'td_json_client_send': ['void', ['pointer', 'string']],
            'td_json_client_receive': ['string', ['pointer', 'double']],
            'td_json_client_execute': ['string', ['pointer', 'string']],
            'td_json_client_destroy': ['void', ['pointer']],
            'td_set_log_file_path': ['int', ['string']],
            'td_set_log_verbosity_level': ['void', ['int']],
            'td_set_log_fatal_error_callback': ['void', ['pointer']],
        });
        this.optionTdlibDefault = {
            "@type": 'setTdlibParameters',
            'parameters': {
                '@type': 'tdlibParameters',
                'api_id': 0,
                'api_hash': '',
                'database_directory': `${folder}/./db_client`,
                'files_directory': `${folder}/./db_client`,
                "use_file_database": false,
                "use_chat_info_database": false,
                "use_message_database": false,
                "use_secret_chats": false,
                'enable_storage_optimizer': false,
                'system_language_code': 'en',
                'new_verbosity_level': 0,
                'application_version': 'v1',
                'device_model': 'Telegram Client Hexaminate',
                'system_version': "Linux",
                "database_key": "",
                "start": true,
                ...option_tdlib
            }
        };
        this.event_emitter = new EventEmitter();
        this.libm.td_set_log_verbosity_level(this.optionTdlibDefault.parameters.new_verbosity_level);
        this.client = this.libm.td_json_client_create();
    }

    client_destroy(parameters = {}) {
        return this.libm.td_json_client_destroy(this.client, this.json(parameters));
    }

    uuId(bytesNumber = 10) {
        var text = "1234567890qwertyuiopasdfghjklzxcvbnm";
        var texts = [...text];
        var message = "";
        while (true) {
            var data = texts[Math.floor(Math.random() * texts.length)];
            message += data;
            if (message.length == bytesNumber) {
                return message;
            }
        }
    }
    async client_send(parameters = {}, is_without_result = false) {
        var unique_id = this.uuId();
        parameters["@extra"] = unique_id;
        this.libm.td_json_client_send(this.client, this.json(parameters));
        if (is_without_result) {
            return null;
        }
        var json_result = false;
        this.on("update", async function (update) {
            if (update["@extra"] == unique_id) {
                delete update["@extra"];
                json_result = update;
            }
        });
        while (true) {
            await timer.setTimeout(1);
            if (json_result) {
                return json_result;
            }
        }
    }

    client_execute(parameters = {}) {
        return this.libm.td_json_client_execute(this.client, this.json(parameters));
    }

    invoke(method, parameters = {}) {
        var is_without_result = (parameters["is_without_result"] ? true : false);
        parameters["@type"] = method;
        delete parameters["is_without_result"];
        if (parameters["sync"]) {
            return this.client_send(parameters);
        } else {
            return this.client_execute(parameters, is_without_result);
        }
    }

    client_receive(timeout = 1.0) {
        var result = this.libm.td_json_client_receive(this.client, timeout);
        if (result != null) {
            return JSON.parse(result);
        }
        return result;
    }

    async requestApi(method, parameters = {}) {
        return this.invoke(method, parameters);
    }

    async request(method, parameters = {}) {
        return this.invoke(method, parameters);
    }

    json(query) {
        return Buffer.from(JSON.stringify(query) + '\0');
    }

    on(type, callback) {
        this.event_emitter.on(type, async function (update) {
            return callback(update);
        });
    }
    parseMode(text, parse_mode, entities) {
        var pesan = { "text": text };
        var parseMode = 'textParseModeHTML'
        if (typeof parse_mode == "string") {
            parse_mode = parse_mode.toLowerCase();
            if (parse_mode == 'markdown') {
                parseMode = 'textParseModeMarkdown'
            } else if (parse_mode == 'html') {
                parseMode = 'textParseModeHTML';
            } else {
                parse_mode = false;
            }
        }

        if (typeof parse_mode == "string") {
            pesan = this.client_execute({
                "@type": 'parseTextEntities',
                "parse_mode": { "@type": parseMode },
                "text": text
            });
        }

        if (entities) {
            pesan = {
                "@type": 'formattedText',
                "text": text,
                "entities": entities
            };
        }
        return pesan;
    }

    async initIsolate() {
        while (true) {
            await timer.setTimeout(1);
            var update = this.client_receive();
            if (update != null) {
                if (update["@type"] == "updateAuthorizationState") {
                    var authState = update["authorization_state"];
                    if (authState["@type"] == "authorizationStateWaitTdlibParameters") {
                        this.client_send(this.optionTdlibDefault, true);
                    }
                    if (authState["@type"] == "authorizationStateWaitEncryptionKe") {

                        var isEncrypted = authState['is_encrypted'] ?? false;
                        if (isEncrypted) {
                            console.log("check database key");
                            this.client_send({
                                "@type": 'checkDatabaseEncryptionKey',
                                'encryption_key': tdlib.optionTdlibDefault["database_key"]
                            }, true);
                        } else {
                            console.log("set database key");
                            this.client_send({
                                '@type': 'setDatabaseEncryptionKey',
                                'new_encryption_key': tdlib.optionTdlibDefault["database_key"]
                            }, true);
                        }

                    }
                }
                this.event_emitter.emit("update", update);
            }
        }
    }

}
module.exports = {
    Tdlib
};
