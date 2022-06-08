library telegram_client;
import 'dart:io';
import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:math';
import 'dart:isolate';
import 'dart:convert' as convert;

import 'package:ffi/ffi.dart' as pkgffi;
import 'package:http/http.dart';
import 'package:hexaminate/hexaminate.dart';

part 'mtproto/mtproto.dart';
part 'tdlib/tdlib.dart';
part 'telegram_bot_api/telegram_bot_api.dart';