// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:hive/hive.dart';

class app_detail {
  static String name = "";
  static String name_id = "azkagram";
}

void main(List<String> args) async {
  Hive.init("./db/");
  Box box = await Hive.openBox(
    "0",
  );
  box.put(("azka"), "asas");
  var count = 0;
  print(box.toMap()["azka"]);
}
