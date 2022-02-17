import 'package:switchscript/switchscript.dart';
import 'package:telegram_client/telegram_client.dart';

var data;
void main() {
  data = {"babu": "soaks", "azka": "juga"};
  var json_data = {"azka": "oke", "anjay": "iya"};
  json_data.addAll(data);
  print(json_data);
}
