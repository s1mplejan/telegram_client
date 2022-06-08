<h3 align="center">Telegram Client</h3>

Library untuk Mempermudah membuat application telegram, ( bot / userbot ) telegram

## Install Library
```bash
dart pub add telegram_client
```

```bash
flutter pub add telegram_client
```

- [Doc + Example](https://github.com/azkadev/telegram_client/tree/main/dart/telegram_client/doc)
- [Youtube-Tutorial](https://youtube.com/c/hexaminate)

## Feature

- Support Server Side and Client Side
- 3 library in one ( [Tdlib](#tdlib), [Telegram Bot Api](#telegrambotapi), [Mtproto](#mtproto) )
- Support Cross platform

## Docs

- [Tdlib](#tdlib)
- [Telegram Bot Api](#telegrambotapi)
- [Mtproto](#mtproto)

## Tdlib

quickstart:
```dart
import 'package:telegram_client/telegram_client.dart';
void main() async {
  Tdlib tg = Tdlib("libtdjson.so");
  tg.on("update", (UpdateTd update) {
    print(update.raw);
  });
  tg.initIsolate();
}
```

#### constructor

| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`path_tdlib`|String path tdlib| |`yes`|
| 2  | `options_tdlib` |  [object](https://core.telegram.org/bots/api#available-methods)    | parameters di butuhkan jika method membutuhkannya |    `no`    |
- examples
```js
Tdlib tg = Tdlib("./tdjson.so", {
  'api_id': 123435,
  'api_hash': 'asmamskmaks',
  'database_directory': "",
  'files_directory': "",
  "use_file_database": true,
  "use_chat_info_database": true,
  "use_message_database": true,
  "use_secret_chats": true,
  'enable_storage_optimizer': true,
  'system_language_code': 'en',
  'new_verbosity_level': 0,
  'application_version': 'v1',
  'device_model': 'Telegram Client Hexaminate',
});
```

#### on
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`type_update`|String path tdlib| |`yes`|
| 2  | `function` |  [object](#object)    | parameters di butuhkan jika method membutuhkannya |    `yes`    |
- examples
```js
tg.on("update", (UpdateTd update) {
  print(update.raw);    
});
```

#### initIsolate
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
- examples
```js
tg.initIsolate();
```

#### request
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`name_method`| String |more method check [tdlib-docs]() |`yes`|
| 2  | `parameters` |  [object](#methods-1)    | parameters di butuhkan jika method membutuhkannya |    `options`    |
- examples
```js
tg.request("sendMessage", {
  "chat_id": 123456,
  "text": "Hello world"
});
```
#### invoke
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  | `parameters` |  [object](#methods-1)    | parameters di butuhkan jika method membutuhkannya |    `yes`    |
- examples
```js
tg.invoke({
  "@type": "getMe",
});
```
#### invokeSync
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  | `parameters` |  [object](#methods-1)    | parameters di butuhkan jika method membutuhkannya |    `yes`    |
- examples
```js
tg.invokeSync({
  "@type": "getMe",
});
```
---
### Object
---
### UpdateTd

#### raw
#### raw_api_light
#### raw_api
#### message
#### channel_post
---
### methods
more method check [tdlib-docs]()
#### sendMessage
| No |key| value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`chat_id`| String or int | |`yes`|
| 2  | `text` | String | |`yes`|

#### sendPhoto
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`chat_id`| String or int | |`yes`|
| 2  | `photo` | String| |`yes`|

## TelegramBotApi

quickstart:
```dart
import 'package:telegram_client/telegram_client.dart';
void main() async {
  TelegramBotApi tg = TelegramBotApi("token_bot");
  var send = await tg.api.request("getMe");
  print(send);
}
```
#### constructor

| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`string_token_bot`| String token bot [@botfather](https://t.me/botfather)| |`yes`|
| 2  | `options_tdlib` |  [object](https://core.telegram.org/bots/api#available-methods)    | parameters di butuhkan jika method membutuhkannya |    `no`    |
- examples
```js
TelegramBotApi tg = TelegramBotApi("token_bot");
```

#### Api


##### request 
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`name_method`| String |more method check [tdlib-docs]() |`yes`|
| 2  | `parameters` |  [object](#methods-1)    | parameters di butuhkan jika method membutuhkannya |    `options`    |
- examples
```dart
tg.api.request("sendMessage", {
  "chat_id": 123456,
  "text": "Hello world"
});
```

## MtProto
Quickstart:
```dart
import 'package:telegram_client/telegram_client.dart';
void main() async {
  Mtproto tg = Mtproto();
  tg.connect();
  tg.on("update", (data) {
    print(data);
  });
}
```