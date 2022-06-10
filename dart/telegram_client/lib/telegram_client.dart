library telegram_client;

import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:hexaminate/hexaminate.dart';
import 'dart:isolate';
export 'tdlib/tdlib.dart' if (dart.library.html) 'tdlib/tdlib_web.dart';
part 'mtproto/mtproto.dart';
part 'telegram_bot_api/telegram_bot_api.dart';
