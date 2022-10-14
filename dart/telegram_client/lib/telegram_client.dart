library telegram_client;

import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:hexaminate/hexaminate.dart';
import 'package:universal_io/io.dart';

export 'tdlib/tdlib.dart' if (dart.library.html) 'tdlib/tdlib_web.dart';
export 'telegram_bot_api_server/telegram_bot_api_server.dart';

part "scheme/tdlib.dart";
part 'telegram_bot_api/telegram_bot_api.dart';
part 'util/util.dart';
