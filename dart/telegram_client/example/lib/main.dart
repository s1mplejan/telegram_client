// ignore_for_file: non_constant_identifier_names, avoid_print, empty_catches, dead_code

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexaminate/hexaminate.dart';
import 'package:telegram_client/telegram_client.dart';
import 'dart:io';

String path = Directory.current.path;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  Tdlib tg = Tdlib("libtdjson.so", {
    'api_id': 1917085,
    'api_hash': 'a612212e6ac3ff1f97a99b2e0f050894',
    'database_directory':
        "/data/data/com.example.example/files/bost" /*"$path/bost"*/,
    'files_directory':
        "/data/data/com.example.example/files/bost" /*"$path/bost"*/,
  });
  tg.initIsolate();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        tg: tg,
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.tg})
      : super(key: key);
  final String title;
  final Tdlib tg;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  bool _isLoading = false;
  TextEditingController phone_number = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  var chats = [];
  List messages = [
    {
      "is_outgoing": true,
      "from": {"first_name": "azka"},
      "chat": {"title": "Roleplayer"},
      "date": "12345678",
      "text": "hello world"
    },
    {
      "is_outgoing": false,
      "from": {"first_name": "azka"},
      "chat": {"title": "Roleplayer"},
      "date": "12345678",
      "text": "hello world"
    },
  ];

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  var updateText = "";
  bool is_load_chat = false;
  Map stateData = {
    "page": "signup",
    "type": "phone",
    "type_account": "user",
    "state": {"first_name": ""},
    "temp": {"phone_number": "", "code": ""}
  };
  bool isLogin = false;
  @override
  void initState() {
    super.initState();

    TelegramApi tg_api = TelegramApi(widget.tg);
    widget.tg.on("update", (UpdateTd update) async {
      if (update.raw["@type"] == "updateAuthorizationState") {
        if (typeof(update.raw["authorization_state"]) == "object") {
          var authStateType = update.raw["authorization_state"]["@type"];
          if (authStateType == "authorizationStateWaitPhoneNumber") {
            setState(() {
              stateData["page"] = "signup";
              stateData["type"] = "phone";
            });
          }
          if (authStateType == "authorizationStateWaitCode") {
            setState(() {
              stateData["page"] = "signup";
              stateData["type"] = "code";
            });
          }
          if (authStateType == "authorizationStateWaitPassword") {
            setState(() {
              stateData["page"] = "signup";
              stateData["type"] = "password";
            });
          }
          if (authStateType == "authorizationStateReady") {
            setState(() {
              isLogin = true;
              stateData["page"] = "signin";
              stateData["type"] = "main";
              is_load_chat = true;
            });

            try {
              var getChat = await tg_api.getChats(is_detail: true);
              if (getChat["ok"]) {
                setState(() {
                  is_load_chat = false;
                  chats = getChat["result"];
                });
              } else {
                setState(() {
                  is_load_chat = false;
                });
              }
            } catch (e) {}
          }
        }
      }
      if (update.message.is_found) {
        if (update.raw["@type"] == "updateNewMessage") {
          if (update.raw["message"]["@type"] == "message") {
            try {
              var result = await tg_api.jsonMessage(update.raw["message"]);
              if (result["ok"]) {
                if (stateData["state"]["id"] ==
                    result["result"]["chat"]["id"]) {
                  return setState(() {
                    messages.insert(0, result["result"]);
                  });
                }
                List chat_ids_data = [];
                for (var i = 0; i < chats.length; i++) {
                  chat_ids_data.add(chats[i]["id"]);
                  if (chats[i]["id"] == result["result"]["chat"]["id"]) {
                    print("ada");
                    var new_chat_data = chats[i];
                    new_chat_data["last_message"] = result["result"];
                    return setState(() {
                      chats.removeAt(i);
                      chats.insert(0, new_chat_data);
                    });
                  }
                }
                try {
                  if (!chat_ids_data.contains(result["result"]["chat"]["id"])) {
                    Map new_chat_data = {};
                    result["result"]["chat"].forEach((key, value) {
                      new_chat_data[key] = value;
                    });
                    new_chat_data["last_message"] = result["result"];
                    return setState(() {
                      chats.insert(0, new_chat_data);
                    });
                  }
                } catch (e) {}
              } else {
                print(result);
              }
            } catch (e) {
              print(e);
            }
          }
        }
        if (update.message.text != null) {
          if (update.message.text!.isNotEmpty) {}
          if (RegExp("^/ping", caseSensitive: false)
              .hasMatch(update.message.text ?? "")) {
            widget.tg.requestSendApi("sendMessage", {
              "chat_id": update.message.chat.id,
              "input_message_content": {
                "@type": "inputMessageText",
                "text": {
                  "@type": "formattedText",
                  "text": "pong",
                  "entitiees": []
                },
                "disableWebPagePreview": false,
                "clearDraft": false
              }
            });
          }
          if (update.message.text == "/jsondump") {
            print(JSON.stringify(update.raw, null, 2));
          }
          if (update.message.text == "/stop") {
            widget.tg.stop();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TelegramApi tg_api = TelegramApi(widget.tg);
    showPopUp(titleName, valueBody) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titleName),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(valueBody ?? "Error"),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Mengerti'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    List<Widget> signUpWidget() {
      return [
        Image.network(
          'https://ouch-cdn2.icons8.com/n9XQxiCMz0_zpnfg9oldMbtSsG7X6NwZi_kLccbLOKw/rs:fit:392:392/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDMv/MGE2N2YwYzMtMjQw/NC00MTFjLWE2MTct/ZDk5MTNiY2IzNGY0/LnN2Zw.png',
          fit: BoxFit.cover,
          width: 280,
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          'SIGN-UP',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.grey.shade900),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Text(
            (stateData["type"] == "phone")
                ? "Enter phone number, and i will send your otp on telegram"
                : (stateData["type"] == "code")
                    ? "Enter your code"
                    : "Enter your password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          cursorColor: Colors.black,
          controller: (stateData["type"] == "phone")
              ? phone_number
              : (stateData["type"] == "code")
                  ? code
                  : password,
          keyboardType: (stateData["type"] != "password")
              ? TextInputType.number
              : TextInputType.visiblePassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            labelText: (stateData["type"] == "phone")
                ? "Phone Number"
                : (stateData["type"] == "code")
                    ? "Code"
                    : "Password",
            hintText: (stateData["type"] == "phone")
                ? "62xxxxxxx"
                : (stateData["type"] == "code")
                    ? "12345"
                    : "abcdefghi",
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
            prefixIcon: Icon(
              (stateData["type"] == "phone")
                  ? CupertinoIcons.phone
                  : (stateData["type"] == "code")
                      ? CupertinoIcons.number
                      : CupertinoIcons.lock,
              color: Colors.black,
              size: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            floatingLabelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        MaterialButton(
          minWidth: double.infinity,
          onPressed: () async {
            if (stateData["page"] != "signup") {
              setState(() {
                stateData["type"] = "password";
                _isLoading = false;
              });
            }
            if (!_isLoading) {
              setState(() {
                _isLoading = true;
              });
              if (stateData["type"] == "phone") {
                if (phone_number.text.isEmpty) {
                  setState(() {
                    _isLoading = false;
                  });
                  return showPopUp("Failed", "Tolong isi phone number ya");
                }
                if (!RegExp("^[0-9]+\$", caseSensitive: false)
                    .hasMatch(phone_number.text)) {
                  setState(() {
                    _isLoading = false;
                  });
                  return showPopUp(
                      "Failed", "Tolong isi nomor ponsel dengan angka ya!");
                }

                widget.tg.requestSendApi("setAuthenticationPhoneNumber",
                    {"phone_number": phone_number.text});
                showPopUp("Succes",
                    "Tolong check di telegram ya! $phone_number.text");
                setState(() {
                  _isLoading = false;
                });
              }
              if (stateData["type"] == "code") {
                if (code.text.isEmpty) {
                  setState(() {
                    _isLoading = false;
                  });
                  return showPopUp("Failed", "Tolong isi code ya");
                }
                if (!RegExp("^[0-9]+\$", caseSensitive: false)
                    .hasMatch(code.text)) {
                  setState(() {
                    _isLoading = false;
                  });
                  return showPopUp(
                      "Failed", "Tolong isi code dengan angka ya!");
                }
                if (code.text.length != 5) {
                  setState(() {
                    _isLoading = false;
                  });
                  return showPopUp(
                      "Failed", "Tolong isi code panjang 5 karakter ya!");
                }

                widget.tg.requestSendApi(
                    "checkAuthenticationCode", {"code": code.text});
                setState(() {
                  _isLoading = false;
                });
              }

              if (stateData["type"] == "password") {
                widget.tg.requestSendApi(
                    "checkAuthenticationCode", {"code": password.text});
                setState(() {
                  _isLoading = false;
                });
              }
            } else {
              setState(() {
                _isLoading = false;
              });
            }
          },
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  (stateData["type"] == "phone")
                      ? "Request OTP"
                      : (stateData["type"] == "code")
                          ? "Send Code"
                          : "Send Password",
                  style: const TextStyle(color: Colors.white),
                ),
        ),
        const SizedBox(
          height: 20,
        ),
      ];
    }

    List<Widget> signInWidget() {
      try {
        if (stateData["type"] == "chat") {
          print("ya");
          return [
            Flexible(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  reverse: messages.isEmpty ? false : true,
                  itemCount: messages.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    var msg = messages[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 3,
                      ),
                      child: Column(
                        mainAxisAlignment: messages.isEmpty
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: msg["is_outgoing"]
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    crossAxisAlignment: msg["is_outgoing"]
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          maxHeight: double.infinity,
                                        ),
                                        decoration: BoxDecoration(
                                          color: msg["is_outgoing"]
                                              ? const Color(0xFFE3D8FF)
                                              : const Color(0xFFFFFFFF),
                                          borderRadius: msg["is_outgoing"]
                                              ? const BorderRadius.only(
                                                  topRight: Radius.circular(11),
                                                  topLeft: Radius.circular(11),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(11),
                                                )
                                              : const BorderRadius.only(
                                                  topRight: Radius.circular(11),
                                                  topLeft: Radius.circular(11),
                                                  bottomRight:
                                                      Radius.circular(11),
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 7,
                                                ),
                                                child: Text(
                                                  msg["from"]["first_name"] ??
                                                      msg["from"]["title"] ??
                                                      "",
                                                  textAlign: TextAlign.end,
                                                  style: const TextStyle(
                                                    color: Color(0xFF594097),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              msg["text"] ??
                                                  "Unsupported Message Please Update App",
                                              textAlign: TextAlign.start,
                                              softWrap: true,
                                              style: const TextStyle(
                                                color: Color(0xFF2E1963),
                                                fontSize: 14,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 7,
                                                ),
                                                child: Text(
                                                  msg["date"].toString(),
                                                  textAlign: TextAlign.end,
                                                  style: const TextStyle(
                                                    color: Color(0xFF594097),
                                                    fontSize: 9,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)],
                ),
                child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  controller: messageController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: InkWell(
                        child: const Icon(
                          CupertinoIcons.hand_draw,
                          color: Colors.pink,
                          size: 25,
                        ),
                        onTap: () {},
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        child: const Icon(
                          CupertinoIcons.arrow_right_square_fill,
                          color: Colors.blue,
                          size: 25,
                        ),
                        onTap: () async {
                          try {
                            await widget.tg.requestSendApi(
                                "sendMessage",
                                widget.tg.makeParametersApi({
                                  "@type": "sendMessage",
                                  "chat_id": stateData["state"]["id"],
                                  "text": "hello"
                                }));
                          } catch (e) {}
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        }

        return [
          SizedBox(height: MediaQuery.of(context).padding.top),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: chats.length,
              itemBuilder: (BuildContext ctx, int index) {
                try {
                  return SafeArea(
                    minimum: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Ink(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xffF0F8FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SafeArea(
                          minimum: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      chats[index]["first_name"] ??
                                          chats[index]["title"] ??
                                          "",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      (chats[index]["last_message"] != null)
                                          ? (chats[index]["last_message"]
                                                      ["text"] !=
                                                  null)
                                              ? (chats[index]["last_message"]
                                                              ["text"]
                                                          .toString()
                                                          .length >
                                                      10)
                                                  ? chats[index]["last_message"]
                                                          ["text"]
                                                      .toString()
                                                      .substring(1, 10)
                                                  : chats[index]["last_message"]
                                                      ["text"]
                                              : "Unsupported message please update"
                                          : "",
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (chats[index]["last_message"] != null)
                                          ? chats[index]["last_message"]["date"]
                                              .toString()
                                          : "",
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: double.infinity,
                                        maxWidth: double.infinity,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFF5216),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 0,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: SafeArea(
                                        minimum: const EdgeInsets.all(4.0),
                                        child: Text(
                                          (chats[index]["detail"]
                                                          ["unread_count"] !=
                                                      null &&
                                                  chats[index]["detail"]
                                                          ["unread_count"] !=
                                                      0)
                                              ? chats[index]["detail"]
                                                      ["unread_count"]
                                                  .toString()
                                              : "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
                        setState(() {
                          is_load_chat = true;
                        });

                        var getchat = await tg_api.getChatHistory(
                          chats[index]["id"],
                        );
                        setState(() {
                          messages = getchat["result"]["messages"];
                          stateData["type"] = "chat";
                          stateData["state"] = chats[index];
                          is_load_chat = false;
                        });
                      },
                    ),
                  );
                } catch (e) {
                  print("Error $index");
                  print(chats[index]);
                  print(e);
                  return Container();
                }
              })
        ];
      } catch (e) {
        return [Text(JSON.stringify(e, null, 2))];
      }
    }

    return Scaffold(
      appBar: (stateData["type"] == "chat")
          ? PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: SafeArea(
                minimum: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.black,
                        size: 30,
                      ),
                      onTap: () async {
                        setState(() {
                          stateData["type"] = "main";
                          is_load_chat = true;
                        });
                        print("azka");

                        try {
                          var getChat = await tg_api.getChats(is_detail: true);
                          setState(() {
                            stateData["state"] = {};
                            stateData["type"] = "main";
                            is_load_chat = false;
                            chats = getChat["result"];
                          });
                        } catch (e) {
                          print("error");
                          print(e);
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    /*
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey[100],
                backgroundImage: AssetImage(widget.userData["photo"]),
              ),
              */
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      stateData["state"]["first_name"] ??
                          stateData["state"]["title"] ??
                          "",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: (stateData["type"] == "chat")
          ? (is_load_chat)
              ? ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: signInWidget())
          : SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: LayoutBuilder(
                builder: (contex, constraints) {
                  if (stateData["page"] == "signin") {
                    if (is_load_chat) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Column(
                      children: signInWidget(),
                    );
                  }
                  if (stateData["page"] == "signup") {
                    return Container(
                      padding: const EdgeInsets.all(30),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: signUpWidget(),
                      ),
                    );
                  }
                  return Container(
                    padding: const EdgeInsets.all(30),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: signUpWidget(),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: (stateData["type"] == "chat")
          ? null
          : FloatingActionButton(
              onPressed: () async {
                setState(() {
                  is_load_chat = true;
                });
                print("azka");

                try {
                  var getChat = await tg_api.getChats(is_detail: true);
                  setState(() {
                    stateData["type"] = "main";
                    is_load_chat = false;
                    chats = getChat["result"];
                  });

                  showPopUp(
                      "result", JSON.stringify(getChat["result"], null, 2));
                } catch (e) {
                  print("error");
                  print(e);
                }
              },
            ),
    );
  }
}

class TelegramApi {
  late Tdlib tg_client;
  TelegramApi(this.tg_client);

  getChats({bool is_detail = false}) async {
    try {
      var getChatres =
          await tg_client.requestSendApi("getChats", {"limit": 999999});
      List array = [];
      for (var i = 0; i < getChatres["chat_ids"].length; i++) {
        var loop_data = getChatres["chat_ids"][i];
        print(i);
        try {
          var getChatres = await getChat(loop_data, is_detail: is_detail);
          if (getChatres["ok"]) {
            array.add(getChatres["result"]);
          }
        } catch (e) {}
      }
      return {"ok": true, "result": array};
    } catch (e) {
      return {"ok": false, "result": e};
    }
  }

  getChat(dynamic chat_id, {bool is_detail = false}) async {
    try {
      if (RegExp("^@.*\$", caseSensitive: false).hasMatch(chat_id.toString())) {
        var search_public_chat = await tg_client
            .requestSendApi("searchPublicChat", {"username": chat_id});
        if (search_public_chat["@type"] == "chat") {
          chat_id = search_public_chat["id"];
        }
      }
      if (RegExp("^[0-9]+\$", caseSensitive: false)
          .hasMatch(chat_id.toString())) {
        try {
          await getUser(chat_id);
        } catch (e) {}
      }
      var getchat =
          await tg_client.requestSendApi("getChat", {"chat_id": chat_id});
      Map json = {};
      if (RegExp("^chat\$", caseSensitive: false).hasMatch(getchat["@type"])) {
        var type_chat = getchat["type"]["@type"]
            .toString()
            .toLowerCase()
            .replaceAll(RegExp("chattype", caseSensitive: false), "");

        if (type_chat == "supergroup") {
          var getSupergroup = await tg_client.requestSendApi("getSupergroup", {
            "supergroup_id": int.parse(chat_id
                .toString()
                .replaceAll(RegExp("^-100", caseSensitive: false), ""))
          });
          json["id"] = chat_id;
          json["title"] = getchat["title"];
          if (typeof(getSupergroup["username"]) == "string") {
            json["username"] = getSupergroup["username"];
          }
          if (typeof(getSupergroup["status"]) == "object") {
            json["status"] = getSupergroup["status"]["@type"]
                .toString()
                .toLowerCase()
                .replaceAll(
                    RegExp("chatMemberStatus", caseSensitive: false), "");
          }
          json["type"] =
              getchat["type"]["is_channel"] ? "channel" : "supergroup";
          json["detail"] = {
            "member_count": getSupergroup["member_count"],
            "administrator_count": 0,
            "restricted_count": 0,
            "banned_count": 0,
            "has_protected_content": getchat["has_protected_content"] ?? false,
            "is_marked_as_unread": getchat["is_marked_as_unread"] ?? false,
            "is_blocked": getchat["is_blocked"] ?? false,
            "has_scheduled_messages":
                getchat["has_scheduled_messages"] ?? false,
            "can_be_deleted_only_for_self":
                getchat["can_be_deleted_only_for_self"] ?? false,
            "can_be_deleted_for_all_users":
                getchat["can_be_deleted_for_all_users"] ?? false,
            "can_be_reported": getchat["can_be_reported"] ?? false,
            "default_disable_notification":
                getchat["default_disable_notification"] ?? false,
            "unread_count": getchat["unread_count"] ?? 0,
            "last_read_inbox_message_id":
                getchat["last_read_inbox_message_id"] ?? 0,
            "last_read_outbox_message_id":
                getchat["last_read_outbox_message_id"] ?? 0,
            "unread_mention_count": getchat["unread_mention_count"] ?? 0,
            "has_linked_chat": getSupergroup["has_linked_chat"],
            "has_location": getSupergroup["has_location"],
            "sign_messages": getSupergroup["sign_messages"],
            "is_slow_mode_enabled": getSupergroup["is_slow_mode_enabled"],
            "is_broadcast_group": getSupergroup["is_broadcast_group"],
            "is_verified": getSupergroup["is_verified"],
            "is_scam": getSupergroup["is_scam"],
            "is_fake": getSupergroup["is_fake"]
          };

          if (is_detail) {
            if (typeof(getchat["last_message"]) == "object") {
              var last_message = await jsonMessage(getchat["last_message"],
                  from_data: json, chat_data: json);
              if (last_message["ok"]) {
                json["last_message"] = last_message["result"];
              }
            }
          }

          return {"ok": true, "result": json};
        } else if (type_chat == "basicgroup") {
          var getBasicGroup = await tg_client.requestSendApi("getBasicGroup", {
            "basic_group_id": int.parse(chat_id
                .toString()
                .replaceAll(RegExp("^-", caseSensitive: false), ""))
          });
          json["id"] = chat_id;
          json["title"] = getchat["title"];
          if (typeof(getBasicGroup["status"]) == "object") {
            json["status"] = getBasicGroup["status"]["@type"]
                .toString()
                .toLowerCase()
                .replaceAll(
                    RegExp("chatMemberStatus", caseSensitive: false), "");
          }
          json["type"] = "group";
          json["detail"] = {
            "member_count": getBasicGroup["member_count"],
            "has_protected_content": getchat["has_protected_content"] ?? false,
            "is_marked_as_unread": getchat["is_marked_as_unread"] ?? false,
            "is_blocked": getchat["is_blocked"] ?? false,
            "has_scheduled_messages":
                getchat["has_scheduled_messages"] ?? false,
            "can_be_deleted_only_for_self":
                getchat["can_be_deleted_only_for_self"] ?? false,
            "can_be_deleted_for_all_users":
                getchat["can_be_deleted_for_all_users"] ?? false,
            "can_be_reported": getchat["can_be_reported"] ?? false,
            "default_disable_notification":
                getchat["default_disable_notification"] ?? false,
            "unread_count": getchat["unread_count"] ?? 0,
            "last_read_inbox_message_id":
                getchat["last_read_inbox_message_id"] ?? 0,
            "last_read_outbox_message_id":
                getchat["last_read_outbox_message_id"] ?? 0,
            "unread_mention_count": getchat["unread_mention_count"] ?? 0,
          };
          if (is_detail) {
            if (typeof(getchat["last_message"]) == "object") {
              var last_message = await jsonMessage(getchat["last_message"],
                  from_data: json, chat_data: json);
              if (last_message["ok"]) {
                json["last_message"] = last_message["result"];
              }
            }
          }
          return {"ok": true, "result": json};
        } else if (type_chat == "private") {
          var getUser =
              await tg_client.requestSendApi("getUser", {"user_id": chat_id});
          if (RegExp("^user\$", caseSensitive: false)
              .hasMatch(getUser["@type"])) {
            var json = {};
            json["id"] = getUser["id"];
            try {
              if (RegExp("^userTypeBot\$", caseSensitive: false)
                  .hasMatch(getUser["type"]["@type"])) {
                json["is_bot"] = true;
              } else {
                json["is_bot"] = false;
              }
            } catch (e) {
              json["is_bot"] = false;
            }
            json["first_name"] = getUser["first_name"];
            if (getBoolean(getUser["last_name"])) {
              json["last_name"] = getUser["last_name"];
            }
            if (getBoolean(getUser["username"])) {
              json["username"] = getUser["username"];
            }
            if (getBoolean(getUser["phone_number"])) {
              json["phone_number"] = getUser["phone_number"];
            }
            if (getBoolean(getUser["language_code"])) {
              json["language_code"] = getUser["language_code"];
            }
            json["type"] = 'private';
            json["detail"] = {
              "has_protected_content":
                  getchat["has_protected_content"] ?? false,
              "is_marked_as_unread": getchat["is_marked_as_unread"] ?? false,
              "is_blocked": getchat["is_blocked"] ?? false,
              "has_scheduled_messages":
                  getchat["has_scheduled_messages"] ?? false,
              "can_be_deleted_only_for_self":
                  getchat["can_be_deleted_only_for_self"] ?? false,
              "can_be_deleted_for_all_users":
                  getchat["can_be_deleted_for_all_users"] ?? false,
              "can_be_reported": getchat["can_be_reported"] ?? false,
              "default_disable_notification":
                  getchat["default_disable_notification"] ?? false,
              "unread_count": getchat["unread_count"] ?? 0,
              "last_read_inbox_message_id":
                  getchat["last_read_inbox_message_id"] ?? 0,
              "last_read_outbox_message_id":
                  getchat["last_read_outbox_message_id"] ?? 0,
              "unread_mention_count": getchat["unread_mention_count"] ?? 0,
              "is_contact": getUser["is_contact"],
              "is_mutual_contact": getUser["is_mutual_contact"],
              "is_verified": getUser["is_verified"],
              "is_support": getUser["is_support"],
              "is_scam": getUser["is_scam"],
              "is_fake": getUser["is_fake"],
              "have_acces": getUser["have_access"]
            };
            if (is_detail) {
              if (typeof(getchat["last_message"]) == "object") {
                var last_message = await jsonMessage(getchat["last_message"],
                    from_data: json, chat_data: json);
                if (last_message["ok"]) {
                  json["last_message"] = last_message["result"];
                }
              }
            }
            return {"ok": true, "result": json};
          }
        }
      }

      return {
        "ok": false,
        "result": {"id": chat_id, "detail": {}}
      };
    } catch (e) {
      return {"ok": false, "error": e};
    }
  }

  getChatHistory(chat_id) async {
    try {
      var getchat = await getChat(chat_id);
      if (getchat["ok"]) {
        if (getchat["type"] != "private" && getchat["type"] != "channel") {
          try {
            await tg_client.requestSendApi("getSupergroupMembers", {
              "supergroup_id": int.parse(chat_id
                  .toString()
                  .replaceAll(RegExp("^-100", caseSensitive: false), "")),
              "limit": 200
            });
          } catch (e) {}
        }

        var getchathistory = await tg_client.requestSendApi("getChatHistory", {
          "chat_id": chat_id,
          "from_chat_id": getchat["result"]["detail"]
              ["last_read_inbox_message_id"],
          "offset": 0,
          "limit": 100
        });
        if (getchathistory["@type"] == "messages") {
          List array = [];
          for (var i = 0; i < getchathistory["messages"].length; i++) {
            var loop_data = getchathistory["messages"][i];
            var result = await jsonMessage(loop_data);
            if (result["ok"]) {
              array.add(result["result"]);
            }
          }
          return {
            "ok": true,
            "result": {
              "total_count": getchathistory["messages"].length,
              "messages": array,
            },
          };
        }
      }
      return {"ok": false};
    } catch (e) {
      return {"ok": false};
    }
  }

  jsonMessage(Map update, {Map? from_data, Map? chat_data}) async {
    try {
      if (update["@type"] == "message") {
        Map json = {};
        Map chat_json = {"id": update["chat_id"]};
        bool is_chat_not_same = true;
        if (chat_data != null) {
          if (update["chat_id"] == chat_data["id"]) {
            is_chat_not_same = false;
            chat_json = chat_data;
          }
        }
        if (is_chat_not_same) {
          var chatResult = await getChat(update["chat_id"]);
          if (chatResult["ok"]) {
            chat_json = chatResult["result"];
          }
        }

        json["is_outgoing"] = update["is_outgoing"] ?? false;
        json["is_pinned"] = update["is_pinned"] ?? false;
        if (typeof(update["sender_id"]) == "object") {
          if (update["sender_id"]["user_id"] != null) {
            if (update["chat_id"] == update["sender_id"]["user_id"]) {
              json["from"] = chat_json;
            } else {
              bool is_from_not_same = true;
              Map from_json = {"id": update["sender_id"]["user_id"]};
              if (from_data != null) {
                if (update["chat_id"] == from_data["id"]) {
                  is_from_not_same = false;
                  from_json = from_data;
                }
              }
              if (is_from_not_same) {
                var fromResult = await getChat(update["sender_id"]["user_id"]);
                if (fromResult["ok"]) {
                  from_json = fromResult["result"];
                }
              }
              json["from"] = from_json;
            }
          }

          if (update["sender_id"]["chat_id"] != null) {
            if (update["chat_id"] == update["sender_id"]["chat_id"]) {
              json["from"] = chat_json;
            } else {
              bool is_from_not_same = true;
              Map from_json = {"id": update["sender_id"]["chat_id"]};
              if (from_data != null) {
                if (update["chat_id"] == from_data["id"]) {
                  is_from_not_same = false;
                  from_json = from_data;
                }
              }
              if (is_from_not_same) {
                var fromResult = await getChat(update["sender_id"]["chat_id"]);
                if (fromResult["ok"]) {
                  from_json = fromResult["result"];
                }
              }
              json["from"] = from_json;
            }
          }
        }

        json["chat"] = chat_json;
        json["date"] = update["date"];
        json["message_id"] = update["id"];
        if (typeof(update["content"]) == "object") {
          List old_entities = [];

          if (update["content"]["@type"] == "messageText") {
            json["type_content"] = "text";
            if (typeof(update["content"]["text"]) == "object") {
              if (update["content"]["text"]["@type"] == "formattedText") {
                json["text"] = update["content"]["text"]["text"];
                old_entities = update["content"]["text"]["entities"];
              }
            }
          }

          if (update["content"]["@type"] == "messagePhoto") {
            json["type_content"] = "photo";
            if (typeof(update["content"]["photo"]) == "object") {
              if (update["content"]["photo"]["@type"] == "photo") {
                var size_photo = [];
                var photo = update["content"]["photo"]["sizes"];
                for (var i = 0; i < photo.length; i++) {
                  var photo_json = photo[i];
                  var json_photo = {};
                  if (photo_json["photo"]["remote"]["@type"] == "remoteFile") {
                    json_photo["file_id"] = photo_json["photo"]["remote"]["id"];
                  }
                  if (photo_json["photo"]["remote"]["unique_id"] != null) {
                    json_photo["file_unique_id"] =
                        photo_json["photo"]["remote"]["unique_id"];
                  }
                  json_photo["file_size"] = photo_json["photo"]["size"];
                  json_photo["width"] = photo_json["width"];
                  json_photo["height"] = photo_json["height"];
                  size_photo.add(json_photo);
                }
                json["photo"] = size_photo;
              }
            }
          }

          if (update["content"]["@type"] == "messageVideo") {
            json["type_content"] = "video";
            if (typeof(update["content"]["video"]) == "object") {
              if (update["content"]["video"]["@type"] == "video") {
                var json_video = {};
                var content_video = update["content"]["video"];
                json_video["duration"] = content_video["duration"];
                json_video["height"] = content_video["height"];
                json_video["file_name"] = content_video["file_name"];
                json_video["mime_type"] = content_video["mime_type"];
                try {
                  if (update["content"]["video"]["thumbnail"] != null &&
                      update["content"]["video"]["thumbnail"]["@type"]
                              .toString()
                              .toLowerCase() ==
                          "thumbnail") {
                    var content_thumb = content_video["thumbnail"];
                    var json_thumb = {};
                    json_video["thumb"] = json_thumb;
                    json_thumb["file_id"] =
                        content_thumb["file"]["remote"]["id"];
                    json_thumb["file_unique_id"] =
                        content_thumb["file"]["remote"]["unique_id"];
                    json_thumb["file_size"] = content_thumb["file"]["size"];
                    json_thumb["width"] = content_thumb["width"];
                    json_thumb["height"] = content_thumb["height"];
                  }
                } catch (e) {}
                json_video["file_id"] = content_video["video"]["remote"]["id"];
                json_video["file_size"] = content_video["video"]["size"];
                json["video"] = json_video;
              }
            }
          }

          if (update["content"]["@type"] == "messageAudio") {
            var type_content = "audio";
            json["type_content"] = "audio";
            if (typeof(update["content"]["audio"]) == "object") {
              if (update["content"]["audio"]["@type"] == "audio") {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["duration"] = content_update["duration"];
                json_content["title"] = content_update["title"];
                json_content["performer"] = content_update["performer"];
                json_content["file_name"] = content_update["file_name"];
                json_content["mime_type"] = content_update["mime_type"];
                json_content["file_id"] =
                    content_update[type_content]["remote"]["id"];
                json_content["unique_id"] =
                    content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] =
                    content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageAnimation") {
            var type_content = "animation";
            json["type_content"] = "animation";
            if (typeof(update["content"]["animation"]) == "object") {
              if (update["content"]["animation"]["@type"] == "animation") {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["duration"] = content_update["duration"];
                json_content["width"] = content_update["width"];
                json_content["height"] = content_update["height"];
                json_content["file_name"] = content_update["file_name"];
                json_content["mime_type"] = content_update["mime_type"];
                json_content["mime_type"] = content_update["mime_type"];
                json_content["has_stickers"] = content_update["has_stickers"];

                try {
                  if (update["content"][type_content]["thumbnail"] != null &&
                      update["content"][type_content]["thumbnail"]["@type"]
                              .toString()
                              .toLowerCase() ==
                          "thumbnail") {
                    var content_thumb = content_update["thumbnail"];
                    var json_thumb = {};
                    json_thumb["file_id"] =
                        content_thumb["file"]["remote"]["id"];
                    json_thumb["file_unique_id"] =
                        content_thumb["file"]["remote"]["unique_id"];
                    json_thumb["file_size"] = content_thumb["file"]["size"];
                    json_thumb["width"] = content_thumb["width"];
                    json_thumb["height"] = content_thumb["height"];
                    json_content["thumb"] = json_thumb;
                  }
                } catch (e) {}
                json_content["file_id"] =
                    content_update[type_content]["remote"]["id"];
                json_content["unique_id"] =
                    content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] =
                    content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageContact") {
            var type_content = "contact";
            json["type_content"] = type_content;
            if (typeof(update["content"][type_content]) == "object") {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["phone_number"] = content_update["phone_number"];
                json_content["first_name"] = content_update["first_name"];
                json_content["last_name"] = content_update["last_name"];
                json_content["vcard"] = content_update["vcard"];
                json_content["user_id"] = content_update["user_id"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messagePoll") {
            var type_content = "poll";
            json["type_content"] = type_content;
            if (typeof(update["content"][type_content]) == "object") {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["id"] = content_update["id"];
                json_content["question"] = content_update["question"];
                json_content["options"] = content_update["options"];
                json_content["total_voter_count"] =
                    content_update["total_voter_count"];
                json_content["recent_voter_user_ids"] =
                    content_update["recent_voter_user_ids"];
                json_content["is_anonymous"] = content_update["is_anonymous"];
                json_content["type"] = content_update["type"];
                json_content["open_period"] = content_update["open_period"];
                json_content["close_date"] = content_update["close_date"];
                json_content["is_closed"] = content_update["is_closed"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageDocument") {
            var type_content = "document";
            json["type_content"] = type_content;
            if (typeof(update["content"][type_content]) == "object") {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["file_name"] = content_update["file_name"];
                json_content["mime_type"] = content_update["mime_type"];

                json_content["file_id"] =
                    content_update[type_content]["remote"]["id"];
                json_content["unique_id"] =
                    content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] =
                    content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageSticker") {
            var type_content = "sticker";
            json["type_content"] = type_content;
            if (typeof(update["content"][type_content]) == "object") {
              if (update["content"][type_content]["@type"] == type_content) {
                var json_content = {};
                var content_update = update["content"][type_content];
                json_content["set_id"] = content_update["set_id"];
                json_content["width"] = content_update["width"];
                json_content["height"] = content_update["height"];
                json_content["emoji"] = content_update["emoji"];
                json_content["is_animated"] = content_update["is_animated"];
                json_content["is_mask"] = content_update["is_mask"];

                try {
                  if (update["content"][type_content]["thumbnail"] != null &&
                      update["content"][type_content]["thumbnail"]["@type"]
                              .toString()
                              .toLowerCase() ==
                          "thumbnail") {
                    var content_thumb = content_update["thumbnail"];
                    var json_thumb = {};
                    json_thumb["file_id"] =
                        content_thumb["file"]["remote"]["id"];
                    json_thumb["file_unique_id"] =
                        content_thumb["file"]["remote"]["unique_id"];
                    json_thumb["file_size"] = content_thumb["file"]["size"];
                    json_thumb["width"] = content_thumb["width"];
                    json_thumb["height"] = content_thumb["height"];
                    json_content["thumb"] = json_thumb;
                  }
                } catch (e) {}

                json_content["file_id"] =
                    content_update[type_content]["remote"]["id"];
                json_content["unique_id"] =
                    content_update[type_content]["remote"]["unique_id"];
                json_content["file_size"] =
                    content_update[type_content]["size"];
                json[type_content] = json_content;
              }
            }
          }

          if (update["content"]["@type"] == "messageVoiceNote") {
            var type_content = "voice_note";
            json["type_content"] = type_content;
            if (typeof(update["content"][type_content]) == "object") {
              if (update["content"][type_content]["@type"] == "voiceNote") {
                var json_content = {};
                var content_update = update["content"][type_content];

                json_content["duration"] = content_update["duration"];
                json_content["waveform"] = content_update["waveform"];
                json_content["mime_type"] = content_update["mime_type"];

                json_content["file_id"] =
                    content_update["voice"]["remote"]["id"];
                json_content["unique_id"] =
                    content_update["voice"]["remote"]["unique_id"];
                json_content["file_size"] = content_update["voice"]["size"];
                json[type_content] = json_content;
              }
            }
          }

          // caption
          if (typeof(update["content"]["caption"]) == "object") {
            if (update["content"]["caption"]["@type"] == "formattedText") {
              if (update["content"]["caption"]["text"].toString().isNotEmpty) {
                json["caption"] = update["content"]["caption"]["text"];
              }
              old_entities = update["content"]["caption"]["entities"];
            }
          }

          List new_entities = [];
          for (var i = 0; i < old_entities.length; i++) {
            var data_entities = old_entities[i];
            try {
              var json_entities = {};
              json_entities["offset"] = data_entities["offset"];
              json_entities["length"] = data_entities.length;
              if (data_entities["type"]["@type"] != null) {
                var type_entities = data_entities["type"]["@type"]
                    .toString()
                    .toLowerCase()
                    .replaceAll(
                        RegExp("textEntityType", caseSensitive: false), "")
                    .replaceAll(
                        RegExp("textUrl", caseSensitive: false), "text_link")
                    .replaceAll(RegExp("bot_command", caseSensitive: false),
                        "bot_command")
                    .replaceAll(RegExp("mentionname", caseSensitive: false),
                        "text_mention");
                json_entities["type"] = type_entities;
                if (data_entities["type"]["url"] != null) {
                  json_entities["url"] = data_entities["type"]["url"];
                }
                if (type_entities == "text_mention" &&
                    data_entities["type"]["user_id"] != null) {
                  var entitiesUserId = data_entities["type"]["user_id"];
                  var fromJson = {"id": entitiesUserId};
                  try {
                    var fromResult =
                        await getChat(update["sender_id"]["user_id"]);
                    if (fromResult["ok"]) {
                      fromJson = fromResult["result"];
                    }
                  } catch (e) {}
                  json_entities["user"] = fromJson;
                }
              }
              new_entities.add(json_entities);
            } catch (e) {}
          }
          json["entities"] = new_entities;
        }
        return {"ok": true, "result": json};
      }
    } catch (e) {
      return {"ok": false};
    }
    return {"ok": false};
  }

  getUser(dynamic user_id) async {
    var getUser =
        await tg_client.requestSendApi("getUser", {"user_id": user_id});
    if (RegExp("^user\$", caseSensitive: false).hasMatch(getUser["@type"])) {
      var json = {};
      json["id"] = getUser["id"];
      try {
        if (RegExp("^userTypeBot\$", caseSensitive: false)
            .hasMatch(getUser["type"]["@type"])) {
          json["is_bot"] = true;
        } else {
          json["is_bot"] = false;
        }
      } catch (e) {
        json["is_bot"] = false;
      }
      json["first_name"] = getUser["first_name"];
      if (getBoolean(getUser["last_name"])) {
        json["last_name"] = getUser["last_name"];
      }
      if (getBoolean(getUser["username"])) {
        json["username"] = getUser["username"];
      }
      if (getBoolean(getUser["phone_number"])) {
        json["phone_number"] = getUser["phone_number"];
      }
      if (getBoolean(getUser["language_code"])) {
        json["language_code"] = getUser["language_code"];
      }
      json["detail"] = {
        "is_contact": getUser["is_contact"],
        "is_mutual_contact": getUser["is_mutual_contact"],
        "is_verified": getUser["is_verified"],
        "is_support": getUser["is_support"],
        "is_scam": getUser["is_scam"],
        "is_fake": getUser["is_fake"],
        "have_acces": getUser["have_access"]
      };
      return json;
    }
  }
}

class JSON {
  static String stringify(value, replace, int space) {
    var spaceText = "";
    for (var i = 0; i < space; i++) {
      spaceText += " ";
    }
    try {
      JsonEncoder encoder = JsonEncoder.withIndent(spaceText);
      return encoder.convert(value);
    } catch (e) {
      print(e);
      try {
        return json.encode(value);
      } catch (e) {
        return "error";
      }
    }
  }
}

