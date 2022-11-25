library telegram_client;

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:telegram_client/telegram_client.dart';
import 'package:universal_io/io.dart';
export 'tdlib/ffi/tdlib.dart' if (dart.library.html) 'tdlib/ffi/tdlib_web.dart';
export 'tdlib/tdlib.dart';
export 'telegram_bot_api_server/telegram_bot_api_server.dart';
import 'telegram_bot_api/extension/telegram_bot_api.dart'
    if (dart.library.html) 'telegram_bot_api/extension/telegram_bot_api_web.dart';

part "extensions/tdlib.dart";
part "extensions/telegram_bot_api.dart";
part 'telegram_bot_api/telegram_bot_api.dart';
part 'util/util.dart';
