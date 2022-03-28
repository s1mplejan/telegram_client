// ignore_for_file: non_constant_identifier_names

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
  var updateText = "";
  var stateData = {
    "page": "signup",
    "type": "phone",
    "type_account": "user",
    "state": {},
    "temp": {"phone_number": "", "code": ""}
  };
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    widget.tg.on("update", (UpdateTd update) async {
      if (isLogin) {
        setState(() {
          updateText = json.encode(update.raw);
        });
      }
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
            });
          }
        }
      }
      if (update.message.is_found) {
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
            widget.tg.requestSendApi("sendMessage", {
              "chat_id": update.message.chat.id,
              "text": json.encode(update.raw)
            });
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
      return [
        Text("update"),
        Text(updateText),
      ];
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: LayoutBuilder(
            builder: (contex, constraints) {
              if (stateData["page"] == "signin") {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: signInWidget(),
                );
              }
              if (stateData["page"] == "signup") {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: signUpWidget(),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: signUpWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}
