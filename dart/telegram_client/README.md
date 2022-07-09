# Telegram Client library
<p align="center">
  <img src="https://raw.githubusercontent.com/azkadev/telegram_client/main/assets/telegram.png" width="350px">
</p>
<h2 align="center">Fast, Enjoyable & Customizable Telegram Client</h2>

[![Pub Version](https://img.shields.io/pub/v/telegram_client?label=pub.dev&labelColor=333940&logo=dart)](https://pub.dev/packages/telegram_client)

Telegram client dart library to make application telegram based flutter and userbot / bot support server side and client side

## Features

- 🚀 Cross platform: mobile, desktop, browser
- ⚡ Great performance
- ❤️ Simple, powerful, & intuitive API

## Examples App use Telegram Client

1. [Azkagram](https://github.com/azkadev/azkagram)

<img src="https://raw.githubusercontent.com/azkadev/azkagram/main/screenshot/home.png" width="250px"><img src="https://raw.githubusercontent.com/azkadev/azkagram/main/screenshot/me.png" width="250px"><img src="https://user-images.githubusercontent.com/82513502/173319331-9e96fbe7-3e66-44b2-8577-f6685d86a368.png" width="250px"><img src="https://user-images.githubusercontent.com/82513502/173319541-19a60407-f410-4e95-8ac0-d0da2eaf2457.png" width="250px">

## Examples Bot use Telegram Client

1. [AzkadevBot](https://t.me/azkadevbot)
  Telegram clone bot and userbot

---

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
gunakan ini untuk membuat userbot / bot / application based tdlib,
quickstart:
- single
```dart
import 'dart:io';
import 'package:telegram_client/telegram_client.dart';
void main(List<String> args) async {
  var path = Directory.current.path;
  Tdlib tg = Tdlib("libtdjson.so", clientOption: {
    'api_id': 12345,
    'api_hash': 'abcdefgjjaijiajdisd',
    'database_directory': "$path/user/",
    'files_directory': "$path/user/",
  });
  tg.on("update", (UpdateTd update) {
    print(update.raw);
  });
  await tg.initIsolate();
}
```
- multi
```dart
import 'dart:io';
import 'package:telegram_client/telegram_client.dart';
void main(List<String> args) async {
  var path = Directory.current.path;
  Tdlib tg = Tdlib("libtdjson.so", clientOption:{
    'api_id': 12345678,
    'api_hash': 'asaskaoskaoskoa',
    'database_directory': "$path/user_0/",
    'files_directory': "$path/user_0/",
  });
  tg.on("update", (UpdateTd update) {
    if (tg.client_id == update.client_id) {
      print("user_0");
    } else {
      print("user_1");
    }
    print(update.raw);
  });
  await tg.initIsolate();
  await tg.initIsolateNewClient(clientId: tg.client_create().address, clientOption: {
    'database_directory': "$path/user_1/",
    'files_directory': "$path/user_1/",
  });
}
```

#### constructor

| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`path_tdlib`|String path tdlib| |`yes`|
| 2  | `clientOption` |  [object](https://core.telegram.org/bots/api#available-methods)    | parameters di butuhkan jika method membutuhkannya |    `no`    |
- examples
```js
Tdlib tg = Tdlib("./tdjson.so", clientOption: {
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
| 1  |`clientId`| int addres client_create | |`no`|
| 2  | `clientOption` |  [object](https://core.telegram.org/bots/api#available-methods)    | parameters di butuhkan jika method membutuhkannya |    `no`    |
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
tg.request("sendMessage", parameters: {
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
Gunakan ini untuk berinteraksi dengan api telegram, semua method disini sudah auto update

quickstart:
- single
```dart
import 'package:telegram_client/telegram_client.dart';
void main(List<String> args) async {
  TelegramBotApi tg = TelegramBotApi("token");
  tg.on("update", (UpdateApi update) {
    print(update.raw);
  });
  await tg.initIsolate(); // add this jika ingin menggunakan long poll update
}
```
- multi
```dart
import 'package:telegram_client/telegram_client.dart';
void main(List<String> args) async {
  TelegramBotApi tg = TelegramBotApi("token");
  tg.on("update", (UpdateApi update) {
    print(update.raw);
  });
  await tg.initIsolate();
  await tg.initIsolate(tokenBot: "new_token_bot");
}
```

#### constructor

| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`string_token_bot`| String token bot [@botfather](https://t.me/botfather)| |`yes`|
| 2  | `clientOption` |  [object](https://core.telegram.org/bots/api#available-methods)    | parameters di butuhkan jika method membutuhkannya |    `no`    |
- examples
```js
TelegramBotApi tg = TelegramBotApi("token_bot");
```

##### request 
| No |       key       | value  | Deskripsi | `required` |
|----|:---------------:|:------:|:----------|:----------:|
| 1  |`name_method`| String |more method check [tdlib-docs]() |`yes`|
| 2  | `parameters` |  [object](#methods-1)    | parameters di butuhkan jika method membutuhkannya |    `options`    |
- examples
```dart
tg.request("sendMessage", parameters:{
  "chat_id": 123456,
  "text": "Hello world"
});
```

## MtProto
Untuk mtproto telegram ini belum jadi ya karena saya belum mengerti cara connect mtproto
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



- Tags:
  #telegram #telegram_client #tdlib #mtproto #telegram_bot_api #telegram_dart #telegram_flutter #telegram_clone #telegram_userbot #telegram_bot

- Seo
  Telegram Dart
  Telegram Client
  Telegram Flutter
  Telegram userbot
  Telegram Bot
  Telegram Tdlib
  Tdlib
  Mtproto
  Telegram Bot Api
  Telegram Library
  Telegram clone
  Telegram clone flutter
  Tdlib Dart
  Tdlib Flutter
  Mtproto dart
  Mtproto flutter
  Telegram Bot Api
  Telegram Bot Api dart
  Telegram Bot Api Flutter
---