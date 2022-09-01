import 'package:universal_io/io.dart';

/// telegram bot api server
class TelegramBotApiServer {
  /// if you want bot server local use this
  TelegramBotApiServer();

  /// make parameters easy
  List<String> optionsParameters({
    String? local,
    required String? apiid,
    required String? apihash,
    String? httpport,
    String? httpstatport,
    String? dir,
    String? tempdir,
    String? filter,
    String? maxwebhookconnections,
    String? httpipaddress,
    String? httpstatipaddress,
    String? log,
    String? verbosity,
    String? memoryverbosity,
    String? logmaxfilesize,
    String? username,
    String? groupname,
    String? maxconnections,
    String? proxy,
  }) {
    late Map data = {
      "--local": local,
      "--api-id": apiid,
      "--api-hash": apihash,
      "--http-port": httpport,
      "--http-stat-port": httpstatport,
      "--dir": dir,
      "--temp-dir": tempdir,
      "--filter": filter,
      "--max-webhook-connections": maxwebhookconnections,
      "--http-ip-address": httpipaddress,
      "--http-stat-ip-address": httpstatipaddress,
      "--log": log,
      "--verbosity": verbosity,
      "--memory-verbosity": memoryverbosity,
      "--log-max-file-size": logmaxfilesize,
      "--username": username,
      "--groupname": groupname,
      "--max-connections": maxconnections,
      "--proxy": proxy,
    };
    late List<String> arguments = [];
    String tgOption = "";
    data.forEach((key, value) {
      if (key == "--local") {
        //  arguments.add("$key");
      } else if (value != null) {
        arguments.add("$key=$value");
      }
    });
    return arguments;
  }

  /// run executable telegram bot api
  Future<Process> run({
    required String executable,
    required List<String> arguments,
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = true,
    ProcessStartMode mode = ProcessStartMode.normal,
  }) async {
    return await Process.start(
      executable,
      arguments,
      environment: environment,
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
      workingDirectory: workingDirectory,
      mode: mode,
    );
  }
}
