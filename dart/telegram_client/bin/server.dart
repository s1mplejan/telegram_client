import 'dart:io';
import 'package:hexaminate/hexaminate.dart';

void main() {
  var api = Server();
  print("/azkasa:token/aza::token/sasasas");
  api.on("/", (RequestApi req, ResponseApi res) async {
    Process.runSync("node", ["/home/azkadev/Desktop/test/index.js"],
        environment: {"text": req.query["text"] ?? "native"});

    print(req.method);
    if (req.method == "post") {
      var body = await req.body;
      print(body);
    }
    return res.send("root ");
  });

  api.on("/azka", (RequestApi req, ResponseApi res) async {
    print(req.query);
    return res.send("azka");
  });

  api.listen(callback: (HttpServer server) {
    print('Listening on http://${server.address.address}:${server.port}/');
  });
}
