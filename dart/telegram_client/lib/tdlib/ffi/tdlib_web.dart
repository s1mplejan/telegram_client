// ignore_for_file: non_constant_identifier_names, empty_catches, unnecessary_type_check, void_checks, unnecessary_brace_in_string_interps, prefer_final_fields, subtype_of_sealed_class

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

import 'dart:convert' as convert;
import 'dart:convert';
import 'package:web_ffi/web_ffi.dart';
import 'package:web_ffi/web_ffi.dart' as ffi;
import 'package:web_ffi/web_ffi_modules.dart';
// and additionally

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
  // final String pathTdl;
  late final String path_tdlib;
  final bool is_android = false;
  late bool _is_init_tdlib = false;
  late Module _module;
  LibTdJson({
    String? pathTdl,
  }) {
    pathTdl ??= "libtdjson.${getFormatLibrary}";
    path_tdlib = pathTdl;
  }
  String get getFormatLibrary {
    return "websm";
  }

  Future<void> init() async {
    if (!_is_init_tdlib) {
      Memory.init();
      _module = await EmscriptenModule.process(path_tdlib);
      _is_init_tdlib = true;
    }
  }

  DynamicLibrary get tdLib {
    if (!_is_init_tdlib) {
      while (true) {
        if (_is_init_tdlib) {
          break;
        } else {
          init();
        }
      }
    }
    return DynamicLibrary.fromModule(_module);
  }

  /// create client id for multi client
  int client_create() {
    return tdLib
        .lookupFunction<ffi.Pointer Function(), ffi.Pointer Function()>(
            '${is_android ? "_" : ""}td_json_client_create')
        .call()
        .address;
  }

  /// client_send
  void client_send(int clientId, [Map? parameters]) {
    // return tdLib.lookupFunction<ffi.Void Function(ffi.Pointer, ffi.Pointer<Uint8>), void Function(ffi.Pointer, ffi.Pointer<Uint8>)>('${is_android ? "_" : ""}td_json_client_send').call(
    //       ffi.Pointer.fromAddress(clientId),
    //       convert.json.encode(parameters).toNativeUtf8(),
    //     );
  }

  /// client_execute
  Map<String, dynamic> client_execute(int clientId, [Map? parameters]) {
    return convert.json.decode(
      tdLib
          .lookupFunction<
                  ffi.Pointer<Utf8s> Function(ffi.Pointer, ffi.Pointer<Utf8s>),
                  ffi.Pointer<Utf8s> Function(ffi.Pointer, ffi.Pointer<Utf8s>)>(
              '${is_android ? "_" : ""}td_json_client_execute')
          .call(
            ffi.Pointer.fromAddress(clientId),
            convert.json.encode(parameters).toNativeUtf8(),
          )
          .toDartString(),
    );
  }

  /// client_destroy
  void client_destroy(int clientId) {
    return tdLib
        .lookupFunction<
            ffi.Void Function(ffi.Pointer),
            void Function(
                ffi.Pointer)>('${is_android ? "_" : ""}td_json_client_destroy')
        .call(ffi.Pointer.fromAddress(clientId));
  }

  /// fetch update
  Map<String, dynamic>? client_receive(int clientId, [double timeout = 1.0]) {
    // try {
    //   var update = tdLib.lookupFunction<ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Double), ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, double)>('${is_android ? "_" : ""}td_json_client_receive').call(ffi.Pointer.fromAddress(clientId), timeout);
    //   if (update.address != 0 && update.toDartString() is String && update.toDartString().toString().isNotEmpty) {
    //     Map<String, dynamic>? updateOrigin;
    //     try {
    //       updateOrigin = convert.json.decode(update.toDartString());
    //     } catch (e) {}
    //     if (updateOrigin != null) {
    //       return updateOrigin;
    //     }
    //   }
    // } catch (e) {}
    return null;
  }
}

class Utf8s extends ffi.Opaque {}

/// Extension method for converting a`Pointer<Utf8>` to a [String].
extension Utf8Pointers on Pointer<Utf8s> {
  /// The number of UTF-8 code units in this zero-terminated UTF-8 string.
  ///
  /// The UTF-8 code units of the strings are the non-zero code units up to the
  /// first zero code unit.
  int get length {
    _ensureNotNullptr('length');
    final codeUnits = cast<Uint8>();
    return _length(codeUnits);
  }

  /// Converts this UTF-8 encoded string to a Dart string.
  ///
  /// Decodes the UTF-8 code units of this zero-terminated byte array as
  /// Unicode code points and creates a Dart string containing those code
  /// points.
  ///
  /// If [length] is provided, zero-termination is ignored and the result can
  /// contain NUL characters.
  ///
  /// If [length] is not provided, the returned string is the string up til
  /// but not including  the first NUL character.
  String toDartString({int? length}) {
    _ensureNotNullptr('toDartString');
    final codeUnits = cast<Uint8>();
    if (length != null) {
      RangeError.checkNotNegative(length, 'length');
    } else {
      length = _length(codeUnits);
    }
    return utf8.decode(codeUnits.asTypedList(length));
  }

  static int _length(Pointer<Uint8> codeUnits) {
    var length = 0;
    while (codeUnits[length] != 0) {
      length++;
    }
    return length;
  }

  void _ensureNotNullptr(String operation) {
    if (this == nullptr) {
      throw UnsupportedError(
          "Operation '$operation' not allowed on a 'nullptr'.");
    }
  }
}

/// Extension method for converting a [String] to a `Pointer<Utf8>`.
extension StringUtf8Pointer on String {
  /// Creates a zero-terminated [Utf8] code-unit array from this String.
  ///
  /// If this [String] contains NUL characters, converting it back to a string
  /// using [Utf8Pointer.toDartString] will truncate the result if a length is
  /// not passed.
  ///
  /// Unpaired surrogate code points in this [String] will be encoded as
  /// replacement characters (U+FFFD, encoded as the bytes 0xEF 0xBF 0xBD) in
  /// the UTF-8 encoded result. See [Utf8Encoder] for details on encoding.
  ///
  /// Returns an [allocator]-allocated pointer to the result.
  Pointer<Utf8s> toNativeUtf8(
      // {
      // ffi.Allocator allocator = malloc,
      // }
      ) {
    // final units = utf8.encode(this);
    // final Pointer<Uint8> result = allocator<Uint8>(units.length + 1);
    // final Uint8List nativeString = result.asTypedList(units.length + 1);
    // nativeString.setAll(0, units);
    // nativeString[units.length] = 0;
    // return result.cast();
    return Pointer.fromAddress(12);
  }
}
