import 'package:telegram_client/telegram_client.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) {
  TelegramBotApi tg = TelegramBotApi("5472068078:AAGgSFT_W4WpfkgzdVoqRvwYg2veV3tN_wA");

  tg.requestForm("sendDocument", parameters: {
    "chat_id": 5427178641,
    "document": tg.buffer(File("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/dart/telegram_client/lib/tdlib/tdlib.dart").readAsBytesSync(), name: "tdlib.dart")
  });
}
