import 'package:telegram_client/telegram_client.dart';

void main() async {
  Mtproto tg = Mtproto();
  tg.connect();
  tg.on("update", (data) {
    print(data);
  });
}
