import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:telegram_client/telegram_client.dart';

Future<String> getPath() async {
  if (Platform.isAndroid || Platform.isIOS) {
    var getDir = await getApplicationDocumentsDirectory();
    return getDir.path.toString();
  } else {
    var getDir = await getApplicationSupportDirectory();
    return getDir.path.toString();
  }
}

String get getPathTdlib {
  return "libtdjson.so";
}

Future<Tdlib> tdl([String? clientId = "azkadev"]) async {
  var getDir = await getPath();
  Map<String, dynamic> option = {
    'api_id': 0,
    'api_hash': '',
    'database_directory': "$getDir/${clientId.toString().toLowerCase()}",
    'files_directory': "$getDir/${clientId.toString().toLowerCase()}"
  };
  return Tdlib(getPathTdlib, option);
}
