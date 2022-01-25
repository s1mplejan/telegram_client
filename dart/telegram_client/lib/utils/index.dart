part of telegram_client;

String typeData(data) {
  return data.runtimeType
      .toString()
      .toLowerCase()
      .replaceAll(RegExp(r"<.*"), "")
      .replaceAll(RegExp(r"_internallinkedhashmap"), "object")
      .replaceAll(RegExp(r"_"), "")
      .replaceAll(RegExp("^list\$",caseSensitive: false), "object")
      .replaceAll(RegExp("^int\$",caseSensitive: false), "number")
      .replaceAll(RegExp("^bool\$",caseSensitive: false), "boolean");
}
