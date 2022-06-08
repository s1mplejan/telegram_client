// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:easy_isolate/easy_isolate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';

String path = Directory.current.path;

class app_detail {
  static String name = "";
  static String name_id = "azkagram";
}

void main(List<String> args) async {
  await Hive.initFlutter();
  Box box = await Hive.openBox(app_detail.name_id);

  final worker = Worker();
  await worker.init(mainHandler, isolateHandler, exitHandler: (data) {
    if (kDebugMode) {
      print(data);
    }
  });
  worker.sendMessage("run");
  var is_sign = box.get("is_sign", defaultValue: false);
  Widget widget_home = SignPage(
    box: box,
  );
  if (is_sign) {
    widget_home = MainPage(box: box);
  }
  runApp(MaterialApp(
    home: widget_home,
  ));
}

void mainHandler(dynamic data, SendPort isolateSendPort) {
  if (kDebugMode) {
    print("Main: $data");
  }
}

void isolateHandler(dynamic data, SendPort mainSendPort, SendErrorFunction onSendError) {}

class SignPage extends StatefulWidget {
  late Box box;
  SignPage({Key? key, required this.box}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController phone_number = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController token_bot = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      phone_number = widget.box.get("phone_number_sign_state", defaultValue: "");
      code = widget.box.get("code_sign_state", defaultValue: "");
      token_bot = widget.box.get("token_bot_sign_state", defaultValue: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(app_detail.name_id).listenable(),
      builder: (BuildContext context, Box box, Widget? widget) {
        getValue(String key, {dynamic defaultValue}) {
          return box.get(key, defaultValue: defaultValue);
        }

        setValue(String key, dynamic value) async {
          return await box.put(key, value);
        }

        var count = getValue("count", defaultValue: 0);
        var type_page = getValue("type_page", defaultValue: "signin");
        var sub_type_page = getValue("sub_type_page", defaultValue: "user");
        PreferredSizeWidget? appBar() {
          return null;
        }

        return Scaffold(
          appBar: appBar(),
          body: Builder(builder: (context) {
            Widget formField({double paddingVertical = 10, double paddingHorizontal = 10, String labelText = '', String hintText = '', IconData iconLeading = Iconsax.key, TextEditingController? controller, bool readOnly = false}) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: controller,
                  readOnly: readOnly,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    labelText: labelText,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      iconLeading,
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
              );
            }

            Widget formButton({double paddingVertical = 10, double paddingHorizontal = 10, bool is_load = false, required void Function() onPressed, double minWidth = double.infinity, double? height, String title = ""}) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
                child: MaterialButton(
                  minWidth: minWidth,
                  height: height,
                  onPressed: onPressed,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: chooseWidget(
                    main_widget: Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    second_widget: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    ),
                    is_main: !is_load,
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'SIGN-UP',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.grey.shade900),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                formField(iconLeading: Iconsax.simcard, labelText: "Phone Number", hintText: "62xxxx"),
                formField(iconLeading: Iconsax.simcard, labelText: "Code", hintText: "12345678"),
                const SizedBox(
                  height: 100,
                ),
                formButton(
                  onPressed: () {
                    print("azka");
                  },
                  is_load: false,
                  title: "azka",
                ),
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
                setValue("count", count);
              });
            },
            child: const Icon(Icons.abc),
          ),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required Box box}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(app_detail.name_id).listenable(),
      builder: (BuildContext context, Box box, Widget? widget) {
        getValue(String key, {dynamic defaultValue}) {
          return box.get(key, defaultValue: defaultValue);
        }

        setValue(String key, dynamic value) async {
          return await box.put(key, value);
        }

        var count = getValue("count", defaultValue: 0);

        return Scaffold(
          body: Builder(builder: (context) {
            return Center(
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Iconsax.key,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
                setValue("count", count);
              });
            },
            child: const Icon(Icons.abc),
          ),
        );
      },
    );
  }
}

Widget chooseWidget({bool is_main = true, required Widget main_widget, required Widget second_widget}) {
  if (!is_main) {
    return second_widget;
  }
  return main_widget;
}
