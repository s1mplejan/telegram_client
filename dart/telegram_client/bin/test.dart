import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';

typedef VoidCallback = void Function(dynamic update, dynamic azka);

azka({VoidCallback? onUpdate}) {
  if (onUpdate != null) {
    onUpdate("sa", "Sa");
  }
}

void main() async {
  var url = "http://0.0.0.0:8080/";
  azka();

  var response = await post(Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
      body: json.encode({"azka": "baru"}));
  print(response.body);
}
