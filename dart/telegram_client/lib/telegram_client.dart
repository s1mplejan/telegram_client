library telegram_client;

export 'tdlib/tdlib.dart' if (dart.library.html) 'tdlib/tdlib_web.dart';
export 'telegram_bot_api_server/telegram_bot_api_server.dart';
export 'telegram_bot_api/telegram_bot_api.dart'
    if (dart.library.html) 'telegram_bot_api/telegram_bot_api_web.dart';

part 'tl/tdlib_methods.dart';
part 'tl/tdlib_parameters.dart';
part 'util/util.dart';
