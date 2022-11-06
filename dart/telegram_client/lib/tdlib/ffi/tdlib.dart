// ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_type_check, void_checks, unnecessary_brace_in_string_interps

// ignore: slash_for_doc_comments
/**
Licensed under the MIT License <http://opensource.org/licenses/MIT>.
SPDX-License-Identifier: MIT
Copyright (c) 2021 Azkadev Telegram Client <http://github.com/azkadev/telegram_client>.
Permission is hereby  granted, free of charge, to any  person obtaining a copy
of this software and associated  documentation files (the "Software"), to deal
in the Software  without restriction, including without  limitation the rights
to  use, copy,  modify, merge,  publish, distribute,  sublicense, and/or  sell
copies  of  the Software,  and  to  permit persons  to  whom  the Software  is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE  IS PROVIDED "AS  IS", WITHOUT WARRANTY  OF ANY KIND,  EXPRESS OR
IMPLIED,  INCLUDING BUT  NOT  LIMITED TO  THE  WARRANTIES OF  MERCHANTABILITY,
FITNESS FOR  A PARTICULAR PURPOSE AND  NONINFRINGEMENT. IN NO EVENT  SHALL THE
AUTHORS  OR COPYRIGHT  HOLDERS  BE  LIABLE FOR  ANY  CLAIM,  DAMAGES OR  OTHER
LIABILITY, WHETHER IN AN ACTION OF  CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE  OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 
**/

import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:convert' as convert;
import 'package:universal_io/io.dart';
import 'package:ffi/ffi.dart' as pkgffi;

/// Cheatset
///
/// ```dart
/// Tdlib tg = Tdlib("libtdjson.so", {
///   "api_id": 121315,
///   "api_hash": "saskaspasad"
/// });
/// tg.on("update", (UpdateTd update) async {
///   print(update.raw);
/// });
/// tg.initIsolate();
/// ````
///
class LibTdJson {
  final String pathTdl;
  late bool is_android = Platform.isAndroid;
  LibTdJson(this.pathTdl);
  Future<void> init() async {
    return;
  }

  DynamicLibrary get tdLib {
    if (Platform.isIOS || Platform.isMacOS) {
      return DynamicLibrary.process();
    } else {
      return DynamicLibrary.open(pathTdl);
    }
  }

  /// create client id for multi client
  int client_create() {
    return tdLib.lookupFunction<ffi.Pointer Function(), ffi.Pointer Function()>('${is_android ? "_" : ""}td_json_client_create').call().address;
  }

  /// client_send
  void client_send(int clientId, [Map? parameters]) {
    return tdLib.lookupFunction<ffi.Void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>), void Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>('${is_android ? "_" : ""}td_json_client_send').call(ffi.Pointer.fromAddress(clientId), convert.json.encode(parameters).toNativeUtf8());
  }

  /// client_execute
  Map<String, dynamic> client_execute(int clientId, [Map? parameters]) {
    return convert.json.decode(tdLib.lookupFunction<ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>), ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>('${is_android ? "_" : ""}td_json_client_execute').call(ffi.Pointer.fromAddress(clientId), convert.json.encode(parameters).toNativeUtf8()).toDartString());
  }

  /// client_destroy
  void client_destroy(int clientId) {
    return tdLib.lookupFunction<ffi.Void Function(ffi.Pointer), void Function(ffi.Pointer)>('${is_android ? "_" : ""}td_json_client_destroy').call(ffi.Pointer.fromAddress(clientId));
  }

  /// fetch update
  Map<String, dynamic>? client_receive(int clientId, [double timeout = 1.0]) {
    try {
      Pointer<pkgffi.Utf8> update = tdLib.lookupFunction<ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Double), ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, double)>('${is_android ? "_" : ""}td_json_client_receive').call(ffi.Pointer.fromAddress(clientId), timeout);
      if (update.address != 0 && update.toDartString() is String && update.toDartString().toString().isNotEmpty) {
        Map<String, dynamic>? updateOrigin;
        try {
          updateOrigin = convert.json.decode(update.toDartString());
        } catch (e) {}
        if (updateOrigin != null) {
          return updateOrigin;
        }
      }
    } catch (e) {}
    return null;
  }
}
