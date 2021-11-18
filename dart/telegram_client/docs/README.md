# Documentation

- Telegram
    - ```constuctor(String token, Map option)```
    default option
```dart
Map<String, dynamic> options = {
    "botPath": "/bot/",
    "userPath": "/user/",
    "port": 8080,
    "type": "bot", // replace user if you want login as user account
    "logger": false,
    "api": "https://api.telegram.org/" // replace if you want run bot on your local server or another server
};
```
- Request Raw Api
    - ```request("method", option)``` 
    request raw api is auto update from official server api,
    example request api:
```dart
var lib = Telegram("replace_token");
var tg = lib.api;
// chat id and text is required see docs for detail
Map parameters = {
    "chat_id":  132435,
    "text": "hello world"
};
tg.request("sendMessage", parameters);
```
- Request Short api
    - ```methodName(required, params)```
    request short api is not auto update because more method in server api
    example request sendMessage
```dart
var lib = Telegram("replace_token");
var tg = lib.api;
// chat id and text is required see docs for detail
tg.sendMessage(123456, "hewllo");
```