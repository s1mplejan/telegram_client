// ignore_for_file: non_constant_identifier_names

import 'package:universal_io/io.dart';

/// telegram bot api server
class TelegramBotApiServer {
  /// if you want bot server local use this
  TelegramBotApiServer();

  /// make parameters easy
  List<String> optionsParameters({
    String? local,
    required String api_id,
    required String api_hash,
    String? http_port,
    String? http_stat_port,
    String? dir,
    String? temp_dir,
    String? filter,
    String? max_webhook_connections,
    String? http_ip_address,
    String? http_stat_ip_address,
    String? log,
    String? verbosity,
    String? memory_verbosity,
    String? log_max_file_size,
    String? username,
    String? groupname,
    String? max_connections,
    String? proxy,
  }) {
    Map data = {
      "--local": local,
      "--api-id": api_id,
      "--api-hash": api_hash,
      "--http-port": http_port,
      "--http-stat-port": http_stat_port,
      "--dir": dir,
      "--temp-dir": temp_dir,
      "--filter": filter,
      "--max-webhook-connections": max_webhook_connections,
      "--http-ip-address": http_ip_address,
      "--http-stat-ip-address": http_stat_ip_address,
      "--log": log,
      "--verbosity": verbosity,
      "--memory-verbosity": memory_verbosity,
      "--log-max-file-size": log_max_file_size,
      "--username": username,
      "--groupname": groupname,
      "--max-connections": max_connections,
      "--proxy": proxy,
    };
    List<String> arguments = ["test"];
    data.forEach((key, value) {
      if (key == "--local") {
        arguments.add("$key");
      } else if (value != null) {
        arguments.add("$key=$value");
      }
    });
    if (arguments.length > 2) {
      arguments.remove("test");
    }
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
