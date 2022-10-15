import 'package:telegram_client/scheme/tdlib_scheme.dart' as tdlib_scheme;

void main() {
  try {
    var res = tdlib_scheme.TdlibFunction.sendMessage(chat_id: 1);
    print(res.toString());
  } catch (e) {
    print(e);
  }
}
