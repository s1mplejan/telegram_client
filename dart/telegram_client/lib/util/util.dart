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
}
