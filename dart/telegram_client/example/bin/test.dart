import 'dart:convert';
import 'package:hive/hive.dart';

void main(List<String> args) async {
  Hive.init("./");
  var secret = utf8.encode('azkadev my application secure :V');
  var box = await Hive.openBox("name", encryptionCipher: HiveAesCipher(secret), crashRecovery: false);
  var azka = box.get("list");
  if (azka is List) {
    print(azka.length);
  } else {
    print("else");
  }
  var count = 0;
  while (true) {
    await Future.delayed(const Duration(microseconds: 1));
    var getList = box.get("list", defaultValue: []);
    count++;
    if (getList is List) {
      getList.add({"id": count, "first_name": "azka", "last_name": "gev", "detail": {}});
      await box.put("list", getList);
    } else {
      await box.put("list", []);
    }
    print(count);
  }
}
