import 'package:flutter/material.dart';
import 'package:telegram_client/telegram_client.dart';
import 'package:file_picker/file_picker.dart';

var tg = Telegram("5141871612:AAGKvhsIdiKkCDOQ7bjIOhZ3-F1BWtnuYfk").api;
void main() {
  return runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late TextEditingController chat_id = TextEditingController();
  late TextEditingController text = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: chat_id,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxHeight: 35, maxWidth: 100),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "chat id",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxHeight: 35, maxWidth: 100),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "text",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      var file = result.files.single;
                      try {
                        var send = await tg.request("getFile", {
                          "file_id":
                              "BQACAgUAAxkDAAIEkWIOfR6BNKBxD81zboiQZUcSj1b4AAJDBAAC9i55VGlDO00jEpSLIwQ"
                        });
                        print(send["result"]["file_url"]);
                      } catch (e) {}
                    }
                  },
                  child: const Center(
                    child: Text("send"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
