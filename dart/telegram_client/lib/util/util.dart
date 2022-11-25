part of telegram_client;

/// telegram util
class TgUtils {
  /// telegram utils
  TgUtils();

  /// ccreate offset for tl
  static List<int> createOffset(
      {required int totalCount, required int limitCount}) {
    late int offset = 0;
    late List<int> listOffset = [0];
    for (var i = 0; i < (totalCount ~/ limitCount).toInt(); i++) {
      for (var ii = 0; ii <= limitCount; ii++) {
        if (ii == limitCount) {
          offset = (offset + limitCount);
        }
      }
      listOffset.add(offset);
    }
    return listOffset;
  }

  static bool getBoolean(dynamic data) {
    if (data == null) {
      return false;
    }
    if (data is String) {
      if (data.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else if (data is Map) {
      if (data.isEmpty) {
        return true;
      } else {
        return false;
      }
    } else if (data is List) {
      if (data.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else if (data is int) {
      if (data < 0) {
        return true;
      } else if (data.isOdd) {
        return true;
      } else {
        return false;
      }
    }
    if (data is bool) {
      return data;
    } else {
      return false;
    }
  }
}

class Buffer {
  static String base64 = "base64";
  static String utf8 = "utf8";
  static Encode from(String data, [String type = "utf8"]) {
    return Encode(data, type);
  }
}

class Encode {
  String text;
  String type;
  Encode(this.text, this.type);

  String toStringEncode(String typeEncode) {
    if (RegExp(r"^utf8$", caseSensitive: false).hasMatch(type)) {
      if (RegExp(r"^base64$", caseSensitive: false).hasMatch(typeEncode)) {
        return base64.encode(utf8.encode(text));
      }
    }
    if (RegExp(r"^base64$", caseSensitive: false).hasMatch(type)) {
      if (RegExp(r"^utf8$", caseSensitive: false).hasMatch(typeEncode)) {
        return utf8.decode(base64.decode(text));
      }
    }
    return text;
  }
}
