part of telegram_client;

class TdlibFunction {
  late Map rawData;
  TdlibFunction(this.rawData);

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1error.html).
  factory TdlibFunction.error({
    int? code,
    String? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "error",
        "code": code,
        "message": message,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method error",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1ok.html).
  factory TdlibFunction.ok() {
    try {
      return TdlibFunction({
        "@type": "ok",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method ok",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authenticationCodeTypeTelegramMessage.html).
  factory TdlibFunction.authenticationCodeTypeTelegramMessage({
    int? length,
  }) {
    try {
      return TdlibFunction({
        "@type": "authenticationCodeTypeTelegramMessage",
        "length": length,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authenticationCodeTypeTelegramMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authenticationCodeTypeSms.html).
  factory TdlibFunction.authenticationCodeTypeSms({
    int? length,
  }) {
    try {
      return TdlibFunction({
        "@type": "authenticationCodeTypeSms",
        "length": length,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authenticationCodeTypeSms",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authenticationCodeTypeCall.html).
  factory TdlibFunction.authenticationCodeTypeCall({
    int? length,
  }) {
    try {
      return TdlibFunction({
        "@type": "authenticationCodeTypeCall",
        "length": length,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authenticationCodeTypeCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authenticationCodeTypeFlashCall.html).
  factory TdlibFunction.authenticationCodeTypeFlashCall({
    String? pattern,
  }) {
    try {
      return TdlibFunction({
        "@type": "authenticationCodeTypeFlashCall",
        "pattern": pattern,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authenticationCodeTypeFlashCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authenticationCodeTypeMissedCall.html).
  factory TdlibFunction.authenticationCodeTypeMissedCall({
    String? phone_number_prefix,
    int? length,
  }) {
    try {
      return TdlibFunction({
        "@type": "authenticationCodeTypeMissedCall",
        "phone_number_prefix": phone_number_prefix,
        "length": length,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authenticationCodeTypeMissedCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authenticationCodeInfo.html).
  factory TdlibFunction.authenticationCodeInfo({
    String? phone_number,
    TdlibFunction? type,
    TdlibFunction? next_type,
    int? timeout,
  }) {
    try {
      return TdlibFunction({
        "@type": "authenticationCodeInfo",
        "phone_number": phone_number,
        "type": type!.toJson(),
        "next_type": next_type!.toJson(),
        "timeout": timeout,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authenticationCodeInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emailAddressAuthenticationCodeInfo.html).
  factory TdlibFunction.emailAddressAuthenticationCodeInfo({
    String? email_address_pattern,
    int? length,
  }) {
    try {
      return TdlibFunction({
        "@type": "emailAddressAuthenticationCodeInfo",
        "email_address_pattern": email_address_pattern,
        "length": length,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emailAddressAuthenticationCodeInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emailAddressAuthenticationCode.html).
  factory TdlibFunction.emailAddressAuthenticationCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "emailAddressAuthenticationCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emailAddressAuthenticationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emailAddressAuthenticationAppleId.html).
  factory TdlibFunction.emailAddressAuthenticationAppleId({
    String? token,
  }) {
    try {
      return TdlibFunction({
        "@type": "emailAddressAuthenticationAppleId",
        "token": token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emailAddressAuthenticationAppleId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emailAddressAuthenticationGoogleId.html).
  factory TdlibFunction.emailAddressAuthenticationGoogleId({
    String? token,
  }) {
    try {
      return TdlibFunction({
        "@type": "emailAddressAuthenticationGoogleId",
        "token": token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emailAddressAuthenticationGoogleId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntity.html).
  factory TdlibFunction.textEntity({
    int? offset,
    int? length,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntity",
        "offset": offset,
        "length": length,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntity",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntities.html).
  factory TdlibFunction.textEntities({
    TdlibFunction? entities,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntities",
        "entities": entities!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntities",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1formattedText.html).
  factory TdlibFunction.formattedText({
    String? text,
    TdlibFunction? entities,
  }) {
    try {
      return TdlibFunction({
        "@type": "formattedText",
        "text": text,
        "entities": entities!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method formattedText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1termsOfService.html).
  factory TdlibFunction.termsOfService({
    TdlibFunction? text,
    int? min_user_age,
    bool? show_popup,
  }) {
    try {
      return TdlibFunction({
        "@type": "termsOfService",
        "text": text!.toJson(),
        "min_user_age": min_user_age,
        "show_popup": show_popup,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method termsOfService",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitTdlibParameters.html).
  factory TdlibFunction.authorizationStateWaitTdlibParameters() {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitTdlibParameters",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitTdlibParameters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitPhoneNumber.html).
  factory TdlibFunction.authorizationStateWaitPhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitPhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitEmailAddress.html).
  factory TdlibFunction.authorizationStateWaitEmailAddress({
    bool? allow_apple_id,
    bool? allow_google_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitEmailAddress",
        "allow_apple_id": allow_apple_id,
        "allow_google_id": allow_google_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitEmailCode.html).
  factory TdlibFunction.authorizationStateWaitEmailCode({
    bool? allow_apple_id,
    bool? allow_google_id,
    TdlibFunction? code_info,
    int? next_phone_number_authorization_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitEmailCode",
        "allow_apple_id": allow_apple_id,
        "allow_google_id": allow_google_id,
        "code_info": code_info!.toJson(),
        "next_phone_number_authorization_date": next_phone_number_authorization_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitEmailCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitCode.html).
  factory TdlibFunction.authorizationStateWaitCode({
    TdlibFunction? code_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitCode",
        "code_info": code_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitOtherDeviceConfirmation.html).
  factory TdlibFunction.authorizationStateWaitOtherDeviceConfirmation({
    String? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitOtherDeviceConfirmation",
        "link": link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitOtherDeviceConfirmation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitRegistration.html).
  factory TdlibFunction.authorizationStateWaitRegistration({
    TdlibFunction? terms_of_service,
  }) {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitRegistration",
        "terms_of_service": terms_of_service!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateWaitPassword.html).
  factory TdlibFunction.authorizationStateWaitPassword({
    String? password_hint,
    bool? has_recovery_email_address,
    String? recovery_email_address_pattern,
  }) {
    try {
      return TdlibFunction({
        "@type": "authorizationStateWaitPassword",
        "password_hint": password_hint,
        "has_recovery_email_address": has_recovery_email_address,
        "recovery_email_address_pattern": recovery_email_address_pattern,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateWaitPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateReady.html).
  factory TdlibFunction.authorizationStateReady() {
    try {
      return TdlibFunction({
        "@type": "authorizationStateReady",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateReady",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateLoggingOut.html).
  factory TdlibFunction.authorizationStateLoggingOut() {
    try {
      return TdlibFunction({
        "@type": "authorizationStateLoggingOut",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateLoggingOut",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateClosing.html).
  factory TdlibFunction.authorizationStateClosing() {
    try {
      return TdlibFunction({
        "@type": "authorizationStateClosing",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateClosing",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authorizationStateClosed.html).
  factory TdlibFunction.authorizationStateClosed() {
    try {
      return TdlibFunction({
        "@type": "authorizationStateClosed",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method authorizationStateClosed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passwordState.html).
  factory TdlibFunction.passwordState({
    bool? has_password,
    String? password_hint,
    bool? has_recovery_email_address,
    bool? has_passport_data,
    TdlibFunction? recovery_email_address_code_info,
    String? login_email_address_pattern,
    int? pending_reset_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "passwordState",
        "has_password": has_password,
        "password_hint": password_hint,
        "has_recovery_email_address": has_recovery_email_address,
        "has_passport_data": has_passport_data,
        "recovery_email_address_code_info": recovery_email_address_code_info!.toJson(),
        "login_email_address_pattern": login_email_address_pattern,
        "pending_reset_date": pending_reset_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passwordState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1recoveryEmailAddress.html).
  factory TdlibFunction.recoveryEmailAddress({
    String? recovery_email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "recoveryEmailAddress",
        "recovery_email_address": recovery_email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method recoveryEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1temporaryPasswordState.html).
  factory TdlibFunction.temporaryPasswordState({
    bool? has_password,
    int? valid_for,
  }) {
    try {
      return TdlibFunction({
        "@type": "temporaryPasswordState",
        "has_password": has_password,
        "valid_for": valid_for,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method temporaryPasswordState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1localFile.html).
  factory TdlibFunction.localFile({
    String? path,
    bool? can_be_downloaded,
    bool? can_be_deleted,
    bool? is_downloading_active,
    bool? is_downloading_completed,
    int? download_offset,
    int? downloaded_prefix_size,
    int? downloaded_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "localFile",
        "path": path,
        "can_be_downloaded": can_be_downloaded,
        "can_be_deleted": can_be_deleted,
        "is_downloading_active": is_downloading_active,
        "is_downloading_completed": is_downloading_completed,
        "download_offset": download_offset,
        "downloaded_prefix_size": downloaded_prefix_size,
        "downloaded_size": downloaded_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method localFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1remoteFile.html).
  factory TdlibFunction.remoteFile({
    String? id,
    String? unique_id,
    bool? is_uploading_active,
    bool? is_uploading_completed,
    int? uploaded_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "remoteFile",
        "id": id,
        "unique_id": unique_id,
        "is_uploading_active": is_uploading_active,
        "is_uploading_completed": is_uploading_completed,
        "uploaded_size": uploaded_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method remoteFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1file.html).
  factory TdlibFunction.file({
    int? id,
    int? size,
    int? expected_size,
    TdlibFunction? local,
    TdlibFunction? remote,
  }) {
    try {
      return TdlibFunction({
        "@type": "file",
        "id": id,
        "size": size,
        "expected_size": expected_size,
        "local": local!.toJson(),
        "remote": remote!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method file",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputFileId.html).
  factory TdlibFunction.inputFileId({
    int? id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputFileId",
        "id": id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputFileId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputFileRemote.html).
  factory TdlibFunction.inputFileRemote({
    String? id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputFileRemote",
        "id": id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputFileRemote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputFileLocal.html).
  factory TdlibFunction.inputFileLocal({
    String? path,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputFileLocal",
        "path": path,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputFileLocal",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputFileGenerated.html).
  factory TdlibFunction.inputFileGenerated({
    String? original_path,
    String? conversion,
    int? expected_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputFileGenerated",
        "original_path": original_path,
        "conversion": conversion,
        "expected_size": expected_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputFileGenerated",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1photoSize.html).
  factory TdlibFunction.photoSize({
    String? type,
    TdlibFunction? photo,
    int? width,
    int? height,
    List<int>? progressive_sizes,
  }) {
    try {
      return TdlibFunction({
        "@type": "photoSize",
        "type": type,
        "photo": photo!.toJson(),
        "width": width,
        "height": height,
        "progressive_sizes": progressive_sizes,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method photoSize",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1minithumbnail.html).
  factory TdlibFunction.minithumbnail({
    int? width,
    int? height,
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "minithumbnail",
        "width": width,
        "height": height,
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method minithumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatJpeg.html).
  factory TdlibFunction.thumbnailFormatJpeg() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatJpeg",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatJpeg",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatGif.html).
  factory TdlibFunction.thumbnailFormatGif() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatGif",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatGif",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatMpeg4.html).
  factory TdlibFunction.thumbnailFormatMpeg4() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatMpeg4",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatMpeg4",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatPng.html).
  factory TdlibFunction.thumbnailFormatPng() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatPng",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatPng",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatTgs.html).
  factory TdlibFunction.thumbnailFormatTgs() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatTgs",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatTgs",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatWebm.html).
  factory TdlibFunction.thumbnailFormatWebm() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatWebm",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatWebm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnailFormatWebp.html).
  factory TdlibFunction.thumbnailFormatWebp() {
    try {
      return TdlibFunction({
        "@type": "thumbnailFormatWebp",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnailFormatWebp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1thumbnail.html).
  factory TdlibFunction.thumbnail({
    TdlibFunction? format,
    int? width,
    int? height,
    TdlibFunction? file,
  }) {
    try {
      return TdlibFunction({
        "@type": "thumbnail",
        "format": format!.toJson(),
        "width": width,
        "height": height,
        "file": file!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method thumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1maskPointForehead.html).
  factory TdlibFunction.maskPointForehead() {
    try {
      return TdlibFunction({
        "@type": "maskPointForehead",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method maskPointForehead",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1maskPointEyes.html).
  factory TdlibFunction.maskPointEyes() {
    try {
      return TdlibFunction({
        "@type": "maskPointEyes",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method maskPointEyes",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1maskPointMouth.html).
  factory TdlibFunction.maskPointMouth() {
    try {
      return TdlibFunction({
        "@type": "maskPointMouth",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method maskPointMouth",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1maskPointChin.html).
  factory TdlibFunction.maskPointChin() {
    try {
      return TdlibFunction({
        "@type": "maskPointChin",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method maskPointChin",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1maskPosition.html).
  factory TdlibFunction.maskPosition({
    TdlibFunction? point,
    double? x_shift,
    double? y_shift,
    double? scale,
  }) {
    try {
      return TdlibFunction({
        "@type": "maskPosition",
        "point": point!.toJson(),
        "x_shift": x_shift,
        "y_shift": y_shift,
        "scale": scale,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method maskPosition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerFormatWebp.html).
  factory TdlibFunction.stickerFormatWebp() {
    try {
      return TdlibFunction({
        "@type": "stickerFormatWebp",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerFormatWebp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerFormatTgs.html).
  factory TdlibFunction.stickerFormatTgs() {
    try {
      return TdlibFunction({
        "@type": "stickerFormatTgs",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerFormatTgs",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerFormatWebm.html).
  factory TdlibFunction.stickerFormatWebm() {
    try {
      return TdlibFunction({
        "@type": "stickerFormatWebm",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerFormatWebm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerTypeRegular.html).
  factory TdlibFunction.stickerTypeRegular() {
    try {
      return TdlibFunction({
        "@type": "stickerTypeRegular",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerTypeRegular",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerTypeMask.html).
  factory TdlibFunction.stickerTypeMask() {
    try {
      return TdlibFunction({
        "@type": "stickerTypeMask",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerTypeMask",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerTypeCustomEmoji.html).
  factory TdlibFunction.stickerTypeCustomEmoji() {
    try {
      return TdlibFunction({
        "@type": "stickerTypeCustomEmoji",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerTypeCustomEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1closedVectorPath.html).
  factory TdlibFunction.closedVectorPath({
    TdlibFunction? commands,
  }) {
    try {
      return TdlibFunction({
        "@type": "closedVectorPath",
        "commands": commands!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method closedVectorPath",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pollOption.html).
  factory TdlibFunction.pollOption({
    String? text,
    int? voter_count,
    int? vote_percentage,
    bool? is_chosen,
    bool? is_being_chosen,
  }) {
    try {
      return TdlibFunction({
        "@type": "pollOption",
        "text": text,
        "voter_count": voter_count,
        "vote_percentage": vote_percentage,
        "is_chosen": is_chosen,
        "is_being_chosen": is_being_chosen,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pollOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pollTypeRegular.html).
  factory TdlibFunction.pollTypeRegular({
    bool? allow_multiple_answers,
  }) {
    try {
      return TdlibFunction({
        "@type": "pollTypeRegular",
        "allow_multiple_answers": allow_multiple_answers,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pollTypeRegular",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pollTypeQuiz.html).
  factory TdlibFunction.pollTypeQuiz({
    int? correct_option_id,
    TdlibFunction? explanation,
  }) {
    try {
      return TdlibFunction({
        "@type": "pollTypeQuiz",
        "correct_option_id": correct_option_id,
        "explanation": explanation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pollTypeQuiz",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1animation.html).
  factory TdlibFunction.animation({
    int? duration,
    int? width,
    int? height,
    String? file_name,
    String? mime_type,
    bool? has_stickers,
    TdlibFunction? minithumbnail,
    TdlibFunction? thumbnail,
    TdlibFunction? animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "animation",
        "duration": duration,
        "width": width,
        "height": height,
        "file_name": file_name,
        "mime_type": mime_type,
        "has_stickers": has_stickers,
        "minithumbnail": minithumbnail!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "animation": animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method animation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1audio.html).
  factory TdlibFunction.audio({
    int? duration,
    String? title,
    String? performer,
    String? file_name,
    String? mime_type,
    TdlibFunction? album_cover_minithumbnail,
    TdlibFunction? album_cover_thumbnail,
    TdlibFunction? external_album_covers,
    TdlibFunction? audio,
  }) {
    try {
      return TdlibFunction({
        "@type": "audio",
        "duration": duration,
        "title": title,
        "performer": performer,
        "file_name": file_name,
        "mime_type": mime_type,
        "album_cover_minithumbnail": album_cover_minithumbnail!.toJson(),
        "album_cover_thumbnail": album_cover_thumbnail!.toJson(),
        "external_album_covers": external_album_covers!.toJson(),
        "audio": audio!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method audio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1document.html).
  factory TdlibFunction.document({
    String? file_name,
    String? mime_type,
    TdlibFunction? minithumbnail,
    TdlibFunction? thumbnail,
    TdlibFunction? document,
  }) {
    try {
      return TdlibFunction({
        "@type": "document",
        "file_name": file_name,
        "mime_type": mime_type,
        "minithumbnail": minithumbnail!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "document": document!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method document",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1photo.html).
  factory TdlibFunction.photo({
    bool? has_stickers,
    TdlibFunction? minithumbnail,
    TdlibFunction? sizes,
  }) {
    try {
      return TdlibFunction({
        "@type": "photo",
        "has_stickers": has_stickers,
        "minithumbnail": minithumbnail!.toJson(),
        "sizes": sizes!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method photo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sticker.html).
  factory TdlibFunction.sticker({
    int? set_id,
    int? width,
    int? height,
    String? emoji,
    TdlibFunction? format,
    TdlibFunction? type,
    TdlibFunction? mask_position,
    int? custom_emoji_id,
    TdlibFunction? outline,
    TdlibFunction? thumbnail,
    bool? is_premium,
    TdlibFunction? premium_animation,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "sticker",
        "set_id": set_id,
        "width": width,
        "height": height,
        "emoji": emoji,
        "format": format!.toJson(),
        "type": type!.toJson(),
        "mask_position": mask_position!.toJson(),
        "custom_emoji_id": custom_emoji_id,
        "outline": outline!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "is_premium": is_premium,
        "premium_animation": premium_animation!.toJson(),
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1video.html).
  factory TdlibFunction.video({
    int? duration,
    int? width,
    int? height,
    String? file_name,
    String? mime_type,
    bool? has_stickers,
    bool? supports_streaming,
    TdlibFunction? minithumbnail,
    TdlibFunction? thumbnail,
    TdlibFunction? video,
  }) {
    try {
      return TdlibFunction({
        "@type": "video",
        "duration": duration,
        "width": width,
        "height": height,
        "file_name": file_name,
        "mime_type": mime_type,
        "has_stickers": has_stickers,
        "supports_streaming": supports_streaming,
        "minithumbnail": minithumbnail!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "video": video!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method video",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1videoNote.html).
  factory TdlibFunction.videoNote({
    int? duration,
    int? length,
    TdlibFunction? minithumbnail,
    TdlibFunction? thumbnail,
    TdlibFunction? video,
  }) {
    try {
      return TdlibFunction({
        "@type": "videoNote",
        "duration": duration,
        "length": length,
        "minithumbnail": minithumbnail!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "video": video!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method videoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1voiceNote.html).
  factory TdlibFunction.voiceNote({
    int? duration,
    TdlibFunction? waveform,
    String? mime_type,
    TdlibFunction? speech_recognition_result,
    TdlibFunction? voice,
  }) {
    try {
      return TdlibFunction({
        "@type": "voiceNote",
        "duration": duration,
        "waveform": waveform!.toJson(),
        "mime_type": mime_type,
        "speech_recognition_result": speech_recognition_result!.toJson(),
        "voice": voice!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method voiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1animatedEmoji.html).
  factory TdlibFunction.animatedEmoji({
    TdlibFunction? sticker,
    int? sticker_width,
    int? sticker_height,
    int? fitzpatrick_type,
    TdlibFunction? sound,
  }) {
    try {
      return TdlibFunction({
        "@type": "animatedEmoji",
        "sticker": sticker!.toJson(),
        "sticker_width": sticker_width,
        "sticker_height": sticker_height,
        "fitzpatrick_type": fitzpatrick_type,
        "sound": sound!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method animatedEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1contact.html).
  factory TdlibFunction.contact({
    String? phone_number,
    String? first_name,
    String? last_name,
    String? vcard,
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "contact",
        "phone_number": phone_number,
        "first_name": first_name,
        "last_name": last_name,
        "vcard": vcard,
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method contact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1location.html).
  factory TdlibFunction.location({
    double? latitude,
    double? longitude,
    double? horizontal_accuracy,
  }) {
    try {
      return TdlibFunction({
        "@type": "location",
        "latitude": latitude,
        "longitude": longitude,
        "horizontal_accuracy": horizontal_accuracy,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method location",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1venue.html).
  factory TdlibFunction.venue({
    TdlibFunction? location,
    String? title,
    String? address,
    String? provider,
    String? id,
    String? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "venue",
        "location": location!.toJson(),
        "title": title,
        "address": address,
        "provider": provider,
        "id": id,
        "type": type,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method venue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1game.html).
  factory TdlibFunction.game({
    int? id,
    String? short_name,
    String? title,
    TdlibFunction? text,
    String? description,
    TdlibFunction? photo,
    TdlibFunction? animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "game",
        "id": id,
        "short_name": short_name,
        "title": title,
        "text": text!.toJson(),
        "description": description,
        "photo": photo!.toJson(),
        "animation": animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method game",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1poll.html).
  factory TdlibFunction.poll({
    int? id,
    String? question,
    TdlibFunction? options,
    int? total_voter_count,
    List<int>? recent_voter_user_ids,
    bool? is_anonymous,
    TdlibFunction? type,
    int? open_period,
    int? close_date,
    bool? is_closed,
  }) {
    try {
      return TdlibFunction({
        "@type": "poll",
        "id": id,
        "question": question,
        "options": options!.toJson(),
        "total_voter_count": total_voter_count,
        "recent_voter_user_ids": recent_voter_user_ids,
        "is_anonymous": is_anonymous,
        "type": type!.toJson(),
        "open_period": open_period,
        "close_date": close_date,
        "is_closed": is_closed,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method poll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1profilePhoto.html).
  factory TdlibFunction.profilePhoto({
    int? id,
    TdlibFunction? small,
    TdlibFunction? big,
    TdlibFunction? minithumbnail,
    bool? has_animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "profilePhoto",
        "id": id,
        "small": small!.toJson(),
        "big": big!.toJson(),
        "minithumbnail": minithumbnail!.toJson(),
        "has_animation": has_animation,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method profilePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatPhotoInfo.html).
  factory TdlibFunction.chatPhotoInfo({
    TdlibFunction? small,
    TdlibFunction? big,
    TdlibFunction? minithumbnail,
    bool? has_animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatPhotoInfo",
        "small": small!.toJson(),
        "big": big!.toJson(),
        "minithumbnail": minithumbnail!.toJson(),
        "has_animation": has_animation,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatPhotoInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userTypeRegular.html).
  factory TdlibFunction.userTypeRegular() {
    try {
      return TdlibFunction({
        "@type": "userTypeRegular",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userTypeRegular",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userTypeDeleted.html).
  factory TdlibFunction.userTypeDeleted() {
    try {
      return TdlibFunction({
        "@type": "userTypeDeleted",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userTypeDeleted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userTypeBot.html).
  factory TdlibFunction.userTypeBot({
    bool? can_join_groups,
    bool? can_read_all_group_messages,
    bool? is_inline,
    String? inline_query_placeholder,
    bool? need_location,
    bool? can_be_added_to_attachment_menu,
  }) {
    try {
      return TdlibFunction({
        "@type": "userTypeBot",
        "can_join_groups": can_join_groups,
        "can_read_all_group_messages": can_read_all_group_messages,
        "is_inline": is_inline,
        "inline_query_placeholder": inline_query_placeholder,
        "need_location": need_location,
        "can_be_added_to_attachment_menu": can_be_added_to_attachment_menu,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userTypeBot",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userTypeUnknown.html).
  factory TdlibFunction.userTypeUnknown() {
    try {
      return TdlibFunction({
        "@type": "userTypeUnknown",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userTypeUnknown",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommand.html).
  factory TdlibFunction.botCommand({
    String? command,
    String? description,
  }) {
    try {
      return TdlibFunction({
        "@type": "botCommand",
        "command": command,
        "description": description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommand",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommands.html).
  factory TdlibFunction.botCommands({
    int? bot_user_id,
    TdlibFunction? commands,
  }) {
    try {
      return TdlibFunction({
        "@type": "botCommands",
        "bot_user_id": bot_user_id,
        "commands": commands!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommands",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botMenuButton.html).
  factory TdlibFunction.botMenuButton({
    String? text,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "botMenuButton",
        "text": text,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botMenuButton",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatLocation.html).
  factory TdlibFunction.chatLocation({
    TdlibFunction? location,
    String? address,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatLocation",
        "location": location!.toJson(),
        "address": address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1animatedChatPhoto.html).
  factory TdlibFunction.animatedChatPhoto({
    int? length,
    TdlibFunction? file,
    double? main_frame_timestamp,
  }) {
    try {
      return TdlibFunction({
        "@type": "animatedChatPhoto",
        "length": length,
        "file": file!.toJson(),
        "main_frame_timestamp": main_frame_timestamp,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method animatedChatPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatPhoto.html).
  factory TdlibFunction.chatPhoto({
    int? id,
    int? added_date,
    TdlibFunction? minithumbnail,
    TdlibFunction? sizes,
    TdlibFunction? animation,
    TdlibFunction? small_animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatPhoto",
        "id": id,
        "added_date": added_date,
        "minithumbnail": minithumbnail!.toJson(),
        "sizes": sizes!.toJson(),
        "animation": animation!.toJson(),
        "small_animation": small_animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatPhotos.html).
  factory TdlibFunction.chatPhotos({
    int? total_count,
    TdlibFunction? photos,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatPhotos",
        "total_count": total_count,
        "photos": photos!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatPhotos",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputChatPhotoPrevious.html).
  factory TdlibFunction.inputChatPhotoPrevious({
    int? chat_photo_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputChatPhotoPrevious",
        "chat_photo_id": chat_photo_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputChatPhotoPrevious",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputChatPhotoStatic.html).
  factory TdlibFunction.inputChatPhotoStatic({
    TdlibFunction? photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputChatPhotoStatic",
        "photo": photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputChatPhotoStatic",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputChatPhotoAnimation.html).
  factory TdlibFunction.inputChatPhotoAnimation({
    TdlibFunction? animation,
    double? main_frame_timestamp,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputChatPhotoAnimation",
        "animation": animation!.toJson(),
        "main_frame_timestamp": main_frame_timestamp,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputChatPhotoAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatPermissions.html).
  factory TdlibFunction.chatPermissions({
    bool? can_send_messages,
    bool? can_send_media_messages,
    bool? can_send_polls,
    bool? can_send_other_messages,
    bool? can_add_web_page_previews,
    bool? can_change_info,
    bool? can_invite_users,
    bool? can_pin_messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatPermissions",
        "can_send_messages": can_send_messages,
        "can_send_media_messages": can_send_media_messages,
        "can_send_polls": can_send_polls,
        "can_send_other_messages": can_send_other_messages,
        "can_add_web_page_previews": can_add_web_page_previews,
        "can_change_info": can_change_info,
        "can_invite_users": can_invite_users,
        "can_pin_messages": can_pin_messages,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatPermissions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatAdministratorRights.html).
  factory TdlibFunction.chatAdministratorRights({
    bool? can_manage_chat,
    bool? can_change_info,
    bool? can_post_messages,
    bool? can_edit_messages,
    bool? can_delete_messages,
    bool? can_invite_users,
    bool? can_restrict_members,
    bool? can_pin_messages,
    bool? can_promote_members,
    bool? can_manage_video_chats,
    bool? is_anonymous,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatAdministratorRights",
        "can_manage_chat": can_manage_chat,
        "can_change_info": can_change_info,
        "can_post_messages": can_post_messages,
        "can_edit_messages": can_edit_messages,
        "can_delete_messages": can_delete_messages,
        "can_invite_users": can_invite_users,
        "can_restrict_members": can_restrict_members,
        "can_pin_messages": can_pin_messages,
        "can_promote_members": can_promote_members,
        "can_manage_video_chats": can_manage_video_chats,
        "is_anonymous": is_anonymous,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatAdministratorRights",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumPaymentOption.html).
  factory TdlibFunction.premiumPaymentOption({
    String? currency,
    int? amount,
    int? discount_percentage,
    int? month_count,
    String? store_product_id,
    TdlibFunction? payment_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumPaymentOption",
        "currency": currency,
        "amount": amount,
        "discount_percentage": discount_percentage,
        "month_count": month_count,
        "store_product_id": store_product_id,
        "payment_link": payment_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumPaymentOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emojiStatus.html).
  factory TdlibFunction.emojiStatus({
    int? custom_emoji_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "emojiStatus",
        "custom_emoji_id": custom_emoji_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emojiStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emojiStatuses.html).
  factory TdlibFunction.emojiStatuses({
    TdlibFunction? emoji_statuses,
  }) {
    try {
      return TdlibFunction({
        "@type": "emojiStatuses",
        "emoji_statuses": emoji_statuses!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emojiStatuses",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1user.html).
  factory TdlibFunction.user({
    int? id,
    String? first_name,
    String? last_name,
    String? username,
    String? phone_number,
    TdlibFunction? status,
    TdlibFunction? profile_photo,
    TdlibFunction? emoji_status,
    bool? is_contact,
    bool? is_mutual_contact,
    bool? is_verified,
    bool? is_premium,
    bool? is_support,
    String? restriction_reason,
    bool? is_scam,
    bool? is_fake,
    bool? have_access,
    TdlibFunction? type,
    String? language_code,
    bool? added_to_attachment_menu,
  }) {
    try {
      return TdlibFunction({
        "@type": "user",
        "id": id,
        "first_name": first_name,
        "last_name": last_name,
        "username": username,
        "phone_number": phone_number,
        "status": status!.toJson(),
        "profile_photo": profile_photo!.toJson(),
        "emoji_status": emoji_status!.toJson(),
        "is_contact": is_contact,
        "is_mutual_contact": is_mutual_contact,
        "is_verified": is_verified,
        "is_premium": is_premium,
        "is_support": is_support,
        "restriction_reason": restriction_reason,
        "is_scam": is_scam,
        "is_fake": is_fake,
        "have_access": have_access,
        "type": type!.toJson(),
        "language_code": language_code,
        "added_to_attachment_menu": added_to_attachment_menu,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method user",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botInfo.html).
  factory TdlibFunction.botInfo({
    String? share_text,
    String? description,
    TdlibFunction? photo,
    TdlibFunction? animation,
    TdlibFunction? menu_button,
    TdlibFunction? commands,
    TdlibFunction? default_group_administrator_rights,
    TdlibFunction? default_channel_administrator_rights,
  }) {
    try {
      return TdlibFunction({
        "@type": "botInfo",
        "share_text": share_text,
        "description": description,
        "photo": photo!.toJson(),
        "animation": animation!.toJson(),
        "menu_button": menu_button!.toJson(),
        "commands": commands!.toJson(),
        "default_group_administrator_rights": default_group_administrator_rights!.toJson(),
        "default_channel_administrator_rights": default_channel_administrator_rights!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userFullInfo.html).
  factory TdlibFunction.userFullInfo({
    TdlibFunction? photo,
    bool? is_blocked,
    bool? can_be_called,
    bool? supports_video_calls,
    bool? has_private_calls,
    bool? has_private_forwards,
    bool? has_restricted_voice_and_video_note_messages,
    bool? need_phone_number_privacy_exception,
    TdlibFunction? bio,
    TdlibFunction? premium_gift_options,
    int? group_in_common_count,
    TdlibFunction? bot_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "userFullInfo",
        "photo": photo!.toJson(),
        "is_blocked": is_blocked,
        "can_be_called": can_be_called,
        "supports_video_calls": supports_video_calls,
        "has_private_calls": has_private_calls,
        "has_private_forwards": has_private_forwards,
        "has_restricted_voice_and_video_note_messages": has_restricted_voice_and_video_note_messages,
        "need_phone_number_privacy_exception": need_phone_number_privacy_exception,
        "bio": bio!.toJson(),
        "premium_gift_options": premium_gift_options!.toJson(),
        "group_in_common_count": group_in_common_count,
        "bot_info": bot_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1users.html).
  factory TdlibFunction.users({
    int? total_count,
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "users",
        "total_count": total_count,
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method users",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatAdministrator.html).
  factory TdlibFunction.chatAdministrator({
    int? user_id,
    String? custom_title,
    bool? is_owner,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatAdministrator",
        "user_id": user_id,
        "custom_title": custom_title,
        "is_owner": is_owner,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatAdministrator",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatAdministrators.html).
  factory TdlibFunction.chatAdministrators({
    TdlibFunction? administrators,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatAdministrators",
        "administrators": administrators!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatAdministrators",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMemberStatusCreator.html).
  factory TdlibFunction.chatMemberStatusCreator({
    String? custom_title,
    bool? is_anonymous,
    bool? is_member,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMemberStatusCreator",
        "custom_title": custom_title,
        "is_anonymous": is_anonymous,
        "is_member": is_member,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMemberStatusCreator",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMemberStatusAdministrator.html).
  factory TdlibFunction.chatMemberStatusAdministrator({
    String? custom_title,
    bool? can_be_edited,
    TdlibFunction? rights,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMemberStatusAdministrator",
        "custom_title": custom_title,
        "can_be_edited": can_be_edited,
        "rights": rights!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMemberStatusAdministrator",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMemberStatusMember.html).
  factory TdlibFunction.chatMemberStatusMember() {
    try {
      return TdlibFunction({
        "@type": "chatMemberStatusMember",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMemberStatusMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMemberStatusRestricted.html).
  factory TdlibFunction.chatMemberStatusRestricted({
    bool? is_member,
    int? restricted_until_date,
    TdlibFunction? permissions,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMemberStatusRestricted",
        "is_member": is_member,
        "restricted_until_date": restricted_until_date,
        "permissions": permissions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMemberStatusRestricted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMemberStatusLeft.html).
  factory TdlibFunction.chatMemberStatusLeft() {
    try {
      return TdlibFunction({
        "@type": "chatMemberStatusLeft",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMemberStatusLeft",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMemberStatusBanned.html).
  factory TdlibFunction.chatMemberStatusBanned({
    int? banned_until_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMemberStatusBanned",
        "banned_until_date": banned_until_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMemberStatusBanned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMember.html).
  factory TdlibFunction.chatMember({
    TdlibFunction? member_id,
    int? inviter_user_id,
    int? joined_chat_date,
    TdlibFunction? status,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMember",
        "member_id": member_id!.toJson(),
        "inviter_user_id": inviter_user_id,
        "joined_chat_date": joined_chat_date,
        "status": status!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembers.html).
  factory TdlibFunction.chatMembers({
    int? total_count,
    TdlibFunction? members,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMembers",
        "total_count": total_count,
        "members": members!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterContacts.html).
  factory TdlibFunction.chatMembersFilterContacts() {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterContacts",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterAdministrators.html).
  factory TdlibFunction.chatMembersFilterAdministrators() {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterAdministrators",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterAdministrators",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterMembers.html).
  factory TdlibFunction.chatMembersFilterMembers() {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterMembers",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterMention.html).
  factory TdlibFunction.chatMembersFilterMention({
    int? message_thread_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterMention",
        "message_thread_id": message_thread_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterMention",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterRestricted.html).
  factory TdlibFunction.chatMembersFilterRestricted() {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterRestricted",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterRestricted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterBanned.html).
  factory TdlibFunction.chatMembersFilterBanned() {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterBanned",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterBanned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMembersFilterBots.html).
  factory TdlibFunction.chatMembersFilterBots() {
    try {
      return TdlibFunction({
        "@type": "chatMembersFilterBots",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMembersFilterBots",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterRecent.html).
  factory TdlibFunction.supergroupMembersFilterRecent() {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterRecent",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterRecent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterContacts.html).
  factory TdlibFunction.supergroupMembersFilterContacts({
    String? query,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterContacts",
        "query": query,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterAdministrators.html).
  factory TdlibFunction.supergroupMembersFilterAdministrators() {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterAdministrators",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterAdministrators",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterSearch.html).
  factory TdlibFunction.supergroupMembersFilterSearch({
    String? query,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterSearch",
        "query": query,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterSearch",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterRestricted.html).
  factory TdlibFunction.supergroupMembersFilterRestricted({
    String? query,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterRestricted",
        "query": query,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterRestricted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterBanned.html).
  factory TdlibFunction.supergroupMembersFilterBanned({
    String? query,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterBanned",
        "query": query,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterBanned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterMention.html).
  factory TdlibFunction.supergroupMembersFilterMention({
    String? query,
    int? message_thread_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterMention",
        "query": query,
        "message_thread_id": message_thread_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterMention",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupMembersFilterBots.html).
  factory TdlibFunction.supergroupMembersFilterBots() {
    try {
      return TdlibFunction({
        "@type": "supergroupMembersFilterBots",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupMembersFilterBots",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLink.html).
  factory TdlibFunction.chatInviteLink({
    String? invite_link,
    String? name,
    int? creator_user_id,
    int? date,
    int? edit_date,
    int? expiration_date,
    int? member_limit,
    int? member_count,
    int? pending_join_request_count,
    bool? creates_join_request,
    bool? is_primary,
    bool? is_revoked,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLink",
        "invite_link": invite_link,
        "name": name,
        "creator_user_id": creator_user_id,
        "date": date,
        "edit_date": edit_date,
        "expiration_date": expiration_date,
        "member_limit": member_limit,
        "member_count": member_count,
        "pending_join_request_count": pending_join_request_count,
        "creates_join_request": creates_join_request,
        "is_primary": is_primary,
        "is_revoked": is_revoked,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLinks.html).
  factory TdlibFunction.chatInviteLinks({
    int? total_count,
    TdlibFunction? invite_links,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLinks",
        "total_count": total_count,
        "invite_links": invite_links!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLinks",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLinkCount.html).
  factory TdlibFunction.chatInviteLinkCount({
    int? user_id,
    int? invite_link_count,
    int? revoked_invite_link_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLinkCount",
        "user_id": user_id,
        "invite_link_count": invite_link_count,
        "revoked_invite_link_count": revoked_invite_link_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLinkCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLinkCounts.html).
  factory TdlibFunction.chatInviteLinkCounts({
    TdlibFunction? invite_link_counts,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLinkCounts",
        "invite_link_counts": invite_link_counts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLinkCounts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLinkMember.html).
  factory TdlibFunction.chatInviteLinkMember({
    int? user_id,
    int? joined_chat_date,
    int? approver_user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLinkMember",
        "user_id": user_id,
        "joined_chat_date": joined_chat_date,
        "approver_user_id": approver_user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLinkMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLinkMembers.html).
  factory TdlibFunction.chatInviteLinkMembers({
    int? total_count,
    TdlibFunction? members,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLinkMembers",
        "total_count": total_count,
        "members": members!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLinkMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatInviteLinkInfo.html).
  factory TdlibFunction.chatInviteLinkInfo({
    int? chat_id,
    int? accessible_for,
    TdlibFunction? type,
    String? title,
    TdlibFunction? photo,
    String? description,
    int? member_count,
    List<int>? member_user_ids,
    bool? creates_join_request,
    bool? is_public,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatInviteLinkInfo",
        "chat_id": chat_id,
        "accessible_for": accessible_for,
        "type": type!.toJson(),
        "title": title,
        "photo": photo!.toJson(),
        "description": description,
        "member_count": member_count,
        "member_user_ids": member_user_ids,
        "creates_join_request": creates_join_request,
        "is_public": is_public,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatInviteLinkInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatJoinRequest.html).
  factory TdlibFunction.chatJoinRequest({
    int? user_id,
    int? date,
    String? bio,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatJoinRequest",
        "user_id": user_id,
        "date": date,
        "bio": bio,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatJoinRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatJoinRequests.html).
  factory TdlibFunction.chatJoinRequests({
    int? total_count,
    TdlibFunction? requests,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatJoinRequests",
        "total_count": total_count,
        "requests": requests!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatJoinRequests",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatJoinRequestsInfo.html).
  factory TdlibFunction.chatJoinRequestsInfo({
    int? total_count,
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatJoinRequestsInfo",
        "total_count": total_count,
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatJoinRequestsInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1basicGroup.html).
  factory TdlibFunction.basicGroup({
    int? id,
    int? member_count,
    TdlibFunction? status,
    bool? is_active,
    int? upgraded_to_supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "basicGroup",
        "id": id,
        "member_count": member_count,
        "status": status!.toJson(),
        "is_active": is_active,
        "upgraded_to_supergroup_id": upgraded_to_supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method basicGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1basicGroupFullInfo.html).
  factory TdlibFunction.basicGroupFullInfo({
    TdlibFunction? photo,
    String? description,
    int? creator_user_id,
    TdlibFunction? members,
    TdlibFunction? invite_link,
    TdlibFunction? bot_commands,
  }) {
    try {
      return TdlibFunction({
        "@type": "basicGroupFullInfo",
        "photo": photo!.toJson(),
        "description": description,
        "creator_user_id": creator_user_id,
        "members": members!.toJson(),
        "invite_link": invite_link!.toJson(),
        "bot_commands": bot_commands!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method basicGroupFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroup.html).
  factory TdlibFunction.supergroup({
    int? id,
    String? username,
    int? date,
    TdlibFunction? status,
    int? member_count,
    bool? has_linked_chat,
    bool? has_location,
    bool? sign_messages,
    bool? join_to_send_messages,
    bool? join_by_request,
    bool? is_slow_mode_enabled,
    bool? is_channel,
    bool? is_broadcast_group,
    bool? is_verified,
    String? restriction_reason,
    bool? is_scam,
    bool? is_fake,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroup",
        "id": id,
        "username": username,
        "date": date,
        "status": status!.toJson(),
        "member_count": member_count,
        "has_linked_chat": has_linked_chat,
        "has_location": has_location,
        "sign_messages": sign_messages,
        "join_to_send_messages": join_to_send_messages,
        "join_by_request": join_by_request,
        "is_slow_mode_enabled": is_slow_mode_enabled,
        "is_channel": is_channel,
        "is_broadcast_group": is_broadcast_group,
        "is_verified": is_verified,
        "restriction_reason": restriction_reason,
        "is_scam": is_scam,
        "is_fake": is_fake,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1supergroupFullInfo.html).
  factory TdlibFunction.supergroupFullInfo({
    TdlibFunction? photo,
    String? description,
    int? member_count,
    int? administrator_count,
    int? restricted_count,
    int? banned_count,
    int? linked_chat_id,
    int? slow_mode_delay,
    double? slow_mode_delay_expires_in,
    bool? can_get_members,
    bool? can_set_username,
    bool? can_set_sticker_set,
    bool? can_set_location,
    bool? can_get_statistics,
    bool? is_all_history_available,
    int? sticker_set_id,
    TdlibFunction? location,
    TdlibFunction? invite_link,
    TdlibFunction? bot_commands,
    int? upgraded_from_basic_group_id,
    int? upgraded_from_max_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "supergroupFullInfo",
        "photo": photo!.toJson(),
        "description": description,
        "member_count": member_count,
        "administrator_count": administrator_count,
        "restricted_count": restricted_count,
        "banned_count": banned_count,
        "linked_chat_id": linked_chat_id,
        "slow_mode_delay": slow_mode_delay,
        "slow_mode_delay_expires_in": slow_mode_delay_expires_in,
        "can_get_members": can_get_members,
        "can_set_username": can_set_username,
        "can_set_sticker_set": can_set_sticker_set,
        "can_set_location": can_set_location,
        "can_get_statistics": can_get_statistics,
        "is_all_history_available": is_all_history_available,
        "sticker_set_id": sticker_set_id,
        "location": location!.toJson(),
        "invite_link": invite_link!.toJson(),
        "bot_commands": bot_commands!.toJson(),
        "upgraded_from_basic_group_id": upgraded_from_basic_group_id,
        "upgraded_from_max_message_id": upgraded_from_max_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method supergroupFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1secretChatStatePending.html).
  factory TdlibFunction.secretChatStatePending() {
    try {
      return TdlibFunction({
        "@type": "secretChatStatePending",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method secretChatStatePending",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1secretChatStateReady.html).
  factory TdlibFunction.secretChatStateReady() {
    try {
      return TdlibFunction({
        "@type": "secretChatStateReady",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method secretChatStateReady",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1secretChatStateClosed.html).
  factory TdlibFunction.secretChatStateClosed() {
    try {
      return TdlibFunction({
        "@type": "secretChatStateClosed",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method secretChatStateClosed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1secretChat.html).
  factory TdlibFunction.secretChat({
    int? id,
    int? user_id,
    TdlibFunction? state,
    bool? is_outbound,
    TdlibFunction? key_hash,
    int? layer,
  }) {
    try {
      return TdlibFunction({
        "@type": "secretChat",
        "id": id,
        "user_id": user_id,
        "state": state!.toJson(),
        "is_outbound": is_outbound,
        "key_hash": key_hash!.toJson(),
        "layer": layer,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method secretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSenderUser.html).
  factory TdlibFunction.messageSenderUser({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSenderUser",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSenderUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSenderChat.html).
  factory TdlibFunction.messageSenderChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSenderChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSenderChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSenders.html).
  factory TdlibFunction.messageSenders({
    int? total_count,
    TdlibFunction? senders,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSenders",
        "total_count": total_count,
        "senders": senders!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSenders",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMessageSender.html).
  factory TdlibFunction.chatMessageSender({
    TdlibFunction? sender,
    bool? needs_premium,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMessageSender",
        "sender": sender!.toJson(),
        "needs_premium": needs_premium,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMessageSender",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatMessageSenders.html).
  factory TdlibFunction.chatMessageSenders({
    TdlibFunction? senders,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatMessageSenders",
        "senders": senders!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatMessageSenders",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageForwardOriginUser.html).
  factory TdlibFunction.messageForwardOriginUser({
    int? sender_user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageForwardOriginUser",
        "sender_user_id": sender_user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageForwardOriginUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageForwardOriginChat.html).
  factory TdlibFunction.messageForwardOriginChat({
    int? sender_chat_id,
    String? author_signature,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageForwardOriginChat",
        "sender_chat_id": sender_chat_id,
        "author_signature": author_signature,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageForwardOriginChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageForwardOriginHiddenUser.html).
  factory TdlibFunction.messageForwardOriginHiddenUser({
    String? sender_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageForwardOriginHiddenUser",
        "sender_name": sender_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageForwardOriginHiddenUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageForwardOriginChannel.html).
  factory TdlibFunction.messageForwardOriginChannel({
    int? chat_id,
    int? message_id,
    String? author_signature,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageForwardOriginChannel",
        "chat_id": chat_id,
        "message_id": message_id,
        "author_signature": author_signature,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageForwardOriginChannel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageForwardOriginMessageImport.html).
  factory TdlibFunction.messageForwardOriginMessageImport({
    String? sender_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageForwardOriginMessageImport",
        "sender_name": sender_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageForwardOriginMessageImport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reactionTypeEmoji.html).
  factory TdlibFunction.reactionTypeEmoji({
    String? emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "reactionTypeEmoji",
        "emoji": emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reactionTypeEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reactionTypeCustomEmoji.html).
  factory TdlibFunction.reactionTypeCustomEmoji({
    int? custom_emoji_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "reactionTypeCustomEmoji",
        "custom_emoji_id": custom_emoji_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reactionTypeCustomEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageForwardInfo.html).
  factory TdlibFunction.messageForwardInfo({
    TdlibFunction? origin,
    int? date,
    String? public_service_announcement_type,
    int? from_chat_id,
    int? from_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageForwardInfo",
        "origin": origin!.toJson(),
        "date": date,
        "public_service_announcement_type": public_service_announcement_type,
        "from_chat_id": from_chat_id,
        "from_message_id": from_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageForwardInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageReplyInfo.html).
  factory TdlibFunction.messageReplyInfo({
    int? reply_count,
    TdlibFunction? recent_replier_ids,
    int? last_read_inbox_message_id,
    int? last_read_outbox_message_id,
    int? last_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageReplyInfo",
        "reply_count": reply_count,
        "recent_replier_ids": recent_replier_ids!.toJson(),
        "last_read_inbox_message_id": last_read_inbox_message_id,
        "last_read_outbox_message_id": last_read_outbox_message_id,
        "last_message_id": last_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageReplyInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageReaction.html).
  factory TdlibFunction.messageReaction({
    TdlibFunction? type,
    int? total_count,
    bool? is_chosen,
    TdlibFunction? recent_sender_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageReaction",
        "type": type!.toJson(),
        "total_count": total_count,
        "is_chosen": is_chosen,
        "recent_sender_ids": recent_sender_ids!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageInteractionInfo.html).
  factory TdlibFunction.messageInteractionInfo({
    int? view_count,
    int? forward_count,
    TdlibFunction? reply_info,
    TdlibFunction? reactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageInteractionInfo",
        "view_count": view_count,
        "forward_count": forward_count,
        "reply_info": reply_info!.toJson(),
        "reactions": reactions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageInteractionInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1unreadReaction.html).
  factory TdlibFunction.unreadReaction({
    TdlibFunction? type,
    TdlibFunction? sender_id,
    bool? is_big,
  }) {
    try {
      return TdlibFunction({
        "@type": "unreadReaction",
        "type": type!.toJson(),
        "sender_id": sender_id!.toJson(),
        "is_big": is_big,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method unreadReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSendingStatePending.html).
  factory TdlibFunction.messageSendingStatePending() {
    try {
      return TdlibFunction({
        "@type": "messageSendingStatePending",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSendingStatePending",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSendingStateFailed.html).
  factory TdlibFunction.messageSendingStateFailed({
    int? error_code,
    String? error_message,
    bool? can_retry,
    bool? need_another_sender,
    double? retry_after,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSendingStateFailed",
        "error_code": error_code,
        "error_message": error_message,
        "can_retry": can_retry,
        "need_another_sender": need_another_sender,
        "retry_after": retry_after,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSendingStateFailed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1message.html).
  factory TdlibFunction.message({
    int? id,
    TdlibFunction? sender_id,
    int? chat_id,
    TdlibFunction? sending_state,
    TdlibFunction? scheduling_state,
    bool? is_outgoing,
    bool? is_pinned,
    bool? can_be_edited,
    bool? can_be_forwarded,
    bool? can_be_saved,
    bool? can_be_deleted_only_for_self,
    bool? can_be_deleted_for_all_users,
    bool? can_get_added_reactions,
    bool? can_get_statistics,
    bool? can_get_message_thread,
    bool? can_get_viewers,
    bool? can_get_media_timestamp_links,
    bool? can_report_reactions,
    bool? has_timestamped_media,
    bool? is_channel_post,
    bool? contains_unread_mention,
    int? date,
    int? edit_date,
    TdlibFunction? forward_info,
    TdlibFunction? interaction_info,
    TdlibFunction? unread_reactions,
    int? reply_in_chat_id,
    int? reply_to_message_id,
    int? message_thread_id,
    int? ttl,
    double? ttl_expires_in,
    int? via_bot_user_id,
    String? author_signature,
    int? media_album_id,
    String? restriction_reason,
    TdlibFunction? content,
    TdlibFunction? reply_markup,
  }) {
    try {
      return TdlibFunction({
        "@type": "message",
        "id": id,
        "sender_id": sender_id!.toJson(),
        "chat_id": chat_id,
        "sending_state": sending_state!.toJson(),
        "scheduling_state": scheduling_state!.toJson(),
        "is_outgoing": is_outgoing,
        "is_pinned": is_pinned,
        "can_be_edited": can_be_edited,
        "can_be_forwarded": can_be_forwarded,
        "can_be_saved": can_be_saved,
        "can_be_deleted_only_for_self": can_be_deleted_only_for_self,
        "can_be_deleted_for_all_users": can_be_deleted_for_all_users,
        "can_get_added_reactions": can_get_added_reactions,
        "can_get_statistics": can_get_statistics,
        "can_get_message_thread": can_get_message_thread,
        "can_get_viewers": can_get_viewers,
        "can_get_media_timestamp_links": can_get_media_timestamp_links,
        "can_report_reactions": can_report_reactions,
        "has_timestamped_media": has_timestamped_media,
        "is_channel_post": is_channel_post,
        "contains_unread_mention": contains_unread_mention,
        "date": date,
        "edit_date": edit_date,
        "forward_info": forward_info!.toJson(),
        "interaction_info": interaction_info!.toJson(),
        "unread_reactions": unread_reactions!.toJson(),
        "reply_in_chat_id": reply_in_chat_id,
        "reply_to_message_id": reply_to_message_id,
        "message_thread_id": message_thread_id,
        "ttl": ttl,
        "ttl_expires_in": ttl_expires_in,
        "via_bot_user_id": via_bot_user_id,
        "author_signature": author_signature,
        "media_album_id": media_album_id,
        "restriction_reason": restriction_reason,
        "content": content!.toJson(),
        "reply_markup": reply_markup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method message",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messages.html).
  factory TdlibFunction.messages({
    int? total_count,
    TdlibFunction? messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "messages",
        "total_count": total_count,
        "messages": messages!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1foundMessages.html).
  factory TdlibFunction.foundMessages({
    int? total_count,
    TdlibFunction? messages,
    String? next_offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "foundMessages",
        "total_count": total_count,
        "messages": messages!.toJson(),
        "next_offset": next_offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method foundMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePosition.html).
  factory TdlibFunction.messagePosition({
    int? position,
    int? message_id,
    int? date,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePosition",
        "position": position,
        "message_id": message_id,
        "date": date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePosition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePositions.html).
  factory TdlibFunction.messagePositions({
    int? total_count,
    TdlibFunction? positions,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePositions",
        "total_count": total_count,
        "positions": positions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePositions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageCalendarDay.html).
  factory TdlibFunction.messageCalendarDay({
    int? total_count,
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageCalendarDay",
        "total_count": total_count,
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageCalendarDay",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageCalendar.html).
  factory TdlibFunction.messageCalendar({
    int? total_count,
    TdlibFunction? days,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageCalendar",
        "total_count": total_count,
        "days": days!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageCalendar",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sponsoredMessage.html).
  factory TdlibFunction.sponsoredMessage({
    int? message_id,
    bool? is_recommended,
    int? sponsor_chat_id,
    TdlibFunction? sponsor_chat_info,
    TdlibFunction? link,
    TdlibFunction? content,
  }) {
    try {
      return TdlibFunction({
        "@type": "sponsoredMessage",
        "message_id": message_id,
        "is_recommended": is_recommended,
        "sponsor_chat_id": sponsor_chat_id,
        "sponsor_chat_info": sponsor_chat_info!.toJson(),
        "link": link!.toJson(),
        "content": content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sponsoredMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileDownload.html).
  factory TdlibFunction.fileDownload({
    int? file_id,
    TdlibFunction? message,
    int? add_date,
    int? complete_date,
    bool? is_paused,
  }) {
    try {
      return TdlibFunction({
        "@type": "fileDownload",
        "file_id": file_id,
        "message": message!.toJson(),
        "add_date": add_date,
        "complete_date": complete_date,
        "is_paused": is_paused,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileDownload",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1downloadedFileCounts.html).
  factory TdlibFunction.downloadedFileCounts({
    int? active_count,
    int? paused_count,
    int? completed_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "downloadedFileCounts",
        "active_count": active_count,
        "paused_count": paused_count,
        "completed_count": completed_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method downloadedFileCounts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1foundFileDownloads.html).
  factory TdlibFunction.foundFileDownloads({
    TdlibFunction? total_counts,
    TdlibFunction? files,
    String? next_offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "foundFileDownloads",
        "total_counts": total_counts!.toJson(),
        "files": files!.toJson(),
        "next_offset": next_offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method foundFileDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationSettingsScopePrivateChats.html).
  factory TdlibFunction.notificationSettingsScopePrivateChats() {
    try {
      return TdlibFunction({
        "@type": "notificationSettingsScopePrivateChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationSettingsScopePrivateChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationSettingsScopeGroupChats.html).
  factory TdlibFunction.notificationSettingsScopeGroupChats() {
    try {
      return TdlibFunction({
        "@type": "notificationSettingsScopeGroupChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationSettingsScopeGroupChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationSettingsScopeChannelChats.html).
  factory TdlibFunction.notificationSettingsScopeChannelChats() {
    try {
      return TdlibFunction({
        "@type": "notificationSettingsScopeChannelChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationSettingsScopeChannelChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatNotificationSettings.html).
  factory TdlibFunction.chatNotificationSettings({
    bool? use_default_mute_for,
    int? mute_for,
    bool? use_default_sound,
    int? sound_id,
    bool? use_default_show_preview,
    bool? show_preview,
    bool? use_default_disable_pinned_message_notifications,
    bool? disable_pinned_message_notifications,
    bool? use_default_disable_mention_notifications,
    bool? disable_mention_notifications,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatNotificationSettings",
        "use_default_mute_for": use_default_mute_for,
        "mute_for": mute_for,
        "use_default_sound": use_default_sound,
        "sound_id": sound_id,
        "use_default_show_preview": use_default_show_preview,
        "show_preview": show_preview,
        "use_default_disable_pinned_message_notifications": use_default_disable_pinned_message_notifications,
        "disable_pinned_message_notifications": disable_pinned_message_notifications,
        "use_default_disable_mention_notifications": use_default_disable_mention_notifications,
        "disable_mention_notifications": disable_mention_notifications,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1scopeNotificationSettings.html).
  factory TdlibFunction.scopeNotificationSettings({
    int? mute_for,
    int? sound_id,
    bool? show_preview,
    bool? disable_pinned_message_notifications,
    bool? disable_mention_notifications,
  }) {
    try {
      return TdlibFunction({
        "@type": "scopeNotificationSettings",
        "mute_for": mute_for,
        "sound_id": sound_id,
        "show_preview": show_preview,
        "disable_pinned_message_notifications": disable_pinned_message_notifications,
        "disable_mention_notifications": disable_mention_notifications,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method scopeNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1draftMessage.html).
  factory TdlibFunction.draftMessage({
    int? reply_to_message_id,
    int? date,
    TdlibFunction? input_message_text,
  }) {
    try {
      return TdlibFunction({
        "@type": "draftMessage",
        "reply_to_message_id": reply_to_message_id,
        "date": date,
        "input_message_text": input_message_text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method draftMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatTypePrivate.html).
  factory TdlibFunction.chatTypePrivate({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatTypePrivate",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatTypePrivate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatTypeBasicGroup.html).
  factory TdlibFunction.chatTypeBasicGroup({
    int? basic_group_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatTypeBasicGroup",
        "basic_group_id": basic_group_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatTypeBasicGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatTypeSupergroup.html).
  factory TdlibFunction.chatTypeSupergroup({
    int? supergroup_id,
    bool? is_channel,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatTypeSupergroup",
        "supergroup_id": supergroup_id,
        "is_channel": is_channel,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatTypeSupergroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatTypeSecret.html).
  factory TdlibFunction.chatTypeSecret({
    int? secret_chat_id,
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatTypeSecret",
        "secret_chat_id": secret_chat_id,
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatTypeSecret",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatFilter.html).
  factory TdlibFunction.chatFilter({
    String? title,
    String? icon_name,
    List<int>? pinned_chat_ids,
    List<int>? included_chat_ids,
    List<int>? excluded_chat_ids,
    bool? exclude_muted,
    bool? exclude_read,
    bool? exclude_archived,
    bool? include_contacts,
    bool? include_non_contacts,
    bool? include_bots,
    bool? include_groups,
    bool? include_channels,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatFilter",
        "title": title,
        "icon_name": icon_name,
        "pinned_chat_ids": pinned_chat_ids,
        "included_chat_ids": included_chat_ids,
        "excluded_chat_ids": excluded_chat_ids,
        "exclude_muted": exclude_muted,
        "exclude_read": exclude_read,
        "exclude_archived": exclude_archived,
        "include_contacts": include_contacts,
        "include_non_contacts": include_non_contacts,
        "include_bots": include_bots,
        "include_groups": include_groups,
        "include_channels": include_channels,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatFilterInfo.html).
  factory TdlibFunction.chatFilterInfo({
    int? id,
    String? title,
    String? icon_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatFilterInfo",
        "id": id,
        "title": title,
        "icon_name": icon_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatFilterInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1recommendedChatFilter.html).
  factory TdlibFunction.recommendedChatFilter({
    TdlibFunction? filter,
    String? description,
  }) {
    try {
      return TdlibFunction({
        "@type": "recommendedChatFilter",
        "filter": filter!.toJson(),
        "description": description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method recommendedChatFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1recommendedChatFilters.html).
  factory TdlibFunction.recommendedChatFilters({
    TdlibFunction? chat_filters,
  }) {
    try {
      return TdlibFunction({
        "@type": "recommendedChatFilters",
        "chat_filters": chat_filters!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method recommendedChatFilters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatListMain.html).
  factory TdlibFunction.chatListMain() {
    try {
      return TdlibFunction({
        "@type": "chatListMain",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatListMain",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatListArchive.html).
  factory TdlibFunction.chatListArchive() {
    try {
      return TdlibFunction({
        "@type": "chatListArchive",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatListArchive",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatListFilter.html).
  factory TdlibFunction.chatListFilter({
    int? chat_filter_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatListFilter",
        "chat_filter_id": chat_filter_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatListFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatLists.html).
  factory TdlibFunction.chatLists({
    TdlibFunction? chat_lists,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatLists",
        "chat_lists": chat_lists!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatLists",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatSourceMtprotoProxy.html).
  factory TdlibFunction.chatSourceMtprotoProxy() {
    try {
      return TdlibFunction({
        "@type": "chatSourceMtprotoProxy",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatSourceMtprotoProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatSourcePublicServiceAnnouncement.html).
  factory TdlibFunction.chatSourcePublicServiceAnnouncement({
    String? type,
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatSourcePublicServiceAnnouncement",
        "type": type,
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatSourcePublicServiceAnnouncement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatPosition.html).
  factory TdlibFunction.chatPosition({
    TdlibFunction? list,
    int? order,
    bool? is_pinned,
    TdlibFunction? source,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatPosition",
        "list": list!.toJson(),
        "order": order,
        "is_pinned": is_pinned,
        "source": source!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatPosition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatAvailableReactionsAll.html).
  factory TdlibFunction.chatAvailableReactionsAll() {
    try {
      return TdlibFunction({
        "@type": "chatAvailableReactionsAll",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatAvailableReactionsAll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatAvailableReactionsSome.html).
  factory TdlibFunction.chatAvailableReactionsSome({
    TdlibFunction? reactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatAvailableReactionsSome",
        "reactions": reactions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatAvailableReactionsSome",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1videoChat.html).
  factory TdlibFunction.videoChat({
    int? group_call_id,
    bool? has_participants,
    TdlibFunction? default_participant_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "videoChat",
        "group_call_id": group_call_id,
        "has_participants": has_participants,
        "default_participant_id": default_participant_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method videoChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chat.html).
  factory TdlibFunction.chat({
    int? id,
    TdlibFunction? type,
    String? title,
    TdlibFunction? photo,
    TdlibFunction? permissions,
    TdlibFunction? last_message,
    TdlibFunction? positions,
    TdlibFunction? message_sender_id,
    bool? has_protected_content,
    bool? is_marked_as_unread,
    bool? is_blocked,
    bool? has_scheduled_messages,
    bool? can_be_deleted_only_for_self,
    bool? can_be_deleted_for_all_users,
    bool? can_be_reported,
    bool? default_disable_notification,
    int? unread_count,
    int? last_read_inbox_message_id,
    int? last_read_outbox_message_id,
    int? unread_mention_count,
    int? unread_reaction_count,
    TdlibFunction? notification_settings,
    TdlibFunction? available_reactions,
    int? message_ttl,
    String? theme_name,
    TdlibFunction? action_bar,
    TdlibFunction? video_chat,
    TdlibFunction? pending_join_requests,
    int? reply_markup_message_id,
    TdlibFunction? draft_message,
    String? client_data,
  }) {
    try {
      return TdlibFunction({
        "@type": "chat",
        "id": id,
        "type": type!.toJson(),
        "title": title,
        "photo": photo!.toJson(),
        "permissions": permissions!.toJson(),
        "last_message": last_message!.toJson(),
        "positions": positions!.toJson(),
        "message_sender_id": message_sender_id!.toJson(),
        "has_protected_content": has_protected_content,
        "is_marked_as_unread": is_marked_as_unread,
        "is_blocked": is_blocked,
        "has_scheduled_messages": has_scheduled_messages,
        "can_be_deleted_only_for_self": can_be_deleted_only_for_self,
        "can_be_deleted_for_all_users": can_be_deleted_for_all_users,
        "can_be_reported": can_be_reported,
        "default_disable_notification": default_disable_notification,
        "unread_count": unread_count,
        "last_read_inbox_message_id": last_read_inbox_message_id,
        "last_read_outbox_message_id": last_read_outbox_message_id,
        "unread_mention_count": unread_mention_count,
        "unread_reaction_count": unread_reaction_count,
        "notification_settings": notification_settings!.toJson(),
        "available_reactions": available_reactions!.toJson(),
        "message_ttl": message_ttl,
        "theme_name": theme_name,
        "action_bar": action_bar!.toJson(),
        "video_chat": video_chat!.toJson(),
        "pending_join_requests": pending_join_requests!.toJson(),
        "reply_markup_message_id": reply_markup_message_id,
        "draft_message": draft_message!.toJson(),
        "client_data": client_data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chats.html).
  factory TdlibFunction.chats({
    int? total_count,
    List<int>? chat_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "chats",
        "total_count": total_count,
        "chat_ids": chat_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatNearby.html).
  factory TdlibFunction.chatNearby({
    int? chat_id,
    int? distance,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatNearby",
        "chat_id": chat_id,
        "distance": distance,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatNearby",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatsNearby.html).
  factory TdlibFunction.chatsNearby({
    TdlibFunction? users_nearby,
    TdlibFunction? supergroups_nearby,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatsNearby",
        "users_nearby": users_nearby!.toJson(),
        "supergroups_nearby": supergroups_nearby!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatsNearby",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1publicChatTypeHasUsername.html).
  factory TdlibFunction.publicChatTypeHasUsername() {
    try {
      return TdlibFunction({
        "@type": "publicChatTypeHasUsername",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method publicChatTypeHasUsername",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1publicChatTypeIsLocationBased.html).
  factory TdlibFunction.publicChatTypeIsLocationBased() {
    try {
      return TdlibFunction({
        "@type": "publicChatTypeIsLocationBased",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method publicChatTypeIsLocationBased",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarReportSpam.html).
  factory TdlibFunction.chatActionBarReportSpam({
    bool? can_unarchive,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionBarReportSpam",
        "can_unarchive": can_unarchive,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarReportSpam",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarReportUnrelatedLocation.html).
  factory TdlibFunction.chatActionBarReportUnrelatedLocation() {
    try {
      return TdlibFunction({
        "@type": "chatActionBarReportUnrelatedLocation",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarReportUnrelatedLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarInviteMembers.html).
  factory TdlibFunction.chatActionBarInviteMembers() {
    try {
      return TdlibFunction({
        "@type": "chatActionBarInviteMembers",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarInviteMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarReportAddBlock.html).
  factory TdlibFunction.chatActionBarReportAddBlock({
    bool? can_unarchive,
    int? distance,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionBarReportAddBlock",
        "can_unarchive": can_unarchive,
        "distance": distance,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarReportAddBlock",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarAddContact.html).
  factory TdlibFunction.chatActionBarAddContact() {
    try {
      return TdlibFunction({
        "@type": "chatActionBarAddContact",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarAddContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarSharePhoneNumber.html).
  factory TdlibFunction.chatActionBarSharePhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "chatActionBarSharePhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarSharePhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionBarJoinRequest.html).
  factory TdlibFunction.chatActionBarJoinRequest({
    String? title,
    bool? is_channel,
    int? request_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionBarJoinRequest",
        "title": title,
        "is_channel": is_channel,
        "request_date": request_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionBarJoinRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1keyboardButtonTypeText.html).
  factory TdlibFunction.keyboardButtonTypeText() {
    try {
      return TdlibFunction({
        "@type": "keyboardButtonTypeText",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method keyboardButtonTypeText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1keyboardButtonTypeRequestPhoneNumber.html).
  factory TdlibFunction.keyboardButtonTypeRequestPhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "keyboardButtonTypeRequestPhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method keyboardButtonTypeRequestPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1keyboardButtonTypeRequestLocation.html).
  factory TdlibFunction.keyboardButtonTypeRequestLocation() {
    try {
      return TdlibFunction({
        "@type": "keyboardButtonTypeRequestLocation",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method keyboardButtonTypeRequestLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1keyboardButtonTypeRequestPoll.html).
  factory TdlibFunction.keyboardButtonTypeRequestPoll({
    bool? force_regular,
    bool? force_quiz,
  }) {
    try {
      return TdlibFunction({
        "@type": "keyboardButtonTypeRequestPoll",
        "force_regular": force_regular,
        "force_quiz": force_quiz,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method keyboardButtonTypeRequestPoll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1keyboardButtonTypeWebApp.html).
  factory TdlibFunction.keyboardButtonTypeWebApp({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "keyboardButtonTypeWebApp",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method keyboardButtonTypeWebApp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1keyboardButton.html).
  factory TdlibFunction.keyboardButton({
    String? text,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "keyboardButton",
        "text": text,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method keyboardButton",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeUrl.html).
  factory TdlibFunction.inlineKeyboardButtonTypeUrl({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeUrl",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeLoginUrl.html).
  factory TdlibFunction.inlineKeyboardButtonTypeLoginUrl({
    String? url,
    int? id,
    String? forward_text,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeLoginUrl",
        "url": url,
        "id": id,
        "forward_text": forward_text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeLoginUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeWebApp.html).
  factory TdlibFunction.inlineKeyboardButtonTypeWebApp({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeWebApp",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeWebApp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeCallback.html).
  factory TdlibFunction.inlineKeyboardButtonTypeCallback({
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeCallback",
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeCallback",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeCallbackWithPassword.html).
  factory TdlibFunction.inlineKeyboardButtonTypeCallbackWithPassword({
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeCallbackWithPassword",
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeCallbackWithPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeCallbackGame.html).
  factory TdlibFunction.inlineKeyboardButtonTypeCallbackGame() {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeCallbackGame",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeCallbackGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeSwitchInline.html).
  factory TdlibFunction.inlineKeyboardButtonTypeSwitchInline({
    String? query,
    bool? in_current_chat,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeSwitchInline",
        "query": query,
        "in_current_chat": in_current_chat,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeSwitchInline",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeBuy.html).
  factory TdlibFunction.inlineKeyboardButtonTypeBuy() {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeBuy",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeBuy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButtonTypeUser.html).
  factory TdlibFunction.inlineKeyboardButtonTypeUser({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButtonTypeUser",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButtonTypeUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineKeyboardButton.html).
  factory TdlibFunction.inlineKeyboardButton({
    String? text,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineKeyboardButton",
        "text": text,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineKeyboardButton",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1replyMarkupRemoveKeyboard.html).
  factory TdlibFunction.replyMarkupRemoveKeyboard({
    bool? is_personal,
  }) {
    try {
      return TdlibFunction({
        "@type": "replyMarkupRemoveKeyboard",
        "is_personal": is_personal,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method replyMarkupRemoveKeyboard",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1replyMarkupForceReply.html).
  factory TdlibFunction.replyMarkupForceReply({
    bool? is_personal,
    String? input_field_placeholder,
  }) {
    try {
      return TdlibFunction({
        "@type": "replyMarkupForceReply",
        "is_personal": is_personal,
        "input_field_placeholder": input_field_placeholder,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method replyMarkupForceReply",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1replyMarkupShowKeyboard.html).
  factory TdlibFunction.replyMarkupShowKeyboard({
    TdlibFunction? rows,
    bool? resize_keyboard,
    bool? one_time,
    bool? is_personal,
    String? input_field_placeholder,
  }) {
    try {
      return TdlibFunction({
        "@type": "replyMarkupShowKeyboard",
        "rows": rows!.toJson(),
        "resize_keyboard": resize_keyboard,
        "one_time": one_time,
        "is_personal": is_personal,
        "input_field_placeholder": input_field_placeholder,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method replyMarkupShowKeyboard",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1replyMarkupInlineKeyboard.html).
  factory TdlibFunction.replyMarkupInlineKeyboard({
    TdlibFunction? rows,
  }) {
    try {
      return TdlibFunction({
        "@type": "replyMarkupInlineKeyboard",
        "rows": rows!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method replyMarkupInlineKeyboard",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1loginUrlInfoOpen.html).
  factory TdlibFunction.loginUrlInfoOpen({
    String? url,
    bool? skip_confirm,
  }) {
    try {
      return TdlibFunction({
        "@type": "loginUrlInfoOpen",
        "url": url,
        "skip_confirm": skip_confirm,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method loginUrlInfoOpen",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1loginUrlInfoRequestConfirmation.html).
  factory TdlibFunction.loginUrlInfoRequestConfirmation({
    String? url,
    String? domain,
    int? bot_user_id,
    bool? request_write_access,
  }) {
    try {
      return TdlibFunction({
        "@type": "loginUrlInfoRequestConfirmation",
        "url": url,
        "domain": domain,
        "bot_user_id": bot_user_id,
        "request_write_access": request_write_access,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method loginUrlInfoRequestConfirmation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1webAppInfo.html).
  factory TdlibFunction.webAppInfo({
    int? launch_id,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "webAppInfo",
        "launch_id": launch_id,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method webAppInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageThreadInfo.html).
  factory TdlibFunction.messageThreadInfo({
    int? chat_id,
    int? message_thread_id,
    TdlibFunction? reply_info,
    int? unread_message_count,
    TdlibFunction? messages,
    TdlibFunction? draft_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageThreadInfo",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "reply_info": reply_info!.toJson(),
        "unread_message_count": unread_message_count,
        "messages": messages!.toJson(),
        "draft_message": draft_message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageThreadInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextPlain.html).
  factory TdlibFunction.richTextPlain({
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextPlain",
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextPlain",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextBold.html).
  factory TdlibFunction.richTextBold({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextBold",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextBold",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextItalic.html).
  factory TdlibFunction.richTextItalic({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextItalic",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextItalic",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextUnderline.html).
  factory TdlibFunction.richTextUnderline({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextUnderline",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextUnderline",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextStrikethrough.html).
  factory TdlibFunction.richTextStrikethrough({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextStrikethrough",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextStrikethrough",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextFixed.html).
  factory TdlibFunction.richTextFixed({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextFixed",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextFixed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextUrl.html).
  factory TdlibFunction.richTextUrl({
    TdlibFunction? text,
    String? url,
    bool? is_cached,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextUrl",
        "text": text!.toJson(),
        "url": url,
        "is_cached": is_cached,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextEmailAddress.html).
  factory TdlibFunction.richTextEmailAddress({
    TdlibFunction? text,
    String? email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextEmailAddress",
        "text": text!.toJson(),
        "email_address": email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextSubscript.html).
  factory TdlibFunction.richTextSubscript({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextSubscript",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextSubscript",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextSuperscript.html).
  factory TdlibFunction.richTextSuperscript({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextSuperscript",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextSuperscript",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextMarked.html).
  factory TdlibFunction.richTextMarked({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextMarked",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextMarked",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextPhoneNumber.html).
  factory TdlibFunction.richTextPhoneNumber({
    TdlibFunction? text,
    String? phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextPhoneNumber",
        "text": text!.toJson(),
        "phone_number": phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextIcon.html).
  factory TdlibFunction.richTextIcon({
    TdlibFunction? document,
    int? width,
    int? height,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextIcon",
        "document": document!.toJson(),
        "width": width,
        "height": height,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextIcon",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextReference.html).
  factory TdlibFunction.richTextReference({
    TdlibFunction? text,
    String? anchor_name,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextReference",
        "text": text!.toJson(),
        "anchor_name": anchor_name,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextReference",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextAnchor.html).
  factory TdlibFunction.richTextAnchor({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextAnchor",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextAnchor",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTextAnchorLink.html).
  factory TdlibFunction.richTextAnchorLink({
    TdlibFunction? text,
    String? anchor_name,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTextAnchorLink",
        "text": text!.toJson(),
        "anchor_name": anchor_name,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTextAnchorLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1richTexts.html).
  factory TdlibFunction.richTexts({
    TdlibFunction? texts,
  }) {
    try {
      return TdlibFunction({
        "@type": "richTexts",
        "texts": texts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method richTexts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockCaption.html).
  factory TdlibFunction.pageBlockCaption({
    TdlibFunction? text,
    TdlibFunction? credit,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockCaption",
        "text": text!.toJson(),
        "credit": credit!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockCaption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockListItem.html).
  factory TdlibFunction.pageBlockListItem({
    String? label,
    TdlibFunction? page_blocks,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockListItem",
        "label": label,
        "page_blocks": page_blocks!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockListItem",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockHorizontalAlignmentLeft.html).
  factory TdlibFunction.pageBlockHorizontalAlignmentLeft() {
    try {
      return TdlibFunction({
        "@type": "pageBlockHorizontalAlignmentLeft",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockHorizontalAlignmentLeft",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockHorizontalAlignmentCenter.html).
  factory TdlibFunction.pageBlockHorizontalAlignmentCenter() {
    try {
      return TdlibFunction({
        "@type": "pageBlockHorizontalAlignmentCenter",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockHorizontalAlignmentCenter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockHorizontalAlignmentRight.html).
  factory TdlibFunction.pageBlockHorizontalAlignmentRight() {
    try {
      return TdlibFunction({
        "@type": "pageBlockHorizontalAlignmentRight",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockHorizontalAlignmentRight",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockVerticalAlignmentTop.html).
  factory TdlibFunction.pageBlockVerticalAlignmentTop() {
    try {
      return TdlibFunction({
        "@type": "pageBlockVerticalAlignmentTop",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockVerticalAlignmentTop",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockVerticalAlignmentMiddle.html).
  factory TdlibFunction.pageBlockVerticalAlignmentMiddle() {
    try {
      return TdlibFunction({
        "@type": "pageBlockVerticalAlignmentMiddle",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockVerticalAlignmentMiddle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockVerticalAlignmentBottom.html).
  factory TdlibFunction.pageBlockVerticalAlignmentBottom() {
    try {
      return TdlibFunction({
        "@type": "pageBlockVerticalAlignmentBottom",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockVerticalAlignmentBottom",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockTableCell.html).
  factory TdlibFunction.pageBlockTableCell({
    TdlibFunction? text,
    bool? is_header,
    int? colspan,
    int? rowspan,
    TdlibFunction? align,
    TdlibFunction? valign,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockTableCell",
        "text": text!.toJson(),
        "is_header": is_header,
        "colspan": colspan,
        "rowspan": rowspan,
        "align": align!.toJson(),
        "valign": valign!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockTableCell",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockRelatedArticle.html).
  factory TdlibFunction.pageBlockRelatedArticle({
    String? url,
    String? title,
    String? description,
    TdlibFunction? photo,
    String? author,
    int? publish_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockRelatedArticle",
        "url": url,
        "title": title,
        "description": description,
        "photo": photo!.toJson(),
        "author": author,
        "publish_date": publish_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockRelatedArticle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockTitle.html).
  factory TdlibFunction.pageBlockTitle({
    TdlibFunction? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockTitle",
        "title": title!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockTitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockSubtitle.html).
  factory TdlibFunction.pageBlockSubtitle({
    TdlibFunction? subtitle,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockSubtitle",
        "subtitle": subtitle!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockSubtitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockAuthorDate.html).
  factory TdlibFunction.pageBlockAuthorDate({
    TdlibFunction? author,
    int? publish_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockAuthorDate",
        "author": author!.toJson(),
        "publish_date": publish_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockAuthorDate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockHeader.html).
  factory TdlibFunction.pageBlockHeader({
    TdlibFunction? header,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockHeader",
        "header": header!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockHeader",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockSubheader.html).
  factory TdlibFunction.pageBlockSubheader({
    TdlibFunction? subheader,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockSubheader",
        "subheader": subheader!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockSubheader",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockKicker.html).
  factory TdlibFunction.pageBlockKicker({
    TdlibFunction? kicker,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockKicker",
        "kicker": kicker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockKicker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockParagraph.html).
  factory TdlibFunction.pageBlockParagraph({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockParagraph",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockParagraph",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockPreformatted.html).
  factory TdlibFunction.pageBlockPreformatted({
    TdlibFunction? text,
    String? language,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockPreformatted",
        "text": text!.toJson(),
        "language": language,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockPreformatted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockFooter.html).
  factory TdlibFunction.pageBlockFooter({
    TdlibFunction? footer,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockFooter",
        "footer": footer!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockFooter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockDivider.html).
  factory TdlibFunction.pageBlockDivider() {
    try {
      return TdlibFunction({
        "@type": "pageBlockDivider",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockDivider",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockAnchor.html).
  factory TdlibFunction.pageBlockAnchor({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockAnchor",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockAnchor",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockList.html).
  factory TdlibFunction.pageBlockList({
    TdlibFunction? items,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockList",
        "items": items!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockList",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockBlockQuote.html).
  factory TdlibFunction.pageBlockBlockQuote({
    TdlibFunction? text,
    TdlibFunction? credit,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockBlockQuote",
        "text": text!.toJson(),
        "credit": credit!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockBlockQuote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockPullQuote.html).
  factory TdlibFunction.pageBlockPullQuote({
    TdlibFunction? text,
    TdlibFunction? credit,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockPullQuote",
        "text": text!.toJson(),
        "credit": credit!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockPullQuote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockAnimation.html).
  factory TdlibFunction.pageBlockAnimation({
    TdlibFunction? animation,
    TdlibFunction? caption,
    bool? need_autoplay,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockAnimation",
        "animation": animation!.toJson(),
        "caption": caption!.toJson(),
        "need_autoplay": need_autoplay,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockAudio.html).
  factory TdlibFunction.pageBlockAudio({
    TdlibFunction? audio,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockAudio",
        "audio": audio!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockPhoto.html).
  factory TdlibFunction.pageBlockPhoto({
    TdlibFunction? photo,
    TdlibFunction? caption,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockPhoto",
        "photo": photo!.toJson(),
        "caption": caption!.toJson(),
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockVideo.html).
  factory TdlibFunction.pageBlockVideo({
    TdlibFunction? video,
    TdlibFunction? caption,
    bool? need_autoplay,
    bool? is_looped,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockVideo",
        "video": video!.toJson(),
        "caption": caption!.toJson(),
        "need_autoplay": need_autoplay,
        "is_looped": is_looped,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockVoiceNote.html).
  factory TdlibFunction.pageBlockVoiceNote({
    TdlibFunction? voice_note,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockVoiceNote",
        "voice_note": voice_note!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockCover.html).
  factory TdlibFunction.pageBlockCover({
    TdlibFunction? cover,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockCover",
        "cover": cover!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockCover",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockEmbedded.html).
  factory TdlibFunction.pageBlockEmbedded({
    String? url,
    String? html,
    TdlibFunction? poster_photo,
    int? width,
    int? height,
    TdlibFunction? caption,
    bool? is_full_width,
    bool? allow_scrolling,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockEmbedded",
        "url": url,
        "html": html,
        "poster_photo": poster_photo!.toJson(),
        "width": width,
        "height": height,
        "caption": caption!.toJson(),
        "is_full_width": is_full_width,
        "allow_scrolling": allow_scrolling,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockEmbedded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockEmbeddedPost.html).
  factory TdlibFunction.pageBlockEmbeddedPost({
    String? url,
    String? author,
    TdlibFunction? author_photo,
    int? date,
    TdlibFunction? page_blocks,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockEmbeddedPost",
        "url": url,
        "author": author,
        "author_photo": author_photo!.toJson(),
        "date": date,
        "page_blocks": page_blocks!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockEmbeddedPost",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockCollage.html).
  factory TdlibFunction.pageBlockCollage({
    TdlibFunction? page_blocks,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockCollage",
        "page_blocks": page_blocks!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockCollage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockSlideshow.html).
  factory TdlibFunction.pageBlockSlideshow({
    TdlibFunction? page_blocks,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockSlideshow",
        "page_blocks": page_blocks!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockSlideshow",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockChatLink.html).
  factory TdlibFunction.pageBlockChatLink({
    String? title,
    TdlibFunction? photo,
    String? username,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockChatLink",
        "title": title,
        "photo": photo!.toJson(),
        "username": username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockChatLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockTable.html).
  factory TdlibFunction.pageBlockTable({
    TdlibFunction? caption,
    TdlibFunction? cells,
    bool? is_bordered,
    bool? is_striped,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockTable",
        "caption": caption!.toJson(),
        "cells": cells!.toJson(),
        "is_bordered": is_bordered,
        "is_striped": is_striped,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockTable",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockDetails.html).
  factory TdlibFunction.pageBlockDetails({
    TdlibFunction? header,
    TdlibFunction? page_blocks,
    bool? is_open,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockDetails",
        "header": header!.toJson(),
        "page_blocks": page_blocks!.toJson(),
        "is_open": is_open,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockDetails",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockRelatedArticles.html).
  factory TdlibFunction.pageBlockRelatedArticles({
    TdlibFunction? header,
    TdlibFunction? articles,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockRelatedArticles",
        "header": header!.toJson(),
        "articles": articles!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockRelatedArticles",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pageBlockMap.html).
  factory TdlibFunction.pageBlockMap({
    TdlibFunction? location,
    int? zoom,
    int? width,
    int? height,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "pageBlockMap",
        "location": location!.toJson(),
        "zoom": zoom,
        "width": width,
        "height": height,
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pageBlockMap",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1webPageInstantView.html).
  factory TdlibFunction.webPageInstantView({
    TdlibFunction? page_blocks,
    int? view_count,
    int? version,
    bool? is_rtl,
    bool? is_full,
    TdlibFunction? feedback_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "webPageInstantView",
        "page_blocks": page_blocks!.toJson(),
        "view_count": view_count,
        "version": version,
        "is_rtl": is_rtl,
        "is_full": is_full,
        "feedback_link": feedback_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method webPageInstantView",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1webPage.html).
  factory TdlibFunction.webPage({
    String? url,
    String? display_url,
    String? type,
    String? site_name,
    String? title,
    TdlibFunction? description,
    TdlibFunction? photo,
    String? embed_url,
    String? embed_type,
    int? embed_width,
    int? embed_height,
    int? duration,
    String? author,
    TdlibFunction? animation,
    TdlibFunction? audio,
    TdlibFunction? document,
    TdlibFunction? sticker,
    TdlibFunction? video,
    TdlibFunction? video_note,
    TdlibFunction? voice_note,
    int? instant_view_version,
  }) {
    try {
      return TdlibFunction({
        "@type": "webPage",
        "url": url,
        "display_url": display_url,
        "type": type,
        "site_name": site_name,
        "title": title,
        "description": description!.toJson(),
        "photo": photo!.toJson(),
        "embed_url": embed_url,
        "embed_type": embed_type,
        "embed_width": embed_width,
        "embed_height": embed_height,
        "duration": duration,
        "author": author,
        "animation": animation!.toJson(),
        "audio": audio!.toJson(),
        "document": document!.toJson(),
        "sticker": sticker!.toJson(),
        "video": video!.toJson(),
        "video_note": video_note!.toJson(),
        "voice_note": voice_note!.toJson(),
        "instant_view_version": instant_view_version,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method webPage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1countryInfo.html).
  factory TdlibFunction.countryInfo({
    String? country_code,
    String? name,
    String? english_name,
    bool? is_hidden,
    List<String>? calling_codes,
  }) {
    try {
      return TdlibFunction({
        "@type": "countryInfo",
        "country_code": country_code,
        "name": name,
        "english_name": english_name,
        "is_hidden": is_hidden,
        "calling_codes": calling_codes,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method countryInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1countries.html).
  factory TdlibFunction.countries({
    TdlibFunction? countries,
  }) {
    try {
      return TdlibFunction({
        "@type": "countries",
        "countries": countries!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method countries",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1phoneNumberInfo.html).
  factory TdlibFunction.phoneNumberInfo({
    TdlibFunction? country,
    String? country_calling_code,
    String? formatted_phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "phoneNumberInfo",
        "country": country!.toJson(),
        "country_calling_code": country_calling_code,
        "formatted_phone_number": formatted_phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method phoneNumberInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1bankCardActionOpenUrl.html).
  factory TdlibFunction.bankCardActionOpenUrl({
    String? text,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "bankCardActionOpenUrl",
        "text": text,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method bankCardActionOpenUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1bankCardInfo.html).
  factory TdlibFunction.bankCardInfo({
    String? title,
    TdlibFunction? actions,
  }) {
    try {
      return TdlibFunction({
        "@type": "bankCardInfo",
        "title": title,
        "actions": actions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method bankCardInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1address.html).
  factory TdlibFunction.address({
    String? country_code,
    String? state,
    String? city,
    String? street_line1,
    String? street_line2,
    String? postal_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "address",
        "country_code": country_code,
        "state": state,
        "city": city,
        "street_line1": street_line1,
        "street_line2": street_line2,
        "postal_code": postal_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method address",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1themeParameters.html).
  factory TdlibFunction.themeParameters({
    int? background_color,
    int? secondary_background_color,
    int? text_color,
    int? hint_color,
    int? link_color,
    int? button_color,
    int? button_text_color,
  }) {
    try {
      return TdlibFunction({
        "@type": "themeParameters",
        "background_color": background_color,
        "secondary_background_color": secondary_background_color,
        "text_color": text_color,
        "hint_color": hint_color,
        "link_color": link_color,
        "button_color": button_color,
        "button_text_color": button_text_color,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method themeParameters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1labeledPricePart.html).
  factory TdlibFunction.labeledPricePart({
    String? label,
    int? amount,
  }) {
    try {
      return TdlibFunction({
        "@type": "labeledPricePart",
        "label": label,
        "amount": amount,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method labeledPricePart",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1invoice.html).
  factory TdlibFunction.invoice({
    String? currency,
    TdlibFunction? price_parts,
    int? max_tip_amount,
    List<int>? suggested_tip_amounts,
    String? recurring_payment_terms_of_service_url,
    bool? is_test,
    bool? need_name,
    bool? need_phone_number,
    bool? need_email_address,
    bool? need_shipping_address,
    bool? send_phone_number_to_provider,
    bool? send_email_address_to_provider,
    bool? is_flexible,
  }) {
    try {
      return TdlibFunction({
        "@type": "invoice",
        "currency": currency,
        "price_parts": price_parts!.toJson(),
        "max_tip_amount": max_tip_amount,
        "suggested_tip_amounts": suggested_tip_amounts,
        "recurring_payment_terms_of_service_url": recurring_payment_terms_of_service_url,
        "is_test": is_test,
        "need_name": need_name,
        "need_phone_number": need_phone_number,
        "need_email_address": need_email_address,
        "need_shipping_address": need_shipping_address,
        "send_phone_number_to_provider": send_phone_number_to_provider,
        "send_email_address_to_provider": send_email_address_to_provider,
        "is_flexible": is_flexible,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method invoice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1orderInfo.html).
  factory TdlibFunction.orderInfo({
    String? name,
    String? phone_number,
    String? email_address,
    TdlibFunction? shipping_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "orderInfo",
        "name": name,
        "phone_number": phone_number,
        "email_address": email_address,
        "shipping_address": shipping_address!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method orderInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1shippingOption.html).
  factory TdlibFunction.shippingOption({
    String? id,
    String? title,
    TdlibFunction? price_parts,
  }) {
    try {
      return TdlibFunction({
        "@type": "shippingOption",
        "id": id,
        "title": title,
        "price_parts": price_parts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method shippingOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1savedCredentials.html).
  factory TdlibFunction.savedCredentials({
    String? id,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "savedCredentials",
        "id": id,
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method savedCredentials",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputCredentialsSaved.html).
  factory TdlibFunction.inputCredentialsSaved({
    String? saved_credentials_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputCredentialsSaved",
        "saved_credentials_id": saved_credentials_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputCredentialsSaved",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputCredentialsNew.html).
  factory TdlibFunction.inputCredentialsNew({
    String? data,
    bool? allow_save,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputCredentialsNew",
        "data": data,
        "allow_save": allow_save,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputCredentialsNew",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputCredentialsApplePay.html).
  factory TdlibFunction.inputCredentialsApplePay({
    String? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputCredentialsApplePay",
        "data": data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputCredentialsApplePay",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputCredentialsGooglePay.html).
  factory TdlibFunction.inputCredentialsGooglePay({
    String? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputCredentialsGooglePay",
        "data": data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputCredentialsGooglePay",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentProviderSmartGlocal.html).
  factory TdlibFunction.paymentProviderSmartGlocal({
    String? public_token,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentProviderSmartGlocal",
        "public_token": public_token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentProviderSmartGlocal",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentProviderStripe.html).
  factory TdlibFunction.paymentProviderStripe({
    String? publishable_key,
    bool? need_country,
    bool? need_postal_code,
    bool? need_cardholder_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentProviderStripe",
        "publishable_key": publishable_key,
        "need_country": need_country,
        "need_postal_code": need_postal_code,
        "need_cardholder_name": need_cardholder_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentProviderStripe",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentProviderOther.html).
  factory TdlibFunction.paymentProviderOther({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentProviderOther",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentProviderOther",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentOption.html).
  factory TdlibFunction.paymentOption({
    String? title,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentOption",
        "title": title,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentForm.html).
  factory TdlibFunction.paymentForm({
    int? id,
    TdlibFunction? invoice,
    int? seller_bot_user_id,
    int? payment_provider_user_id,
    TdlibFunction? payment_provider,
    TdlibFunction? additional_payment_options,
    TdlibFunction? saved_order_info,
    TdlibFunction? saved_credentials,
    bool? can_save_credentials,
    bool? need_password,
    String? product_title,
    TdlibFunction? product_description,
    TdlibFunction? product_photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentForm",
        "id": id,
        "invoice": invoice!.toJson(),
        "seller_bot_user_id": seller_bot_user_id,
        "payment_provider_user_id": payment_provider_user_id,
        "payment_provider": payment_provider!.toJson(),
        "additional_payment_options": additional_payment_options!.toJson(),
        "saved_order_info": saved_order_info!.toJson(),
        "saved_credentials": saved_credentials!.toJson(),
        "can_save_credentials": can_save_credentials,
        "need_password": need_password,
        "product_title": product_title,
        "product_description": product_description!.toJson(),
        "product_photo": product_photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentForm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1validatedOrderInfo.html).
  factory TdlibFunction.validatedOrderInfo({
    String? order_info_id,
    TdlibFunction? shipping_options,
  }) {
    try {
      return TdlibFunction({
        "@type": "validatedOrderInfo",
        "order_info_id": order_info_id,
        "shipping_options": shipping_options!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method validatedOrderInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentResult.html).
  factory TdlibFunction.paymentResult({
    bool? success,
    String? verification_url,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentResult",
        "success": success,
        "verification_url": verification_url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentResult",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1paymentReceipt.html).
  factory TdlibFunction.paymentReceipt({
    String? title,
    TdlibFunction? description,
    TdlibFunction? photo,
    int? date,
    int? seller_bot_user_id,
    int? payment_provider_user_id,
    TdlibFunction? invoice,
    TdlibFunction? order_info,
    TdlibFunction? shipping_option,
    String? credentials_title,
    int? tip_amount,
  }) {
    try {
      return TdlibFunction({
        "@type": "paymentReceipt",
        "title": title,
        "description": description!.toJson(),
        "photo": photo!.toJson(),
        "date": date,
        "seller_bot_user_id": seller_bot_user_id,
        "payment_provider_user_id": payment_provider_user_id,
        "invoice": invoice!.toJson(),
        "order_info": order_info!.toJson(),
        "shipping_option": shipping_option!.toJson(),
        "credentials_title": credentials_title,
        "tip_amount": tip_amount,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method paymentReceipt",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInvoiceMessage.html).
  factory TdlibFunction.inputInvoiceMessage({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInvoiceMessage",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInvoiceMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInvoiceName.html).
  factory TdlibFunction.inputInvoiceName({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInvoiceName",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInvoiceName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageExtendedMediaPreview.html).
  factory TdlibFunction.messageExtendedMediaPreview({
    int? width,
    int? height,
    int? duration,
    TdlibFunction? minithumbnail,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageExtendedMediaPreview",
        "width": width,
        "height": height,
        "duration": duration,
        "minithumbnail": minithumbnail!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageExtendedMediaPreview",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageExtendedMediaPhoto.html).
  factory TdlibFunction.messageExtendedMediaPhoto({
    TdlibFunction? photo,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageExtendedMediaPhoto",
        "photo": photo!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageExtendedMediaPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageExtendedMediaVideo.html).
  factory TdlibFunction.messageExtendedMediaVideo({
    TdlibFunction? video,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageExtendedMediaVideo",
        "video": video!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageExtendedMediaVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageExtendedMediaUnsupported.html).
  factory TdlibFunction.messageExtendedMediaUnsupported({
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageExtendedMediaUnsupported",
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageExtendedMediaUnsupported",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1datedFile.html).
  factory TdlibFunction.datedFile({
    TdlibFunction? file,
    int? date,
  }) {
    try {
      return TdlibFunction({
        "@type": "datedFile",
        "file": file!.toJson(),
        "date": date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method datedFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypePersonalDetails.html).
  factory TdlibFunction.passportElementTypePersonalDetails() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypePersonalDetails",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypePersonalDetails",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypePassport.html).
  factory TdlibFunction.passportElementTypePassport() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypePassport",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypePassport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeDriverLicense.html).
  factory TdlibFunction.passportElementTypeDriverLicense() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeDriverLicense",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeDriverLicense",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeIdentityCard.html).
  factory TdlibFunction.passportElementTypeIdentityCard() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeIdentityCard",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeIdentityCard",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeInternalPassport.html).
  factory TdlibFunction.passportElementTypeInternalPassport() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeInternalPassport",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeInternalPassport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeAddress.html).
  factory TdlibFunction.passportElementTypeAddress() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeAddress",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeUtilityBill.html).
  factory TdlibFunction.passportElementTypeUtilityBill() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeUtilityBill",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeUtilityBill",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeBankStatement.html).
  factory TdlibFunction.passportElementTypeBankStatement() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeBankStatement",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeBankStatement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeRentalAgreement.html).
  factory TdlibFunction.passportElementTypeRentalAgreement() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeRentalAgreement",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeRentalAgreement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypePassportRegistration.html).
  factory TdlibFunction.passportElementTypePassportRegistration() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypePassportRegistration",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypePassportRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeTemporaryRegistration.html).
  factory TdlibFunction.passportElementTypeTemporaryRegistration() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeTemporaryRegistration",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeTemporaryRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypePhoneNumber.html).
  factory TdlibFunction.passportElementTypePhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypePhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypePhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTypeEmailAddress.html).
  factory TdlibFunction.passportElementTypeEmailAddress() {
    try {
      return TdlibFunction({
        "@type": "passportElementTypeEmailAddress",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTypeEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1date.html).
  factory TdlibFunction.date({
    int? day,
    int? month,
    int? year,
  }) {
    try {
      return TdlibFunction({
        "@type": "date",
        "day": day,
        "month": month,
        "year": year,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method date",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1personalDetails.html).
  factory TdlibFunction.personalDetails({
    String? first_name,
    String? middle_name,
    String? last_name,
    String? native_first_name,
    String? native_middle_name,
    String? native_last_name,
    TdlibFunction? birthdate,
    String? gender,
    String? country_code,
    String? residence_country_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "personalDetails",
        "first_name": first_name,
        "middle_name": middle_name,
        "last_name": last_name,
        "native_first_name": native_first_name,
        "native_middle_name": native_middle_name,
        "native_last_name": native_last_name,
        "birthdate": birthdate!.toJson(),
        "gender": gender,
        "country_code": country_code,
        "residence_country_code": residence_country_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method personalDetails",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1identityDocument.html).
  factory TdlibFunction.identityDocument({
    String? number,
    TdlibFunction? expiry_date,
    TdlibFunction? front_side,
    TdlibFunction? reverse_side,
    TdlibFunction? selfie,
    TdlibFunction? translation,
  }) {
    try {
      return TdlibFunction({
        "@type": "identityDocument",
        "number": number,
        "expiry_date": expiry_date!.toJson(),
        "front_side": front_side!.toJson(),
        "reverse_side": reverse_side!.toJson(),
        "selfie": selfie!.toJson(),
        "translation": translation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method identityDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputIdentityDocument.html).
  factory TdlibFunction.inputIdentityDocument({
    String? number,
    TdlibFunction? expiry_date,
    TdlibFunction? front_side,
    TdlibFunction? reverse_side,
    TdlibFunction? selfie,
    TdlibFunction? translation,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputIdentityDocument",
        "number": number,
        "expiry_date": expiry_date!.toJson(),
        "front_side": front_side!.toJson(),
        "reverse_side": reverse_side!.toJson(),
        "selfie": selfie!.toJson(),
        "translation": translation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputIdentityDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1personalDocument.html).
  factory TdlibFunction.personalDocument({
    TdlibFunction? files,
    TdlibFunction? translation,
  }) {
    try {
      return TdlibFunction({
        "@type": "personalDocument",
        "files": files!.toJson(),
        "translation": translation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method personalDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPersonalDocument.html).
  factory TdlibFunction.inputPersonalDocument({
    TdlibFunction? files,
    TdlibFunction? translation,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPersonalDocument",
        "files": files!.toJson(),
        "translation": translation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPersonalDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementPersonalDetails.html).
  factory TdlibFunction.passportElementPersonalDetails({
    TdlibFunction? personal_details,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementPersonalDetails",
        "personal_details": personal_details!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementPersonalDetails",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementPassport.html).
  factory TdlibFunction.passportElementPassport({
    TdlibFunction? passport,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementPassport",
        "passport": passport!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementPassport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementDriverLicense.html).
  factory TdlibFunction.passportElementDriverLicense({
    TdlibFunction? driver_license,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementDriverLicense",
        "driver_license": driver_license!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementDriverLicense",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementIdentityCard.html).
  factory TdlibFunction.passportElementIdentityCard({
    TdlibFunction? identity_card,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementIdentityCard",
        "identity_card": identity_card!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementIdentityCard",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementInternalPassport.html).
  factory TdlibFunction.passportElementInternalPassport({
    TdlibFunction? internal_passport,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementInternalPassport",
        "internal_passport": internal_passport!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementInternalPassport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementAddress.html).
  factory TdlibFunction.passportElementAddress({
    TdlibFunction? address,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementAddress",
        "address": address!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementUtilityBill.html).
  factory TdlibFunction.passportElementUtilityBill({
    TdlibFunction? utility_bill,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementUtilityBill",
        "utility_bill": utility_bill!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementUtilityBill",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementBankStatement.html).
  factory TdlibFunction.passportElementBankStatement({
    TdlibFunction? bank_statement,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementBankStatement",
        "bank_statement": bank_statement!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementBankStatement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementRentalAgreement.html).
  factory TdlibFunction.passportElementRentalAgreement({
    TdlibFunction? rental_agreement,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementRentalAgreement",
        "rental_agreement": rental_agreement!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementRentalAgreement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementPassportRegistration.html).
  factory TdlibFunction.passportElementPassportRegistration({
    TdlibFunction? passport_registration,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementPassportRegistration",
        "passport_registration": passport_registration!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementPassportRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementTemporaryRegistration.html).
  factory TdlibFunction.passportElementTemporaryRegistration({
    TdlibFunction? temporary_registration,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementTemporaryRegistration",
        "temporary_registration": temporary_registration!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementTemporaryRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementPhoneNumber.html).
  factory TdlibFunction.passportElementPhoneNumber({
    String? phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementPhoneNumber",
        "phone_number": phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementEmailAddress.html).
  factory TdlibFunction.passportElementEmailAddress({
    String? email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementEmailAddress",
        "email_address": email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementPersonalDetails.html).
  factory TdlibFunction.inputPassportElementPersonalDetails({
    TdlibFunction? personal_details,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementPersonalDetails",
        "personal_details": personal_details!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementPersonalDetails",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementPassport.html).
  factory TdlibFunction.inputPassportElementPassport({
    TdlibFunction? passport,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementPassport",
        "passport": passport!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementPassport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementDriverLicense.html).
  factory TdlibFunction.inputPassportElementDriverLicense({
    TdlibFunction? driver_license,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementDriverLicense",
        "driver_license": driver_license!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementDriverLicense",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementIdentityCard.html).
  factory TdlibFunction.inputPassportElementIdentityCard({
    TdlibFunction? identity_card,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementIdentityCard",
        "identity_card": identity_card!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementIdentityCard",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementInternalPassport.html).
  factory TdlibFunction.inputPassportElementInternalPassport({
    TdlibFunction? internal_passport,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementInternalPassport",
        "internal_passport": internal_passport!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementInternalPassport",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementAddress.html).
  factory TdlibFunction.inputPassportElementAddress({
    TdlibFunction? address,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementAddress",
        "address": address!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementUtilityBill.html).
  factory TdlibFunction.inputPassportElementUtilityBill({
    TdlibFunction? utility_bill,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementUtilityBill",
        "utility_bill": utility_bill!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementUtilityBill",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementBankStatement.html).
  factory TdlibFunction.inputPassportElementBankStatement({
    TdlibFunction? bank_statement,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementBankStatement",
        "bank_statement": bank_statement!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementBankStatement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementRentalAgreement.html).
  factory TdlibFunction.inputPassportElementRentalAgreement({
    TdlibFunction? rental_agreement,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementRentalAgreement",
        "rental_agreement": rental_agreement!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementRentalAgreement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementPassportRegistration.html).
  factory TdlibFunction.inputPassportElementPassportRegistration({
    TdlibFunction? passport_registration,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementPassportRegistration",
        "passport_registration": passport_registration!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementPassportRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementTemporaryRegistration.html).
  factory TdlibFunction.inputPassportElementTemporaryRegistration({
    TdlibFunction? temporary_registration,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementTemporaryRegistration",
        "temporary_registration": temporary_registration!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementTemporaryRegistration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementPhoneNumber.html).
  factory TdlibFunction.inputPassportElementPhoneNumber({
    String? phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementPhoneNumber",
        "phone_number": phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementEmailAddress.html).
  factory TdlibFunction.inputPassportElementEmailAddress({
    String? email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementEmailAddress",
        "email_address": email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElements.html).
  factory TdlibFunction.passportElements({
    TdlibFunction? elements,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElements",
        "elements": elements!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElements",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceUnspecified.html).
  factory TdlibFunction.passportElementErrorSourceUnspecified() {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceUnspecified",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceUnspecified",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceDataField.html).
  factory TdlibFunction.passportElementErrorSourceDataField({
    String? field_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceDataField",
        "field_name": field_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceDataField",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceFrontSide.html).
  factory TdlibFunction.passportElementErrorSourceFrontSide() {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceFrontSide",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceFrontSide",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceReverseSide.html).
  factory TdlibFunction.passportElementErrorSourceReverseSide() {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceReverseSide",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceReverseSide",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceSelfie.html).
  factory TdlibFunction.passportElementErrorSourceSelfie() {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceSelfie",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceSelfie",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceTranslationFile.html).
  factory TdlibFunction.passportElementErrorSourceTranslationFile({
    int? file_index,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceTranslationFile",
        "file_index": file_index,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceTranslationFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceTranslationFiles.html).
  factory TdlibFunction.passportElementErrorSourceTranslationFiles() {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceTranslationFiles",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceTranslationFiles",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceFile.html).
  factory TdlibFunction.passportElementErrorSourceFile({
    int? file_index,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceFile",
        "file_index": file_index,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementErrorSourceFiles.html).
  factory TdlibFunction.passportElementErrorSourceFiles() {
    try {
      return TdlibFunction({
        "@type": "passportElementErrorSourceFiles",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementErrorSourceFiles",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementError.html).
  factory TdlibFunction.passportElementError({
    TdlibFunction? type,
    String? message,
    TdlibFunction? source,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementError",
        "type": type!.toJson(),
        "message": message,
        "source": source!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementError",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportSuitableElement.html).
  factory TdlibFunction.passportSuitableElement({
    TdlibFunction? type,
    bool? is_selfie_required,
    bool? is_translation_required,
    bool? is_native_name_required,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportSuitableElement",
        "type": type!.toJson(),
        "is_selfie_required": is_selfie_required,
        "is_translation_required": is_translation_required,
        "is_native_name_required": is_native_name_required,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportSuitableElement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportRequiredElement.html).
  factory TdlibFunction.passportRequiredElement({
    TdlibFunction? suitable_elements,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportRequiredElement",
        "suitable_elements": suitable_elements!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportRequiredElement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportAuthorizationForm.html).
  factory TdlibFunction.passportAuthorizationForm({
    int? id,
    TdlibFunction? required_elements,
    String? privacy_policy_url,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportAuthorizationForm",
        "id": id,
        "required_elements": required_elements!.toJson(),
        "privacy_policy_url": privacy_policy_url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportAuthorizationForm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1passportElementsWithErrors.html).
  factory TdlibFunction.passportElementsWithErrors({
    TdlibFunction? elements,
    TdlibFunction? errors,
  }) {
    try {
      return TdlibFunction({
        "@type": "passportElementsWithErrors",
        "elements": elements!.toJson(),
        "errors": errors!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method passportElementsWithErrors",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1encryptedCredentials.html).
  factory TdlibFunction.encryptedCredentials({
    TdlibFunction? data,
    TdlibFunction? hash,
    TdlibFunction? secret,
  }) {
    try {
      return TdlibFunction({
        "@type": "encryptedCredentials",
        "data": data!.toJson(),
        "hash": hash!.toJson(),
        "secret": secret!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method encryptedCredentials",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1encryptedPassportElement.html).
  factory TdlibFunction.encryptedPassportElement({
    TdlibFunction? type,
    TdlibFunction? data,
    TdlibFunction? front_side,
    TdlibFunction? reverse_side,
    TdlibFunction? selfie,
    TdlibFunction? translation,
    TdlibFunction? files,
    String? value,
    String? hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "encryptedPassportElement",
        "type": type!.toJson(),
        "data": data!.toJson(),
        "front_side": front_side!.toJson(),
        "reverse_side": reverse_side!.toJson(),
        "selfie": selfie!.toJson(),
        "translation": translation!.toJson(),
        "files": files!.toJson(),
        "value": value,
        "hash": hash,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method encryptedPassportElement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceUnspecified.html).
  factory TdlibFunction.inputPassportElementErrorSourceUnspecified({
    TdlibFunction? element_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceUnspecified",
        "element_hash": element_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceUnspecified",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceDataField.html).
  factory TdlibFunction.inputPassportElementErrorSourceDataField({
    String? field_name,
    TdlibFunction? data_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceDataField",
        "field_name": field_name,
        "data_hash": data_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceDataField",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceFrontSide.html).
  factory TdlibFunction.inputPassportElementErrorSourceFrontSide({
    TdlibFunction? file_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceFrontSide",
        "file_hash": file_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceFrontSide",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceReverseSide.html).
  factory TdlibFunction.inputPassportElementErrorSourceReverseSide({
    TdlibFunction? file_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceReverseSide",
        "file_hash": file_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceReverseSide",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceSelfie.html).
  factory TdlibFunction.inputPassportElementErrorSourceSelfie({
    TdlibFunction? file_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceSelfie",
        "file_hash": file_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceSelfie",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceTranslationFile.html).
  factory TdlibFunction.inputPassportElementErrorSourceTranslationFile({
    TdlibFunction? file_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceTranslationFile",
        "file_hash": file_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceTranslationFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceTranslationFiles.html).
  factory TdlibFunction.inputPassportElementErrorSourceTranslationFiles({
    TdlibFunction? file_hashes,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceTranslationFiles",
        "file_hashes": file_hashes!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceTranslationFiles",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceFile.html).
  factory TdlibFunction.inputPassportElementErrorSourceFile({
    TdlibFunction? file_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceFile",
        "file_hash": file_hash!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementErrorSourceFiles.html).
  factory TdlibFunction.inputPassportElementErrorSourceFiles({
    TdlibFunction? file_hashes,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementErrorSourceFiles",
        "file_hashes": file_hashes!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementErrorSourceFiles",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputPassportElementError.html).
  factory TdlibFunction.inputPassportElementError({
    TdlibFunction? type,
    String? message,
    TdlibFunction? source,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputPassportElementError",
        "type": type!.toJson(),
        "message": message,
        "source": source!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputPassportElementError",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageText.html).
  factory TdlibFunction.messageText({
    TdlibFunction? text,
    TdlibFunction? web_page,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageText",
        "text": text!.toJson(),
        "web_page": web_page!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageAnimation.html).
  factory TdlibFunction.messageAnimation({
    TdlibFunction? animation,
    TdlibFunction? caption,
    bool? is_secret,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageAnimation",
        "animation": animation!.toJson(),
        "caption": caption!.toJson(),
        "is_secret": is_secret,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageAudio.html).
  factory TdlibFunction.messageAudio({
    TdlibFunction? audio,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageAudio",
        "audio": audio!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageDocument.html).
  factory TdlibFunction.messageDocument({
    TdlibFunction? document,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageDocument",
        "document": document!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePhoto.html).
  factory TdlibFunction.messagePhoto({
    TdlibFunction? photo,
    TdlibFunction? caption,
    bool? is_secret,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePhoto",
        "photo": photo!.toJson(),
        "caption": caption!.toJson(),
        "is_secret": is_secret,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageExpiredPhoto.html).
  factory TdlibFunction.messageExpiredPhoto() {
    try {
      return TdlibFunction({
        "@type": "messageExpiredPhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageExpiredPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSticker.html).
  factory TdlibFunction.messageSticker({
    TdlibFunction? sticker,
    bool? is_premium,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSticker",
        "sticker": sticker!.toJson(),
        "is_premium": is_premium,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVideo.html).
  factory TdlibFunction.messageVideo({
    TdlibFunction? video,
    TdlibFunction? caption,
    bool? is_secret,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVideo",
        "video": video!.toJson(),
        "caption": caption!.toJson(),
        "is_secret": is_secret,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageExpiredVideo.html).
  factory TdlibFunction.messageExpiredVideo() {
    try {
      return TdlibFunction({
        "@type": "messageExpiredVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageExpiredVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVideoNote.html).
  factory TdlibFunction.messageVideoNote({
    TdlibFunction? video_note,
    bool? is_viewed,
    bool? is_secret,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVideoNote",
        "video_note": video_note!.toJson(),
        "is_viewed": is_viewed,
        "is_secret": is_secret,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVoiceNote.html).
  factory TdlibFunction.messageVoiceNote({
    TdlibFunction? voice_note,
    TdlibFunction? caption,
    bool? is_listened,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVoiceNote",
        "voice_note": voice_note!.toJson(),
        "caption": caption!.toJson(),
        "is_listened": is_listened,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageLocation.html).
  factory TdlibFunction.messageLocation({
    TdlibFunction? location,
    int? live_period,
    int? expires_in,
    int? heading,
    int? proximity_alert_radius,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageLocation",
        "location": location!.toJson(),
        "live_period": live_period,
        "expires_in": expires_in,
        "heading": heading,
        "proximity_alert_radius": proximity_alert_radius,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVenue.html).
  factory TdlibFunction.messageVenue({
    TdlibFunction? venue,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVenue",
        "venue": venue!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVenue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageContact.html).
  factory TdlibFunction.messageContact({
    TdlibFunction? contact,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageContact",
        "contact": contact!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageAnimatedEmoji.html).
  factory TdlibFunction.messageAnimatedEmoji({
    TdlibFunction? animated_emoji,
    String? emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageAnimatedEmoji",
        "animated_emoji": animated_emoji!.toJson(),
        "emoji": emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageAnimatedEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageDice.html).
  factory TdlibFunction.messageDice({
    TdlibFunction? initial_state,
    TdlibFunction? final_state,
    String? emoji,
    int? value,
    int? success_animation_frame_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageDice",
        "initial_state": initial_state!.toJson(),
        "final_state": final_state!.toJson(),
        "emoji": emoji,
        "value": value,
        "success_animation_frame_number": success_animation_frame_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageDice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageGame.html).
  factory TdlibFunction.messageGame({
    TdlibFunction? game,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageGame",
        "game": game!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePoll.html).
  factory TdlibFunction.messagePoll({
    TdlibFunction? poll,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePoll",
        "poll": poll!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePoll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageInvoice.html).
  factory TdlibFunction.messageInvoice({
    String? title,
    TdlibFunction? description,
    TdlibFunction? photo,
    String? currency,
    int? total_amount,
    String? start_parameter,
    bool? is_test,
    bool? need_shipping_address,
    int? receipt_message_id,
    TdlibFunction? extended_media,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageInvoice",
        "title": title,
        "description": description!.toJson(),
        "photo": photo!.toJson(),
        "currency": currency,
        "total_amount": total_amount,
        "start_parameter": start_parameter,
        "is_test": is_test,
        "need_shipping_address": need_shipping_address,
        "receipt_message_id": receipt_message_id,
        "extended_media": extended_media!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageInvoice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageCall.html).
  factory TdlibFunction.messageCall({
    bool? is_video,
    TdlibFunction? discard_reason,
    int? duration,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageCall",
        "is_video": is_video,
        "discard_reason": discard_reason!.toJson(),
        "duration": duration,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVideoChatScheduled.html).
  factory TdlibFunction.messageVideoChatScheduled({
    int? group_call_id,
    int? start_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVideoChatScheduled",
        "group_call_id": group_call_id,
        "start_date": start_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVideoChatScheduled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVideoChatStarted.html).
  factory TdlibFunction.messageVideoChatStarted({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVideoChatStarted",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVideoChatStarted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageVideoChatEnded.html).
  factory TdlibFunction.messageVideoChatEnded({
    int? duration,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageVideoChatEnded",
        "duration": duration,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageVideoChatEnded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageInviteVideoChatParticipants.html).
  factory TdlibFunction.messageInviteVideoChatParticipants({
    int? group_call_id,
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageInviteVideoChatParticipants",
        "group_call_id": group_call_id,
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageInviteVideoChatParticipants",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageBasicGroupChatCreate.html).
  factory TdlibFunction.messageBasicGroupChatCreate({
    String? title,
    List<int>? member_user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageBasicGroupChatCreate",
        "title": title,
        "member_user_ids": member_user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageBasicGroupChatCreate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSupergroupChatCreate.html).
  factory TdlibFunction.messageSupergroupChatCreate({
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSupergroupChatCreate",
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSupergroupChatCreate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatChangeTitle.html).
  factory TdlibFunction.messageChatChangeTitle({
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatChangeTitle",
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatChangeTitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatChangePhoto.html).
  factory TdlibFunction.messageChatChangePhoto({
    TdlibFunction? photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatChangePhoto",
        "photo": photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatChangePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatDeletePhoto.html).
  factory TdlibFunction.messageChatDeletePhoto() {
    try {
      return TdlibFunction({
        "@type": "messageChatDeletePhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatDeletePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatAddMembers.html).
  factory TdlibFunction.messageChatAddMembers({
    List<int>? member_user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatAddMembers",
        "member_user_ids": member_user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatAddMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatJoinByLink.html).
  factory TdlibFunction.messageChatJoinByLink() {
    try {
      return TdlibFunction({
        "@type": "messageChatJoinByLink",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatJoinByLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatJoinByRequest.html).
  factory TdlibFunction.messageChatJoinByRequest() {
    try {
      return TdlibFunction({
        "@type": "messageChatJoinByRequest",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatJoinByRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatDeleteMember.html).
  factory TdlibFunction.messageChatDeleteMember({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatDeleteMember",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatDeleteMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatUpgradeTo.html).
  factory TdlibFunction.messageChatUpgradeTo({
    int? supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatUpgradeTo",
        "supergroup_id": supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatUpgradeTo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatUpgradeFrom.html).
  factory TdlibFunction.messageChatUpgradeFrom({
    String? title,
    int? basic_group_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatUpgradeFrom",
        "title": title,
        "basic_group_id": basic_group_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatUpgradeFrom",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePinMessage.html).
  factory TdlibFunction.messagePinMessage({
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePinMessage",
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePinMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageScreenshotTaken.html).
  factory TdlibFunction.messageScreenshotTaken() {
    try {
      return TdlibFunction({
        "@type": "messageScreenshotTaken",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageScreenshotTaken",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatSetTheme.html).
  factory TdlibFunction.messageChatSetTheme({
    String? theme_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatSetTheme",
        "theme_name": theme_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatSetTheme",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageChatSetTtl.html).
  factory TdlibFunction.messageChatSetTtl({
    int? ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageChatSetTtl",
        "ttl": ttl,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageChatSetTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageCustomServiceAction.html).
  factory TdlibFunction.messageCustomServiceAction({
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageCustomServiceAction",
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageCustomServiceAction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageGameScore.html).
  factory TdlibFunction.messageGameScore({
    int? game_message_id,
    int? game_id,
    int? score,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageGameScore",
        "game_message_id": game_message_id,
        "game_id": game_id,
        "score": score,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageGameScore",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePaymentSuccessful.html).
  factory TdlibFunction.messagePaymentSuccessful({
    int? invoice_chat_id,
    int? invoice_message_id,
    String? currency,
    int? total_amount,
    bool? is_recurring,
    bool? is_first_recurring,
    String? invoice_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePaymentSuccessful",
        "invoice_chat_id": invoice_chat_id,
        "invoice_message_id": invoice_message_id,
        "currency": currency,
        "total_amount": total_amount,
        "is_recurring": is_recurring,
        "is_first_recurring": is_first_recurring,
        "invoice_name": invoice_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePaymentSuccessful",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePaymentSuccessfulBot.html).
  factory TdlibFunction.messagePaymentSuccessfulBot({
    String? currency,
    int? total_amount,
    bool? is_recurring,
    bool? is_first_recurring,
    TdlibFunction? invoice_payload,
    String? shipping_option_id,
    TdlibFunction? order_info,
    String? telegram_payment_charge_id,
    String? provider_payment_charge_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePaymentSuccessfulBot",
        "currency": currency,
        "total_amount": total_amount,
        "is_recurring": is_recurring,
        "is_first_recurring": is_first_recurring,
        "invoice_payload": invoice_payload!.toJson(),
        "shipping_option_id": shipping_option_id,
        "order_info": order_info!.toJson(),
        "telegram_payment_charge_id": telegram_payment_charge_id,
        "provider_payment_charge_id": provider_payment_charge_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePaymentSuccessfulBot",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageGiftedPremium.html).
  factory TdlibFunction.messageGiftedPremium({
    String? currency,
    int? amount,
    int? month_count,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageGiftedPremium",
        "currency": currency,
        "amount": amount,
        "month_count": month_count,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageGiftedPremium",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageContactRegistered.html).
  factory TdlibFunction.messageContactRegistered() {
    try {
      return TdlibFunction({
        "@type": "messageContactRegistered",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageContactRegistered",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageWebsiteConnected.html).
  factory TdlibFunction.messageWebsiteConnected({
    String? domain_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageWebsiteConnected",
        "domain_name": domain_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageWebsiteConnected",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageWebAppDataSent.html).
  factory TdlibFunction.messageWebAppDataSent({
    String? button_text,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageWebAppDataSent",
        "button_text": button_text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageWebAppDataSent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageWebAppDataReceived.html).
  factory TdlibFunction.messageWebAppDataReceived({
    String? button_text,
    String? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageWebAppDataReceived",
        "button_text": button_text,
        "data": data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageWebAppDataReceived",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePassportDataSent.html).
  factory TdlibFunction.messagePassportDataSent({
    TdlibFunction? types,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePassportDataSent",
        "types": types!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePassportDataSent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messagePassportDataReceived.html).
  factory TdlibFunction.messagePassportDataReceived({
    TdlibFunction? elements,
    TdlibFunction? credentials,
  }) {
    try {
      return TdlibFunction({
        "@type": "messagePassportDataReceived",
        "elements": elements!.toJson(),
        "credentials": credentials!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messagePassportDataReceived",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageProximityAlertTriggered.html).
  factory TdlibFunction.messageProximityAlertTriggered({
    TdlibFunction? traveler_id,
    TdlibFunction? watcher_id,
    int? distance,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageProximityAlertTriggered",
        "traveler_id": traveler_id!.toJson(),
        "watcher_id": watcher_id!.toJson(),
        "distance": distance,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageProximityAlertTriggered",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageUnsupported.html).
  factory TdlibFunction.messageUnsupported() {
    try {
      return TdlibFunction({
        "@type": "messageUnsupported",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageUnsupported",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeMention.html).
  factory TdlibFunction.textEntityTypeMention() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeMention",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeMention",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeHashtag.html).
  factory TdlibFunction.textEntityTypeHashtag() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeHashtag",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeHashtag",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeCashtag.html).
  factory TdlibFunction.textEntityTypeCashtag() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeCashtag",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeCashtag",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeBotCommand.html).
  factory TdlibFunction.textEntityTypeBotCommand() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeBotCommand",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeBotCommand",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeUrl.html).
  factory TdlibFunction.textEntityTypeUrl() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeUrl",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeEmailAddress.html).
  factory TdlibFunction.textEntityTypeEmailAddress() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeEmailAddress",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypePhoneNumber.html).
  factory TdlibFunction.textEntityTypePhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypePhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypePhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeBankCardNumber.html).
  factory TdlibFunction.textEntityTypeBankCardNumber() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeBankCardNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeBankCardNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeBold.html).
  factory TdlibFunction.textEntityTypeBold() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeBold",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeBold",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeItalic.html).
  factory TdlibFunction.textEntityTypeItalic() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeItalic",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeItalic",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeUnderline.html).
  factory TdlibFunction.textEntityTypeUnderline() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeUnderline",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeUnderline",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeStrikethrough.html).
  factory TdlibFunction.textEntityTypeStrikethrough() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeStrikethrough",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeStrikethrough",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeSpoiler.html).
  factory TdlibFunction.textEntityTypeSpoiler() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeSpoiler",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeSpoiler",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeCode.html).
  factory TdlibFunction.textEntityTypeCode() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypePre.html).
  factory TdlibFunction.textEntityTypePre() {
    try {
      return TdlibFunction({
        "@type": "textEntityTypePre",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypePre",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypePreCode.html).
  factory TdlibFunction.textEntityTypePreCode({
    String? language,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntityTypePreCode",
        "language": language,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypePreCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeTextUrl.html).
  factory TdlibFunction.textEntityTypeTextUrl({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeTextUrl",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeTextUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeMentionName.html).
  factory TdlibFunction.textEntityTypeMentionName({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeMentionName",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeMentionName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeCustomEmoji.html).
  factory TdlibFunction.textEntityTypeCustomEmoji({
    int? custom_emoji_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeCustomEmoji",
        "custom_emoji_id": custom_emoji_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeCustomEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textEntityTypeMediaTimestamp.html).
  factory TdlibFunction.textEntityTypeMediaTimestamp({
    int? media_timestamp,
  }) {
    try {
      return TdlibFunction({
        "@type": "textEntityTypeMediaTimestamp",
        "media_timestamp": media_timestamp,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textEntityTypeMediaTimestamp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputThumbnail.html).
  factory TdlibFunction.inputThumbnail({
    TdlibFunction? thumbnail,
    int? width,
    int? height,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputThumbnail",
        "thumbnail": thumbnail!.toJson(),
        "width": width,
        "height": height,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputThumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSchedulingStateSendAtDate.html).
  factory TdlibFunction.messageSchedulingStateSendAtDate({
    int? send_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSchedulingStateSendAtDate",
        "send_date": send_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSchedulingStateSendAtDate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSchedulingStateSendWhenOnline.html).
  factory TdlibFunction.messageSchedulingStateSendWhenOnline() {
    try {
      return TdlibFunction({
        "@type": "messageSchedulingStateSendWhenOnline",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSchedulingStateSendWhenOnline",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageSendOptions.html).
  factory TdlibFunction.messageSendOptions({
    bool? disable_notification,
    bool? from_background,
    bool? protect_content,
    bool? update_order_of_installed_sticker_sets,
    TdlibFunction? scheduling_state,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageSendOptions",
        "disable_notification": disable_notification,
        "from_background": from_background,
        "protect_content": protect_content,
        "update_order_of_installed_sticker_sets": update_order_of_installed_sticker_sets,
        "scheduling_state": scheduling_state!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageSendOptions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageCopyOptions.html).
  factory TdlibFunction.messageCopyOptions({
    bool? send_copy,
    bool? replace_caption,
    TdlibFunction? new_caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageCopyOptions",
        "send_copy": send_copy,
        "replace_caption": replace_caption,
        "new_caption": new_caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageCopyOptions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageText.html).
  factory TdlibFunction.inputMessageText({
    TdlibFunction? text,
    bool? disable_web_page_preview,
    bool? clear_draft,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageText",
        "text": text!.toJson(),
        "disable_web_page_preview": disable_web_page_preview,
        "clear_draft": clear_draft,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageAnimation.html).
  factory TdlibFunction.inputMessageAnimation({
    TdlibFunction? animation,
    TdlibFunction? thumbnail,
    List<int>? added_sticker_file_ids,
    int? duration,
    int? width,
    int? height,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageAnimation",
        "animation": animation!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "added_sticker_file_ids": added_sticker_file_ids,
        "duration": duration,
        "width": width,
        "height": height,
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageAudio.html).
  factory TdlibFunction.inputMessageAudio({
    TdlibFunction? audio,
    TdlibFunction? album_cover_thumbnail,
    int? duration,
    String? title,
    String? performer,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageAudio",
        "audio": audio!.toJson(),
        "album_cover_thumbnail": album_cover_thumbnail!.toJson(),
        "duration": duration,
        "title": title,
        "performer": performer,
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageDocument.html).
  factory TdlibFunction.inputMessageDocument({
    TdlibFunction? document,
    TdlibFunction? thumbnail,
    bool? disable_content_type_detection,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageDocument",
        "document": document!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "disable_content_type_detection": disable_content_type_detection,
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessagePhoto.html).
  factory TdlibFunction.inputMessagePhoto({
    TdlibFunction? photo,
    TdlibFunction? thumbnail,
    List<int>? added_sticker_file_ids,
    int? width,
    int? height,
    TdlibFunction? caption,
    int? ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessagePhoto",
        "photo": photo!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "added_sticker_file_ids": added_sticker_file_ids,
        "width": width,
        "height": height,
        "caption": caption!.toJson(),
        "ttl": ttl,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessagePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageSticker.html).
  factory TdlibFunction.inputMessageSticker({
    TdlibFunction? sticker,
    TdlibFunction? thumbnail,
    int? width,
    int? height,
    String? emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageSticker",
        "sticker": sticker!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "width": width,
        "height": height,
        "emoji": emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageVideo.html).
  factory TdlibFunction.inputMessageVideo({
    TdlibFunction? video,
    TdlibFunction? thumbnail,
    List<int>? added_sticker_file_ids,
    int? duration,
    int? width,
    int? height,
    bool? supports_streaming,
    TdlibFunction? caption,
    int? ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageVideo",
        "video": video!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "added_sticker_file_ids": added_sticker_file_ids,
        "duration": duration,
        "width": width,
        "height": height,
        "supports_streaming": supports_streaming,
        "caption": caption!.toJson(),
        "ttl": ttl,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageVideoNote.html).
  factory TdlibFunction.inputMessageVideoNote({
    TdlibFunction? video_note,
    TdlibFunction? thumbnail,
    int? duration,
    int? length,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageVideoNote",
        "video_note": video_note!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "duration": duration,
        "length": length,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageVoiceNote.html).
  factory TdlibFunction.inputMessageVoiceNote({
    TdlibFunction? voice_note,
    int? duration,
    TdlibFunction? waveform,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageVoiceNote",
        "voice_note": voice_note!.toJson(),
        "duration": duration,
        "waveform": waveform!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageLocation.html).
  factory TdlibFunction.inputMessageLocation({
    TdlibFunction? location,
    int? live_period,
    int? heading,
    int? proximity_alert_radius,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageLocation",
        "location": location!.toJson(),
        "live_period": live_period,
        "heading": heading,
        "proximity_alert_radius": proximity_alert_radius,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageVenue.html).
  factory TdlibFunction.inputMessageVenue({
    TdlibFunction? venue,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageVenue",
        "venue": venue!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageVenue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageContact.html).
  factory TdlibFunction.inputMessageContact({
    TdlibFunction? contact,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageContact",
        "contact": contact!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageDice.html).
  factory TdlibFunction.inputMessageDice({
    String? emoji,
    bool? clear_draft,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageDice",
        "emoji": emoji,
        "clear_draft": clear_draft,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageDice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageGame.html).
  factory TdlibFunction.inputMessageGame({
    int? bot_user_id,
    String? game_short_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageGame",
        "bot_user_id": bot_user_id,
        "game_short_name": game_short_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageInvoice.html).
  factory TdlibFunction.inputMessageInvoice({
    TdlibFunction? invoice,
    String? title,
    String? description,
    String? photo_url,
    int? photo_size,
    int? photo_width,
    int? photo_height,
    TdlibFunction? payload,
    String? provider_token,
    String? provider_data,
    String? start_parameter,
    TdlibFunction? extended_media_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageInvoice",
        "invoice": invoice!.toJson(),
        "title": title,
        "description": description,
        "photo_url": photo_url,
        "photo_size": photo_size,
        "photo_width": photo_width,
        "photo_height": photo_height,
        "payload": payload!.toJson(),
        "provider_token": provider_token,
        "provider_data": provider_data,
        "start_parameter": start_parameter,
        "extended_media_content": extended_media_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageInvoice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessagePoll.html).
  factory TdlibFunction.inputMessagePoll({
    String? question,
    List<String>? options,
    bool? is_anonymous,
    TdlibFunction? type,
    int? open_period,
    int? close_date,
    bool? is_closed,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessagePoll",
        "question": question,
        "options": options,
        "is_anonymous": is_anonymous,
        "type": type!.toJson(),
        "open_period": open_period,
        "close_date": close_date,
        "is_closed": is_closed,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessagePoll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputMessageForwarded.html).
  factory TdlibFunction.inputMessageForwarded({
    int? from_chat_id,
    int? message_id,
    bool? in_game_share,
    TdlibFunction? copy_options,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputMessageForwarded",
        "from_chat_id": from_chat_id,
        "message_id": message_id,
        "in_game_share": in_game_share,
        "copy_options": copy_options!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputMessageForwarded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterEmpty.html).
  factory TdlibFunction.searchMessagesFilterEmpty() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterEmpty",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterEmpty",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterAnimation.html).
  factory TdlibFunction.searchMessagesFilterAnimation() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterAnimation",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterAudio.html).
  factory TdlibFunction.searchMessagesFilterAudio() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterAudio",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterDocument.html).
  factory TdlibFunction.searchMessagesFilterDocument() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterDocument",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterPhoto.html).
  factory TdlibFunction.searchMessagesFilterPhoto() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterPhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterVideo.html).
  factory TdlibFunction.searchMessagesFilterVideo() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterVoiceNote.html).
  factory TdlibFunction.searchMessagesFilterVoiceNote() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterVoiceNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterPhotoAndVideo.html).
  factory TdlibFunction.searchMessagesFilterPhotoAndVideo() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterPhotoAndVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterPhotoAndVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterUrl.html).
  factory TdlibFunction.searchMessagesFilterUrl() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterUrl",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterChatPhoto.html).
  factory TdlibFunction.searchMessagesFilterChatPhoto() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterChatPhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterChatPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterVideoNote.html).
  factory TdlibFunction.searchMessagesFilterVideoNote() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterVideoNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterVoiceAndVideoNote.html).
  factory TdlibFunction.searchMessagesFilterVoiceAndVideoNote() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterVoiceAndVideoNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterVoiceAndVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterMention.html).
  factory TdlibFunction.searchMessagesFilterMention() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterMention",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterMention",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterUnreadMention.html).
  factory TdlibFunction.searchMessagesFilterUnreadMention() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterUnreadMention",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterUnreadMention",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterUnreadReaction.html).
  factory TdlibFunction.searchMessagesFilterUnreadReaction() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterUnreadReaction",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterUnreadReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterFailedToSend.html).
  factory TdlibFunction.searchMessagesFilterFailedToSend() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterFailedToSend",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterFailedToSend",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessagesFilterPinned.html).
  factory TdlibFunction.searchMessagesFilterPinned() {
    try {
      return TdlibFunction({
        "@type": "searchMessagesFilterPinned",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessagesFilterPinned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionTyping.html).
  factory TdlibFunction.chatActionTyping() {
    try {
      return TdlibFunction({
        "@type": "chatActionTyping",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionTyping",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionRecordingVideo.html).
  factory TdlibFunction.chatActionRecordingVideo() {
    try {
      return TdlibFunction({
        "@type": "chatActionRecordingVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionRecordingVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionUploadingVideo.html).
  factory TdlibFunction.chatActionUploadingVideo({
    int? progress,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionUploadingVideo",
        "progress": progress,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionUploadingVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionRecordingVoiceNote.html).
  factory TdlibFunction.chatActionRecordingVoiceNote() {
    try {
      return TdlibFunction({
        "@type": "chatActionRecordingVoiceNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionRecordingVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionUploadingVoiceNote.html).
  factory TdlibFunction.chatActionUploadingVoiceNote({
    int? progress,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionUploadingVoiceNote",
        "progress": progress,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionUploadingVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionUploadingPhoto.html).
  factory TdlibFunction.chatActionUploadingPhoto({
    int? progress,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionUploadingPhoto",
        "progress": progress,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionUploadingPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionUploadingDocument.html).
  factory TdlibFunction.chatActionUploadingDocument({
    int? progress,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionUploadingDocument",
        "progress": progress,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionUploadingDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionChoosingSticker.html).
  factory TdlibFunction.chatActionChoosingSticker() {
    try {
      return TdlibFunction({
        "@type": "chatActionChoosingSticker",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionChoosingSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionChoosingLocation.html).
  factory TdlibFunction.chatActionChoosingLocation() {
    try {
      return TdlibFunction({
        "@type": "chatActionChoosingLocation",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionChoosingLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionChoosingContact.html).
  factory TdlibFunction.chatActionChoosingContact() {
    try {
      return TdlibFunction({
        "@type": "chatActionChoosingContact",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionChoosingContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionStartPlayingGame.html).
  factory TdlibFunction.chatActionStartPlayingGame() {
    try {
      return TdlibFunction({
        "@type": "chatActionStartPlayingGame",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionStartPlayingGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionRecordingVideoNote.html).
  factory TdlibFunction.chatActionRecordingVideoNote() {
    try {
      return TdlibFunction({
        "@type": "chatActionRecordingVideoNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionRecordingVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionUploadingVideoNote.html).
  factory TdlibFunction.chatActionUploadingVideoNote({
    int? progress,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionUploadingVideoNote",
        "progress": progress,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionUploadingVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionWatchingAnimations.html).
  factory TdlibFunction.chatActionWatchingAnimations({
    String? emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatActionWatchingAnimations",
        "emoji": emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionWatchingAnimations",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatActionCancel.html).
  factory TdlibFunction.chatActionCancel() {
    try {
      return TdlibFunction({
        "@type": "chatActionCancel",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatActionCancel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userStatusEmpty.html).
  factory TdlibFunction.userStatusEmpty() {
    try {
      return TdlibFunction({
        "@type": "userStatusEmpty",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userStatusEmpty",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userStatusOnline.html).
  factory TdlibFunction.userStatusOnline({
    int? expires,
  }) {
    try {
      return TdlibFunction({
        "@type": "userStatusOnline",
        "expires": expires,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userStatusOnline",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userStatusOffline.html).
  factory TdlibFunction.userStatusOffline({
    int? was_online,
  }) {
    try {
      return TdlibFunction({
        "@type": "userStatusOffline",
        "was_online": was_online,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userStatusOffline",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userStatusRecently.html).
  factory TdlibFunction.userStatusRecently() {
    try {
      return TdlibFunction({
        "@type": "userStatusRecently",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userStatusRecently",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userStatusLastWeek.html).
  factory TdlibFunction.userStatusLastWeek() {
    try {
      return TdlibFunction({
        "@type": "userStatusLastWeek",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userStatusLastWeek",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userStatusLastMonth.html).
  factory TdlibFunction.userStatusLastMonth() {
    try {
      return TdlibFunction({
        "@type": "userStatusLastMonth",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userStatusLastMonth",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickers.html).
  factory TdlibFunction.stickers({
    TdlibFunction? stickers,
  }) {
    try {
      return TdlibFunction({
        "@type": "stickers",
        "stickers": stickers!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emojis.html).
  factory TdlibFunction.emojis({
    List<String>? emojis,
  }) {
    try {
      return TdlibFunction({
        "@type": "emojis",
        "emojis": emojis,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emojis",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerSet.html).
  factory TdlibFunction.stickerSet({
    int? id,
    String? title,
    String? name,
    TdlibFunction? thumbnail,
    TdlibFunction? thumbnail_outline,
    bool? is_installed,
    bool? is_archived,
    bool? is_official,
    TdlibFunction? sticker_format,
    TdlibFunction? sticker_type,
    bool? is_viewed,
    TdlibFunction? stickers,
    TdlibFunction? emojis,
  }) {
    try {
      return TdlibFunction({
        "@type": "stickerSet",
        "id": id,
        "title": title,
        "name": name,
        "thumbnail": thumbnail!.toJson(),
        "thumbnail_outline": thumbnail_outline!.toJson(),
        "is_installed": is_installed,
        "is_archived": is_archived,
        "is_official": is_official,
        "sticker_format": sticker_format!.toJson(),
        "sticker_type": sticker_type!.toJson(),
        "is_viewed": is_viewed,
        "stickers": stickers!.toJson(),
        "emojis": emojis!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerSetInfo.html).
  factory TdlibFunction.stickerSetInfo({
    int? id,
    String? title,
    String? name,
    TdlibFunction? thumbnail,
    TdlibFunction? thumbnail_outline,
    bool? is_installed,
    bool? is_archived,
    bool? is_official,
    TdlibFunction? sticker_format,
    TdlibFunction? sticker_type,
    bool? is_viewed,
    int? size,
    TdlibFunction? covers,
  }) {
    try {
      return TdlibFunction({
        "@type": "stickerSetInfo",
        "id": id,
        "title": title,
        "name": name,
        "thumbnail": thumbnail!.toJson(),
        "thumbnail_outline": thumbnail_outline!.toJson(),
        "is_installed": is_installed,
        "is_archived": is_archived,
        "is_official": is_official,
        "sticker_format": sticker_format!.toJson(),
        "sticker_type": sticker_type!.toJson(),
        "is_viewed": is_viewed,
        "size": size,
        "covers": covers!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerSetInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stickerSets.html).
  factory TdlibFunction.stickerSets({
    int? total_count,
    TdlibFunction? sets,
  }) {
    try {
      return TdlibFunction({
        "@type": "stickerSets",
        "total_count": total_count,
        "sets": sets!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1trendingStickerSets.html).
  factory TdlibFunction.trendingStickerSets({
    int? total_count,
    TdlibFunction? sets,
    bool? is_premium,
  }) {
    try {
      return TdlibFunction({
        "@type": "trendingStickerSets",
        "total_count": total_count,
        "sets": sets!.toJson(),
        "is_premium": is_premium,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method trendingStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callDiscardReasonEmpty.html).
  factory TdlibFunction.callDiscardReasonEmpty() {
    try {
      return TdlibFunction({
        "@type": "callDiscardReasonEmpty",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callDiscardReasonEmpty",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callDiscardReasonMissed.html).
  factory TdlibFunction.callDiscardReasonMissed() {
    try {
      return TdlibFunction({
        "@type": "callDiscardReasonMissed",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callDiscardReasonMissed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callDiscardReasonDeclined.html).
  factory TdlibFunction.callDiscardReasonDeclined() {
    try {
      return TdlibFunction({
        "@type": "callDiscardReasonDeclined",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callDiscardReasonDeclined",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callDiscardReasonDisconnected.html).
  factory TdlibFunction.callDiscardReasonDisconnected() {
    try {
      return TdlibFunction({
        "@type": "callDiscardReasonDisconnected",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callDiscardReasonDisconnected",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callDiscardReasonHungUp.html).
  factory TdlibFunction.callDiscardReasonHungUp() {
    try {
      return TdlibFunction({
        "@type": "callDiscardReasonHungUp",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callDiscardReasonHungUp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProtocol.html).
  factory TdlibFunction.callProtocol({
    bool? udp_p2p,
    bool? udp_reflector,
    int? min_layer,
    int? max_layer,
    List<String>? library_versions,
  }) {
    try {
      return TdlibFunction({
        "@type": "callProtocol",
        "udp_p2p": udp_p2p,
        "udp_reflector": udp_reflector,
        "min_layer": min_layer,
        "max_layer": max_layer,
        "library_versions": library_versions,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProtocol",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callServerTypeTelegramReflector.html).
  factory TdlibFunction.callServerTypeTelegramReflector({
    TdlibFunction? peer_tag,
    bool? is_tcp,
  }) {
    try {
      return TdlibFunction({
        "@type": "callServerTypeTelegramReflector",
        "peer_tag": peer_tag!.toJson(),
        "is_tcp": is_tcp,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callServerTypeTelegramReflector",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callServerTypeWebrtc.html).
  factory TdlibFunction.callServerTypeWebrtc({
    String? username,
    String? password,
    bool? supports_turn,
    bool? supports_stun,
  }) {
    try {
      return TdlibFunction({
        "@type": "callServerTypeWebrtc",
        "username": username,
        "password": password,
        "supports_turn": supports_turn,
        "supports_stun": supports_stun,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callServerTypeWebrtc",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callServer.html).
  factory TdlibFunction.callServer({
    int? id,
    String? ip_address,
    String? ipv6_address,
    int? port,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "callServer",
        "id": id,
        "ip_address": ip_address,
        "ipv6_address": ipv6_address,
        "port": port,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callServer",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callId.html).
  factory TdlibFunction.callId({
    int? id,
  }) {
    try {
      return TdlibFunction({
        "@type": "callId",
        "id": id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallId.html).
  factory TdlibFunction.groupCallId({
    int? id,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallId",
        "id": id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callStatePending.html).
  factory TdlibFunction.callStatePending({
    bool? is_created,
    bool? is_received,
  }) {
    try {
      return TdlibFunction({
        "@type": "callStatePending",
        "is_created": is_created,
        "is_received": is_received,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callStatePending",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callStateExchangingKeys.html).
  factory TdlibFunction.callStateExchangingKeys() {
    try {
      return TdlibFunction({
        "@type": "callStateExchangingKeys",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callStateExchangingKeys",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callStateReady.html).
  factory TdlibFunction.callStateReady({
    TdlibFunction? protocol,
    TdlibFunction? servers,
    String? config,
    TdlibFunction? encryption_key,
    List<String>? emojis,
    bool? allow_p2p,
  }) {
    try {
      return TdlibFunction({
        "@type": "callStateReady",
        "protocol": protocol!.toJson(),
        "servers": servers!.toJson(),
        "config": config,
        "encryption_key": encryption_key!.toJson(),
        "emojis": emojis,
        "allow_p2p": allow_p2p,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callStateReady",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callStateHangingUp.html).
  factory TdlibFunction.callStateHangingUp() {
    try {
      return TdlibFunction({
        "@type": "callStateHangingUp",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callStateHangingUp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callStateDiscarded.html).
  factory TdlibFunction.callStateDiscarded({
    TdlibFunction? reason,
    bool? need_rating,
    bool? need_debug_information,
    bool? need_log,
  }) {
    try {
      return TdlibFunction({
        "@type": "callStateDiscarded",
        "reason": reason!.toJson(),
        "need_rating": need_rating,
        "need_debug_information": need_debug_information,
        "need_log": need_log,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callStateDiscarded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callStateError.html).
  factory TdlibFunction.callStateError({
    TdlibFunction? error,
  }) {
    try {
      return TdlibFunction({
        "@type": "callStateError",
        "error": error!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callStateError",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallVideoQualityThumbnail.html).
  factory TdlibFunction.groupCallVideoQualityThumbnail() {
    try {
      return TdlibFunction({
        "@type": "groupCallVideoQualityThumbnail",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallVideoQualityThumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallVideoQualityMedium.html).
  factory TdlibFunction.groupCallVideoQualityMedium() {
    try {
      return TdlibFunction({
        "@type": "groupCallVideoQualityMedium",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallVideoQualityMedium",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallVideoQualityFull.html).
  factory TdlibFunction.groupCallVideoQualityFull() {
    try {
      return TdlibFunction({
        "@type": "groupCallVideoQualityFull",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallVideoQualityFull",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallStream.html).
  factory TdlibFunction.groupCallStream({
    int? channel_id,
    int? scale,
    int? time_offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallStream",
        "channel_id": channel_id,
        "scale": scale,
        "time_offset": time_offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallStream",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallStreams.html).
  factory TdlibFunction.groupCallStreams({
    TdlibFunction? streams,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallStreams",
        "streams": streams!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallStreams",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1rtmpUrl.html).
  factory TdlibFunction.rtmpUrl({
    String? url,
    String? stream_key,
  }) {
    try {
      return TdlibFunction({
        "@type": "rtmpUrl",
        "url": url,
        "stream_key": stream_key,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method rtmpUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallRecentSpeaker.html).
  factory TdlibFunction.groupCallRecentSpeaker({
    TdlibFunction? participant_id,
    bool? is_speaking,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallRecentSpeaker",
        "participant_id": participant_id!.toJson(),
        "is_speaking": is_speaking,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallRecentSpeaker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCall.html).
  factory TdlibFunction.groupCall({
    int? id,
    String? title,
    int? scheduled_start_date,
    bool? enabled_start_notification,
    bool? is_active,
    bool? is_rtmp_stream,
    bool? is_joined,
    bool? need_rejoin,
    bool? can_be_managed,
    int? participant_count,
    bool? has_hidden_listeners,
    bool? loaded_all_participants,
    TdlibFunction? recent_speakers,
    bool? is_my_video_enabled,
    bool? is_my_video_paused,
    bool? can_enable_video,
    bool? mute_new_participants,
    bool? can_toggle_mute_new_participants,
    int? record_duration,
    bool? is_video_recorded,
    int? duration,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCall",
        "id": id,
        "title": title,
        "scheduled_start_date": scheduled_start_date,
        "enabled_start_notification": enabled_start_notification,
        "is_active": is_active,
        "is_rtmp_stream": is_rtmp_stream,
        "is_joined": is_joined,
        "need_rejoin": need_rejoin,
        "can_be_managed": can_be_managed,
        "participant_count": participant_count,
        "has_hidden_listeners": has_hidden_listeners,
        "loaded_all_participants": loaded_all_participants,
        "recent_speakers": recent_speakers!.toJson(),
        "is_my_video_enabled": is_my_video_enabled,
        "is_my_video_paused": is_my_video_paused,
        "can_enable_video": can_enable_video,
        "mute_new_participants": mute_new_participants,
        "can_toggle_mute_new_participants": can_toggle_mute_new_participants,
        "record_duration": record_duration,
        "is_video_recorded": is_video_recorded,
        "duration": duration,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallVideoSourceGroup.html).
  factory TdlibFunction.groupCallVideoSourceGroup({
    String? semantics,
    List<int>? source_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallVideoSourceGroup",
        "semantics": semantics,
        "source_ids": source_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallVideoSourceGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallParticipantVideoInfo.html).
  factory TdlibFunction.groupCallParticipantVideoInfo({
    TdlibFunction? source_groups,
    String? endpoint_id,
    bool? is_paused,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallParticipantVideoInfo",
        "source_groups": source_groups!.toJson(),
        "endpoint_id": endpoint_id,
        "is_paused": is_paused,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallParticipantVideoInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1groupCallParticipant.html).
  factory TdlibFunction.groupCallParticipant({
    TdlibFunction? participant_id,
    int? audio_source_id,
    int? screen_sharing_audio_source_id,
    TdlibFunction? video_info,
    TdlibFunction? screen_sharing_video_info,
    String? bio,
    bool? is_current_user,
    bool? is_speaking,
    bool? is_hand_raised,
    bool? can_be_muted_for_all_users,
    bool? can_be_unmuted_for_all_users,
    bool? can_be_muted_for_current_user,
    bool? can_be_unmuted_for_current_user,
    bool? is_muted_for_all_users,
    bool? is_muted_for_current_user,
    bool? can_unmute_self,
    int? volume_level,
    String? order,
  }) {
    try {
      return TdlibFunction({
        "@type": "groupCallParticipant",
        "participant_id": participant_id!.toJson(),
        "audio_source_id": audio_source_id,
        "screen_sharing_audio_source_id": screen_sharing_audio_source_id,
        "video_info": video_info!.toJson(),
        "screen_sharing_video_info": screen_sharing_video_info!.toJson(),
        "bio": bio,
        "is_current_user": is_current_user,
        "is_speaking": is_speaking,
        "is_hand_raised": is_hand_raised,
        "can_be_muted_for_all_users": can_be_muted_for_all_users,
        "can_be_unmuted_for_all_users": can_be_unmuted_for_all_users,
        "can_be_muted_for_current_user": can_be_muted_for_current_user,
        "can_be_unmuted_for_current_user": can_be_unmuted_for_current_user,
        "is_muted_for_all_users": is_muted_for_all_users,
        "is_muted_for_current_user": is_muted_for_current_user,
        "can_unmute_self": can_unmute_self,
        "volume_level": volume_level,
        "order": order,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method groupCallParticipant",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemEcho.html).
  factory TdlibFunction.callProblemEcho() {
    try {
      return TdlibFunction({
        "@type": "callProblemEcho",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemEcho",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemNoise.html).
  factory TdlibFunction.callProblemNoise() {
    try {
      return TdlibFunction({
        "@type": "callProblemNoise",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemNoise",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemInterruptions.html).
  factory TdlibFunction.callProblemInterruptions() {
    try {
      return TdlibFunction({
        "@type": "callProblemInterruptions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemInterruptions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemDistortedSpeech.html).
  factory TdlibFunction.callProblemDistortedSpeech() {
    try {
      return TdlibFunction({
        "@type": "callProblemDistortedSpeech",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemDistortedSpeech",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemSilentLocal.html).
  factory TdlibFunction.callProblemSilentLocal() {
    try {
      return TdlibFunction({
        "@type": "callProblemSilentLocal",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemSilentLocal",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemSilentRemote.html).
  factory TdlibFunction.callProblemSilentRemote() {
    try {
      return TdlibFunction({
        "@type": "callProblemSilentRemote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemSilentRemote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemDropped.html).
  factory TdlibFunction.callProblemDropped() {
    try {
      return TdlibFunction({
        "@type": "callProblemDropped",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemDropped",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemDistortedVideo.html).
  factory TdlibFunction.callProblemDistortedVideo() {
    try {
      return TdlibFunction({
        "@type": "callProblemDistortedVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemDistortedVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callProblemPixelatedVideo.html).
  factory TdlibFunction.callProblemPixelatedVideo() {
    try {
      return TdlibFunction({
        "@type": "callProblemPixelatedVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callProblemPixelatedVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1call.html).
  factory TdlibFunction.call({
    int? id,
    int? user_id,
    bool? is_outgoing,
    bool? is_video,
    TdlibFunction? state,
  }) {
    try {
      return TdlibFunction({
        "@type": "call",
        "id": id,
        "user_id": user_id,
        "is_outgoing": is_outgoing,
        "is_video": is_video,
        "state": state!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method call",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1phoneNumberAuthenticationSettings.html).
  factory TdlibFunction.phoneNumberAuthenticationSettings({
    bool? allow_flash_call,
    bool? allow_missed_call,
    bool? is_current_phone_number,
    bool? allow_sms_retriever_api,
    List<String>? authentication_tokens,
  }) {
    try {
      return TdlibFunction({
        "@type": "phoneNumberAuthenticationSettings",
        "allow_flash_call": allow_flash_call,
        "allow_missed_call": allow_missed_call,
        "is_current_phone_number": is_current_phone_number,
        "allow_sms_retriever_api": allow_sms_retriever_api,
        "authentication_tokens": authentication_tokens,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method phoneNumberAuthenticationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addedReaction.html).
  factory TdlibFunction.addedReaction({
    TdlibFunction? type,
    TdlibFunction? sender_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "addedReaction",
        "type": type!.toJson(),
        "sender_id": sender_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addedReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addedReactions.html).
  factory TdlibFunction.addedReactions({
    int? total_count,
    TdlibFunction? reactions,
    String? next_offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "addedReactions",
        "total_count": total_count,
        "reactions": reactions!.toJson(),
        "next_offset": next_offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addedReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1availableReaction.html).
  factory TdlibFunction.availableReaction({
    TdlibFunction? type,
    bool? needs_premium,
  }) {
    try {
      return TdlibFunction({
        "@type": "availableReaction",
        "type": type!.toJson(),
        "needs_premium": needs_premium,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method availableReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1availableReactions.html).
  factory TdlibFunction.availableReactions({
    TdlibFunction? top_reactions,
    TdlibFunction? recent_reactions,
    TdlibFunction? popular_reactions,
    bool? allow_custom_emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "availableReactions",
        "top_reactions": top_reactions!.toJson(),
        "recent_reactions": recent_reactions!.toJson(),
        "popular_reactions": popular_reactions!.toJson(),
        "allow_custom_emoji": allow_custom_emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method availableReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1emojiReaction.html).
  factory TdlibFunction.emojiReaction({
    String? emoji,
    String? title,
    bool? is_active,
    TdlibFunction? static_icon,
    TdlibFunction? appear_animation,
    TdlibFunction? select_animation,
    TdlibFunction? activate_animation,
    TdlibFunction? effect_animation,
    TdlibFunction? around_animation,
    TdlibFunction? center_animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "emojiReaction",
        "emoji": emoji,
        "title": title,
        "is_active": is_active,
        "static_icon": static_icon!.toJson(),
        "appear_animation": appear_animation!.toJson(),
        "select_animation": select_animation!.toJson(),
        "activate_animation": activate_animation!.toJson(),
        "effect_animation": effect_animation!.toJson(),
        "around_animation": around_animation!.toJson(),
        "center_animation": center_animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method emojiReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1animations.html).
  factory TdlibFunction.animations({
    TdlibFunction? animations,
  }) {
    try {
      return TdlibFunction({
        "@type": "animations",
        "animations": animations!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method animations",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1diceStickersRegular.html).
  factory TdlibFunction.diceStickersRegular({
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "diceStickersRegular",
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method diceStickersRegular",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1diceStickersSlotMachine.html).
  factory TdlibFunction.diceStickersSlotMachine({
    TdlibFunction? background,
    TdlibFunction? lever,
    TdlibFunction? left_reel,
    TdlibFunction? center_reel,
    TdlibFunction? right_reel,
  }) {
    try {
      return TdlibFunction({
        "@type": "diceStickersSlotMachine",
        "background": background!.toJson(),
        "lever": lever!.toJson(),
        "left_reel": left_reel!.toJson(),
        "center_reel": center_reel!.toJson(),
        "right_reel": right_reel!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method diceStickersSlotMachine",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1importedContacts.html).
  factory TdlibFunction.importedContacts({
    List<int>? user_ids,
    List<int>? importer_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "importedContacts",
        "user_ids": user_ids,
        "importer_count": importer_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method importedContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1speechRecognitionResultPending.html).
  factory TdlibFunction.speechRecognitionResultPending({
    String? partial_text,
  }) {
    try {
      return TdlibFunction({
        "@type": "speechRecognitionResultPending",
        "partial_text": partial_text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method speechRecognitionResultPending",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1speechRecognitionResultText.html).
  factory TdlibFunction.speechRecognitionResultText({
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "speechRecognitionResultText",
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method speechRecognitionResultText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1speechRecognitionResultError.html).
  factory TdlibFunction.speechRecognitionResultError({
    TdlibFunction? error,
  }) {
    try {
      return TdlibFunction({
        "@type": "speechRecognitionResultError",
        "error": error!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method speechRecognitionResultError",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1attachmentMenuBotColor.html).
  factory TdlibFunction.attachmentMenuBotColor({
    int? light_color,
    int? dark_color,
  }) {
    try {
      return TdlibFunction({
        "@type": "attachmentMenuBotColor",
        "light_color": light_color,
        "dark_color": dark_color,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method attachmentMenuBotColor",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1attachmentMenuBot.html).
  factory TdlibFunction.attachmentMenuBot({
    int? bot_user_id,
    bool? supports_self_chat,
    bool? supports_user_chats,
    bool? supports_bot_chats,
    bool? supports_group_chats,
    bool? supports_channel_chats,
    bool? supports_settings,
    String? name,
    TdlibFunction? name_color,
    TdlibFunction? default_icon,
    TdlibFunction? ios_static_icon,
    TdlibFunction? ios_animated_icon,
    TdlibFunction? android_icon,
    TdlibFunction? macos_icon,
    TdlibFunction? icon_color,
    TdlibFunction? web_app_placeholder,
  }) {
    try {
      return TdlibFunction({
        "@type": "attachmentMenuBot",
        "bot_user_id": bot_user_id,
        "supports_self_chat": supports_self_chat,
        "supports_user_chats": supports_user_chats,
        "supports_bot_chats": supports_bot_chats,
        "supports_group_chats": supports_group_chats,
        "supports_channel_chats": supports_channel_chats,
        "supports_settings": supports_settings,
        "name": name,
        "name_color": name_color!.toJson(),
        "default_icon": default_icon!.toJson(),
        "ios_static_icon": ios_static_icon!.toJson(),
        "ios_animated_icon": ios_animated_icon!.toJson(),
        "android_icon": android_icon!.toJson(),
        "macos_icon": macos_icon!.toJson(),
        "icon_color": icon_color!.toJson(),
        "web_app_placeholder": web_app_placeholder!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method attachmentMenuBot",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sentWebAppMessage.html).
  factory TdlibFunction.sentWebAppMessage({
    String? inline_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "sentWebAppMessage",
        "inline_message_id": inline_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sentWebAppMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1httpUrl.html).
  factory TdlibFunction.httpUrl({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "httpUrl",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method httpUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultAnimation.html).
  factory TdlibFunction.inputInlineQueryResultAnimation({
    String? id,
    String? title,
    String? thumbnail_url,
    String? thumbnail_mime_type,
    String? video_url,
    String? video_mime_type,
    int? video_duration,
    int? video_width,
    int? video_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultAnimation",
        "id": id,
        "title": title,
        "thumbnail_url": thumbnail_url,
        "thumbnail_mime_type": thumbnail_mime_type,
        "video_url": video_url,
        "video_mime_type": video_mime_type,
        "video_duration": video_duration,
        "video_width": video_width,
        "video_height": video_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultArticle.html).
  factory TdlibFunction.inputInlineQueryResultArticle({
    String? id,
    String? url,
    bool? hide_url,
    String? title,
    String? description,
    String? thumbnail_url,
    int? thumbnail_width,
    int? thumbnail_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultArticle",
        "id": id,
        "url": url,
        "hide_url": hide_url,
        "title": title,
        "description": description,
        "thumbnail_url": thumbnail_url,
        "thumbnail_width": thumbnail_width,
        "thumbnail_height": thumbnail_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultArticle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultAudio.html).
  factory TdlibFunction.inputInlineQueryResultAudio({
    String? id,
    String? title,
    String? performer,
    String? audio_url,
    int? audio_duration,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultAudio",
        "id": id,
        "title": title,
        "performer": performer,
        "audio_url": audio_url,
        "audio_duration": audio_duration,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultContact.html).
  factory TdlibFunction.inputInlineQueryResultContact({
    String? id,
    TdlibFunction? contact,
    String? thumbnail_url,
    int? thumbnail_width,
    int? thumbnail_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultContact",
        "id": id,
        "contact": contact!.toJson(),
        "thumbnail_url": thumbnail_url,
        "thumbnail_width": thumbnail_width,
        "thumbnail_height": thumbnail_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultDocument.html).
  factory TdlibFunction.inputInlineQueryResultDocument({
    String? id,
    String? title,
    String? description,
    String? document_url,
    String? mime_type,
    String? thumbnail_url,
    int? thumbnail_width,
    int? thumbnail_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultDocument",
        "id": id,
        "title": title,
        "description": description,
        "document_url": document_url,
        "mime_type": mime_type,
        "thumbnail_url": thumbnail_url,
        "thumbnail_width": thumbnail_width,
        "thumbnail_height": thumbnail_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultGame.html).
  factory TdlibFunction.inputInlineQueryResultGame({
    String? id,
    String? game_short_name,
    TdlibFunction? reply_markup,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultGame",
        "id": id,
        "game_short_name": game_short_name,
        "reply_markup": reply_markup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultLocation.html).
  factory TdlibFunction.inputInlineQueryResultLocation({
    String? id,
    TdlibFunction? location,
    int? live_period,
    String? title,
    String? thumbnail_url,
    int? thumbnail_width,
    int? thumbnail_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultLocation",
        "id": id,
        "location": location!.toJson(),
        "live_period": live_period,
        "title": title,
        "thumbnail_url": thumbnail_url,
        "thumbnail_width": thumbnail_width,
        "thumbnail_height": thumbnail_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultPhoto.html).
  factory TdlibFunction.inputInlineQueryResultPhoto({
    String? id,
    String? title,
    String? description,
    String? thumbnail_url,
    String? photo_url,
    int? photo_width,
    int? photo_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultPhoto",
        "id": id,
        "title": title,
        "description": description,
        "thumbnail_url": thumbnail_url,
        "photo_url": photo_url,
        "photo_width": photo_width,
        "photo_height": photo_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultSticker.html).
  factory TdlibFunction.inputInlineQueryResultSticker({
    String? id,
    String? thumbnail_url,
    String? sticker_url,
    int? sticker_width,
    int? sticker_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultSticker",
        "id": id,
        "thumbnail_url": thumbnail_url,
        "sticker_url": sticker_url,
        "sticker_width": sticker_width,
        "sticker_height": sticker_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultVenue.html).
  factory TdlibFunction.inputInlineQueryResultVenue({
    String? id,
    TdlibFunction? venue,
    String? thumbnail_url,
    int? thumbnail_width,
    int? thumbnail_height,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultVenue",
        "id": id,
        "venue": venue!.toJson(),
        "thumbnail_url": thumbnail_url,
        "thumbnail_width": thumbnail_width,
        "thumbnail_height": thumbnail_height,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultVenue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultVideo.html).
  factory TdlibFunction.inputInlineQueryResultVideo({
    String? id,
    String? title,
    String? description,
    String? thumbnail_url,
    String? video_url,
    String? mime_type,
    int? video_width,
    int? video_height,
    int? video_duration,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultVideo",
        "id": id,
        "title": title,
        "description": description,
        "thumbnail_url": thumbnail_url,
        "video_url": video_url,
        "mime_type": mime_type,
        "video_width": video_width,
        "video_height": video_height,
        "video_duration": video_duration,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputInlineQueryResultVoiceNote.html).
  factory TdlibFunction.inputInlineQueryResultVoiceNote({
    String? id,
    String? title,
    String? voice_note_url,
    int? voice_note_duration,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputInlineQueryResultVoiceNote",
        "id": id,
        "title": title,
        "voice_note_url": voice_note_url,
        "voice_note_duration": voice_note_duration,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputInlineQueryResultVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultArticle.html).
  factory TdlibFunction.inlineQueryResultArticle({
    String? id,
    String? url,
    bool? hide_url,
    String? title,
    String? description,
    TdlibFunction? thumbnail,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultArticle",
        "id": id,
        "url": url,
        "hide_url": hide_url,
        "title": title,
        "description": description,
        "thumbnail": thumbnail!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultArticle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultContact.html).
  factory TdlibFunction.inlineQueryResultContact({
    String? id,
    TdlibFunction? contact,
    TdlibFunction? thumbnail,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultContact",
        "id": id,
        "contact": contact!.toJson(),
        "thumbnail": thumbnail!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultLocation.html).
  factory TdlibFunction.inlineQueryResultLocation({
    String? id,
    TdlibFunction? location,
    String? title,
    TdlibFunction? thumbnail,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultLocation",
        "id": id,
        "location": location!.toJson(),
        "title": title,
        "thumbnail": thumbnail!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultVenue.html).
  factory TdlibFunction.inlineQueryResultVenue({
    String? id,
    TdlibFunction? venue,
    TdlibFunction? thumbnail,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultVenue",
        "id": id,
        "venue": venue!.toJson(),
        "thumbnail": thumbnail!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultVenue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultGame.html).
  factory TdlibFunction.inlineQueryResultGame({
    String? id,
    TdlibFunction? game,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultGame",
        "id": id,
        "game": game!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultAnimation.html).
  factory TdlibFunction.inlineQueryResultAnimation({
    String? id,
    TdlibFunction? animation,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultAnimation",
        "id": id,
        "animation": animation!.toJson(),
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultAudio.html).
  factory TdlibFunction.inlineQueryResultAudio({
    String? id,
    TdlibFunction? audio,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultAudio",
        "id": id,
        "audio": audio!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultDocument.html).
  factory TdlibFunction.inlineQueryResultDocument({
    String? id,
    TdlibFunction? document,
    String? title,
    String? description,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultDocument",
        "id": id,
        "document": document!.toJson(),
        "title": title,
        "description": description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultPhoto.html).
  factory TdlibFunction.inlineQueryResultPhoto({
    String? id,
    TdlibFunction? photo,
    String? title,
    String? description,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultPhoto",
        "id": id,
        "photo": photo!.toJson(),
        "title": title,
        "description": description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultSticker.html).
  factory TdlibFunction.inlineQueryResultSticker({
    String? id,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultSticker",
        "id": id,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultVideo.html).
  factory TdlibFunction.inlineQueryResultVideo({
    String? id,
    TdlibFunction? video,
    String? title,
    String? description,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultVideo",
        "id": id,
        "video": video!.toJson(),
        "title": title,
        "description": description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResultVoiceNote.html).
  factory TdlibFunction.inlineQueryResultVoiceNote({
    String? id,
    TdlibFunction? voice_note,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResultVoiceNote",
        "id": id,
        "voice_note": voice_note!.toJson(),
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResultVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inlineQueryResults.html).
  factory TdlibFunction.inlineQueryResults({
    int? inline_query_id,
    String? next_offset,
    TdlibFunction? results,
    String? switch_pm_text,
    String? switch_pm_parameter,
  }) {
    try {
      return TdlibFunction({
        "@type": "inlineQueryResults",
        "inline_query_id": inline_query_id,
        "next_offset": next_offset,
        "results": results!.toJson(),
        "switch_pm_text": switch_pm_text,
        "switch_pm_parameter": switch_pm_parameter,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inlineQueryResults",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callbackQueryPayloadData.html).
  factory TdlibFunction.callbackQueryPayloadData({
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "callbackQueryPayloadData",
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callbackQueryPayloadData",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callbackQueryPayloadDataWithPassword.html).
  factory TdlibFunction.callbackQueryPayloadDataWithPassword({
    String? password,
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "callbackQueryPayloadDataWithPassword",
        "password": password,
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callbackQueryPayloadDataWithPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callbackQueryPayloadGame.html).
  factory TdlibFunction.callbackQueryPayloadGame({
    String? game_short_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "callbackQueryPayloadGame",
        "game_short_name": game_short_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callbackQueryPayloadGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1callbackQueryAnswer.html).
  factory TdlibFunction.callbackQueryAnswer({
    String? text,
    bool? show_alert,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "callbackQueryAnswer",
        "text": text,
        "show_alert": show_alert,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method callbackQueryAnswer",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1customRequestResult.html).
  factory TdlibFunction.customRequestResult({
    String? result,
  }) {
    try {
      return TdlibFunction({
        "@type": "customRequestResult",
        "result": result,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method customRequestResult",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1gameHighScore.html).
  factory TdlibFunction.gameHighScore({
    int? position,
    int? user_id,
    int? score,
  }) {
    try {
      return TdlibFunction({
        "@type": "gameHighScore",
        "position": position,
        "user_id": user_id,
        "score": score,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method gameHighScore",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1gameHighScores.html).
  factory TdlibFunction.gameHighScores({
    TdlibFunction? scores,
  }) {
    try {
      return TdlibFunction({
        "@type": "gameHighScores",
        "scores": scores!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method gameHighScores",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMessageEdited.html).
  factory TdlibFunction.chatEventMessageEdited({
    TdlibFunction? old_message,
    TdlibFunction? new_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMessageEdited",
        "old_message": old_message!.toJson(),
        "new_message": new_message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMessageEdited",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMessageDeleted.html).
  factory TdlibFunction.chatEventMessageDeleted({
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMessageDeleted",
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMessageDeleted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMessagePinned.html).
  factory TdlibFunction.chatEventMessagePinned({
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMessagePinned",
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMessagePinned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMessageUnpinned.html).
  factory TdlibFunction.chatEventMessageUnpinned({
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMessageUnpinned",
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMessageUnpinned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventPollStopped.html).
  factory TdlibFunction.chatEventPollStopped({
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventPollStopped",
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventPollStopped",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberJoined.html).
  factory TdlibFunction.chatEventMemberJoined() {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberJoined",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberJoined",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberJoinedByInviteLink.html).
  factory TdlibFunction.chatEventMemberJoinedByInviteLink({
    TdlibFunction? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberJoinedByInviteLink",
        "invite_link": invite_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberJoinedByInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberJoinedByRequest.html).
  factory TdlibFunction.chatEventMemberJoinedByRequest({
    int? approver_user_id,
    TdlibFunction? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberJoinedByRequest",
        "approver_user_id": approver_user_id,
        "invite_link": invite_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberJoinedByRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberInvited.html).
  factory TdlibFunction.chatEventMemberInvited({
    int? user_id,
    TdlibFunction? status,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberInvited",
        "user_id": user_id,
        "status": status!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberInvited",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberLeft.html).
  factory TdlibFunction.chatEventMemberLeft() {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberLeft",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberLeft",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberPromoted.html).
  factory TdlibFunction.chatEventMemberPromoted({
    int? user_id,
    TdlibFunction? old_status,
    TdlibFunction? new_status,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberPromoted",
        "user_id": user_id,
        "old_status": old_status!.toJson(),
        "new_status": new_status!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberPromoted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMemberRestricted.html).
  factory TdlibFunction.chatEventMemberRestricted({
    TdlibFunction? member_id,
    TdlibFunction? old_status,
    TdlibFunction? new_status,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMemberRestricted",
        "member_id": member_id!.toJson(),
        "old_status": old_status!.toJson(),
        "new_status": new_status!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMemberRestricted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventAvailableReactionsChanged.html).
  factory TdlibFunction.chatEventAvailableReactionsChanged({
    TdlibFunction? old_available_reactions,
    TdlibFunction? new_available_reactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventAvailableReactionsChanged",
        "old_available_reactions": old_available_reactions!.toJson(),
        "new_available_reactions": new_available_reactions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventAvailableReactionsChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventDescriptionChanged.html).
  factory TdlibFunction.chatEventDescriptionChanged({
    String? old_description,
    String? new_description,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventDescriptionChanged",
        "old_description": old_description,
        "new_description": new_description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventDescriptionChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventLinkedChatChanged.html).
  factory TdlibFunction.chatEventLinkedChatChanged({
    int? old_linked_chat_id,
    int? new_linked_chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventLinkedChatChanged",
        "old_linked_chat_id": old_linked_chat_id,
        "new_linked_chat_id": new_linked_chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventLinkedChatChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventLocationChanged.html).
  factory TdlibFunction.chatEventLocationChanged({
    TdlibFunction? old_location,
    TdlibFunction? new_location,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventLocationChanged",
        "old_location": old_location!.toJson(),
        "new_location": new_location!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventLocationChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventMessageTtlChanged.html).
  factory TdlibFunction.chatEventMessageTtlChanged({
    int? old_message_ttl,
    int? new_message_ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventMessageTtlChanged",
        "old_message_ttl": old_message_ttl,
        "new_message_ttl": new_message_ttl,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventMessageTtlChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventPermissionsChanged.html).
  factory TdlibFunction.chatEventPermissionsChanged({
    TdlibFunction? old_permissions,
    TdlibFunction? new_permissions,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventPermissionsChanged",
        "old_permissions": old_permissions!.toJson(),
        "new_permissions": new_permissions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventPermissionsChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventPhotoChanged.html).
  factory TdlibFunction.chatEventPhotoChanged({
    TdlibFunction? old_photo,
    TdlibFunction? new_photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventPhotoChanged",
        "old_photo": old_photo!.toJson(),
        "new_photo": new_photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventPhotoChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventSlowModeDelayChanged.html).
  factory TdlibFunction.chatEventSlowModeDelayChanged({
    int? old_slow_mode_delay,
    int? new_slow_mode_delay,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventSlowModeDelayChanged",
        "old_slow_mode_delay": old_slow_mode_delay,
        "new_slow_mode_delay": new_slow_mode_delay,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventSlowModeDelayChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventStickerSetChanged.html).
  factory TdlibFunction.chatEventStickerSetChanged({
    int? old_sticker_set_id,
    int? new_sticker_set_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventStickerSetChanged",
        "old_sticker_set_id": old_sticker_set_id,
        "new_sticker_set_id": new_sticker_set_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventStickerSetChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventTitleChanged.html).
  factory TdlibFunction.chatEventTitleChanged({
    String? old_title,
    String? new_title,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventTitleChanged",
        "old_title": old_title,
        "new_title": new_title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventTitleChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventUsernameChanged.html).
  factory TdlibFunction.chatEventUsernameChanged({
    String? old_username,
    String? new_username,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventUsernameChanged",
        "old_username": old_username,
        "new_username": new_username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventUsernameChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventHasProtectedContentToggled.html).
  factory TdlibFunction.chatEventHasProtectedContentToggled({
    bool? has_protected_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventHasProtectedContentToggled",
        "has_protected_content": has_protected_content,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventHasProtectedContentToggled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventInvitesToggled.html).
  factory TdlibFunction.chatEventInvitesToggled({
    bool? can_invite_users,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventInvitesToggled",
        "can_invite_users": can_invite_users,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventInvitesToggled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventIsAllHistoryAvailableToggled.html).
  factory TdlibFunction.chatEventIsAllHistoryAvailableToggled({
    bool? is_all_history_available,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventIsAllHistoryAvailableToggled",
        "is_all_history_available": is_all_history_available,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventIsAllHistoryAvailableToggled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventSignMessagesToggled.html).
  factory TdlibFunction.chatEventSignMessagesToggled({
    bool? sign_messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventSignMessagesToggled",
        "sign_messages": sign_messages,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventSignMessagesToggled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventInviteLinkEdited.html).
  factory TdlibFunction.chatEventInviteLinkEdited({
    TdlibFunction? old_invite_link,
    TdlibFunction? new_invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventInviteLinkEdited",
        "old_invite_link": old_invite_link!.toJson(),
        "new_invite_link": new_invite_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventInviteLinkEdited",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventInviteLinkRevoked.html).
  factory TdlibFunction.chatEventInviteLinkRevoked({
    TdlibFunction? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventInviteLinkRevoked",
        "invite_link": invite_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventInviteLinkRevoked",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventInviteLinkDeleted.html).
  factory TdlibFunction.chatEventInviteLinkDeleted({
    TdlibFunction? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventInviteLinkDeleted",
        "invite_link": invite_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventInviteLinkDeleted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventVideoChatCreated.html).
  factory TdlibFunction.chatEventVideoChatCreated({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventVideoChatCreated",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventVideoChatCreated",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventVideoChatEnded.html).
  factory TdlibFunction.chatEventVideoChatEnded({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventVideoChatEnded",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventVideoChatEnded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventVideoChatMuteNewParticipantsToggled.html).
  factory TdlibFunction.chatEventVideoChatMuteNewParticipantsToggled({
    bool? mute_new_participants,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventVideoChatMuteNewParticipantsToggled",
        "mute_new_participants": mute_new_participants,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventVideoChatMuteNewParticipantsToggled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventVideoChatParticipantIsMutedToggled.html).
  factory TdlibFunction.chatEventVideoChatParticipantIsMutedToggled({
    TdlibFunction? participant_id,
    bool? is_muted,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventVideoChatParticipantIsMutedToggled",
        "participant_id": participant_id!.toJson(),
        "is_muted": is_muted,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventVideoChatParticipantIsMutedToggled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventVideoChatParticipantVolumeLevelChanged.html).
  factory TdlibFunction.chatEventVideoChatParticipantVolumeLevelChanged({
    TdlibFunction? participant_id,
    int? volume_level,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventVideoChatParticipantVolumeLevelChanged",
        "participant_id": participant_id!.toJson(),
        "volume_level": volume_level,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventVideoChatParticipantVolumeLevelChanged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEvent.html).
  factory TdlibFunction.chatEvent({
    int? id,
    int? date,
    TdlibFunction? member_id,
    TdlibFunction? action,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEvent",
        "id": id,
        "date": date,
        "member_id": member_id!.toJson(),
        "action": action!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEvent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEvents.html).
  factory TdlibFunction.chatEvents({
    TdlibFunction? events,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEvents",
        "events": events!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEvents",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatEventLogFilters.html).
  factory TdlibFunction.chatEventLogFilters({
    bool? message_edits,
    bool? message_deletions,
    bool? message_pins,
    bool? member_joins,
    bool? member_leaves,
    bool? member_invites,
    bool? member_promotions,
    bool? member_restrictions,
    bool? info_changes,
    bool? setting_changes,
    bool? invite_link_changes,
    bool? video_chat_changes,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatEventLogFilters",
        "message_edits": message_edits,
        "message_deletions": message_deletions,
        "message_pins": message_pins,
        "member_joins": member_joins,
        "member_leaves": member_leaves,
        "member_invites": member_invites,
        "member_promotions": member_promotions,
        "member_restrictions": member_restrictions,
        "info_changes": info_changes,
        "setting_changes": setting_changes,
        "invite_link_changes": invite_link_changes,
        "video_chat_changes": video_chat_changes,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatEventLogFilters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1languagePackStringValueOrdinary.html).
  factory TdlibFunction.languagePackStringValueOrdinary({
    String? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "languagePackStringValueOrdinary",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method languagePackStringValueOrdinary",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1languagePackStringValuePluralized.html).
  factory TdlibFunction.languagePackStringValuePluralized({
    String? zero_value,
    String? one_value,
    String? two_value,
    String? few_value,
    String? many_value,
    String? other_value,
  }) {
    try {
      return TdlibFunction({
        "@type": "languagePackStringValuePluralized",
        "zero_value": zero_value,
        "one_value": one_value,
        "two_value": two_value,
        "few_value": few_value,
        "many_value": many_value,
        "other_value": other_value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method languagePackStringValuePluralized",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1languagePackStringValueDeleted.html).
  factory TdlibFunction.languagePackStringValueDeleted() {
    try {
      return TdlibFunction({
        "@type": "languagePackStringValueDeleted",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method languagePackStringValueDeleted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1languagePackString.html).
  factory TdlibFunction.languagePackString({
    String? key,
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "languagePackString",
        "key": key,
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method languagePackString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1languagePackStrings.html).
  factory TdlibFunction.languagePackStrings({
    TdlibFunction? strings,
  }) {
    try {
      return TdlibFunction({
        "@type": "languagePackStrings",
        "strings": strings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method languagePackStrings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1languagePackInfo.html).
  factory TdlibFunction.languagePackInfo({
    String? id,
    String? base_language_pack_id,
    String? name,
    String? native_name,
    String? plural_code,
    bool? is_official,
    bool? is_rtl,
    bool? is_beta,
    bool? is_installed,
    int? total_string_count,
    int? translated_string_count,
    int? local_string_count,
    String? translation_url,
  }) {
    try {
      return TdlibFunction({
        "@type": "languagePackInfo",
        "id": id,
        "base_language_pack_id": base_language_pack_id,
        "name": name,
        "native_name": native_name,
        "plural_code": plural_code,
        "is_official": is_official,
        "is_rtl": is_rtl,
        "is_beta": is_beta,
        "is_installed": is_installed,
        "total_string_count": total_string_count,
        "translated_string_count": translated_string_count,
        "local_string_count": local_string_count,
        "translation_url": translation_url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method languagePackInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1localizationTargetInfo.html).
  factory TdlibFunction.localizationTargetInfo({
    TdlibFunction? language_packs,
  }) {
    try {
      return TdlibFunction({
        "@type": "localizationTargetInfo",
        "language_packs": language_packs!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method localizationTargetInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeSupergroupCount.html).
  factory TdlibFunction.premiumLimitTypeSupergroupCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeSupergroupCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeSupergroupCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypePinnedChatCount.html).
  factory TdlibFunction.premiumLimitTypePinnedChatCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypePinnedChatCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypePinnedChatCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeCreatedPublicChatCount.html).
  factory TdlibFunction.premiumLimitTypeCreatedPublicChatCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeCreatedPublicChatCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeCreatedPublicChatCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeSavedAnimationCount.html).
  factory TdlibFunction.premiumLimitTypeSavedAnimationCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeSavedAnimationCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeSavedAnimationCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeFavoriteStickerCount.html).
  factory TdlibFunction.premiumLimitTypeFavoriteStickerCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeFavoriteStickerCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeFavoriteStickerCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeChatFilterCount.html).
  factory TdlibFunction.premiumLimitTypeChatFilterCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeChatFilterCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeChatFilterCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeChatFilterChosenChatCount.html).
  factory TdlibFunction.premiumLimitTypeChatFilterChosenChatCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeChatFilterChosenChatCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeChatFilterChosenChatCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypePinnedArchivedChatCount.html).
  factory TdlibFunction.premiumLimitTypePinnedArchivedChatCount() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypePinnedArchivedChatCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypePinnedArchivedChatCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeCaptionLength.html).
  factory TdlibFunction.premiumLimitTypeCaptionLength() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeCaptionLength",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeCaptionLength",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimitTypeBioLength.html).
  factory TdlibFunction.premiumLimitTypeBioLength() {
    try {
      return TdlibFunction({
        "@type": "premiumLimitTypeBioLength",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimitTypeBioLength",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureIncreasedLimits.html).
  factory TdlibFunction.premiumFeatureIncreasedLimits() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureIncreasedLimits",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureIncreasedLimits",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureIncreasedUploadFileSize.html).
  factory TdlibFunction.premiumFeatureIncreasedUploadFileSize() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureIncreasedUploadFileSize",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureIncreasedUploadFileSize",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureImprovedDownloadSpeed.html).
  factory TdlibFunction.premiumFeatureImprovedDownloadSpeed() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureImprovedDownloadSpeed",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureImprovedDownloadSpeed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureVoiceRecognition.html).
  factory TdlibFunction.premiumFeatureVoiceRecognition() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureVoiceRecognition",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureVoiceRecognition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureDisabledAds.html).
  factory TdlibFunction.premiumFeatureDisabledAds() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureDisabledAds",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureDisabledAds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureUniqueReactions.html).
  factory TdlibFunction.premiumFeatureUniqueReactions() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureUniqueReactions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureUniqueReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureUniqueStickers.html).
  factory TdlibFunction.premiumFeatureUniqueStickers() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureUniqueStickers",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureUniqueStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureCustomEmoji.html).
  factory TdlibFunction.premiumFeatureCustomEmoji() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureCustomEmoji",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureCustomEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureAdvancedChatManagement.html).
  factory TdlibFunction.premiumFeatureAdvancedChatManagement() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureAdvancedChatManagement",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureAdvancedChatManagement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureProfileBadge.html).
  factory TdlibFunction.premiumFeatureProfileBadge() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureProfileBadge",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureProfileBadge",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureEmojiStatus.html).
  factory TdlibFunction.premiumFeatureEmojiStatus() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureEmojiStatus",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureEmojiStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureAnimatedProfilePhoto.html).
  factory TdlibFunction.premiumFeatureAnimatedProfilePhoto() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureAnimatedProfilePhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureAnimatedProfilePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatureAppIcons.html).
  factory TdlibFunction.premiumFeatureAppIcons() {
    try {
      return TdlibFunction({
        "@type": "premiumFeatureAppIcons",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatureAppIcons",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumLimit.html).
  factory TdlibFunction.premiumLimit({
    TdlibFunction? type,
    int? default_value,
    int? premium_value,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumLimit",
        "type": type!.toJson(),
        "default_value": default_value,
        "premium_value": premium_value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumLimit",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeatures.html).
  factory TdlibFunction.premiumFeatures({
    TdlibFunction? features,
    TdlibFunction? limits,
    TdlibFunction? payment_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumFeatures",
        "features": features!.toJson(),
        "limits": limits!.toJson(),
        "payment_link": payment_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeatures",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumSourceLimitExceeded.html).
  factory TdlibFunction.premiumSourceLimitExceeded({
    TdlibFunction? limit_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumSourceLimitExceeded",
        "limit_type": limit_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumSourceLimitExceeded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumSourceFeature.html).
  factory TdlibFunction.premiumSourceFeature({
    TdlibFunction? feature,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumSourceFeature",
        "feature": feature!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumSourceFeature",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumSourceLink.html).
  factory TdlibFunction.premiumSourceLink({
    String? referrer,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumSourceLink",
        "referrer": referrer,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumSourceLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumSourceSettings.html).
  factory TdlibFunction.premiumSourceSettings() {
    try {
      return TdlibFunction({
        "@type": "premiumSourceSettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumSourceSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumFeaturePromotionAnimation.html).
  factory TdlibFunction.premiumFeaturePromotionAnimation({
    TdlibFunction? feature,
    TdlibFunction? animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumFeaturePromotionAnimation",
        "feature": feature!.toJson(),
        "animation": animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumFeaturePromotionAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1premiumState.html).
  factory TdlibFunction.premiumState({
    TdlibFunction? state,
    TdlibFunction? payment_options,
    TdlibFunction? animations,
  }) {
    try {
      return TdlibFunction({
        "@type": "premiumState",
        "state": state!.toJson(),
        "payment_options": payment_options!.toJson(),
        "animations": animations!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method premiumState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1storePaymentPurposePremiumSubscription.html).
  factory TdlibFunction.storePaymentPurposePremiumSubscription({
    bool? is_restore,
  }) {
    try {
      return TdlibFunction({
        "@type": "storePaymentPurposePremiumSubscription",
        "is_restore": is_restore,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method storePaymentPurposePremiumSubscription",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1storePaymentPurposeGiftedPremium.html).
  factory TdlibFunction.storePaymentPurposeGiftedPremium({
    int? user_id,
    String? currency,
    int? amount,
  }) {
    try {
      return TdlibFunction({
        "@type": "storePaymentPurposeGiftedPremium",
        "user_id": user_id,
        "currency": currency,
        "amount": amount,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method storePaymentPurposeGiftedPremium",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenFirebaseCloudMessaging.html).
  factory TdlibFunction.deviceTokenFirebaseCloudMessaging({
    String? token,
    bool? encrypt,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenFirebaseCloudMessaging",
        "token": token,
        "encrypt": encrypt,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenFirebaseCloudMessaging",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenApplePush.html).
  factory TdlibFunction.deviceTokenApplePush({
    String? device_token,
    bool? is_app_sandbox,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenApplePush",
        "device_token": device_token,
        "is_app_sandbox": is_app_sandbox,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenApplePush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenApplePushVoIP.html).
  factory TdlibFunction.deviceTokenApplePushVoIP({
    String? device_token,
    bool? is_app_sandbox,
    bool? encrypt,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenApplePushVoIP",
        "device_token": device_token,
        "is_app_sandbox": is_app_sandbox,
        "encrypt": encrypt,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenApplePushVoIP",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenWindowsPush.html).
  factory TdlibFunction.deviceTokenWindowsPush({
    String? access_token,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenWindowsPush",
        "access_token": access_token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenWindowsPush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenMicrosoftPush.html).
  factory TdlibFunction.deviceTokenMicrosoftPush({
    String? channel_uri,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenMicrosoftPush",
        "channel_uri": channel_uri,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenMicrosoftPush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenMicrosoftPushVoIP.html).
  factory TdlibFunction.deviceTokenMicrosoftPushVoIP({
    String? channel_uri,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenMicrosoftPushVoIP",
        "channel_uri": channel_uri,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenMicrosoftPushVoIP",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenWebPush.html).
  factory TdlibFunction.deviceTokenWebPush({
    String? endpoint,
    String? p256dh_base64url,
    String? auth_base64url,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenWebPush",
        "endpoint": endpoint,
        "p256dh_base64url": p256dh_base64url,
        "auth_base64url": auth_base64url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenWebPush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenSimplePush.html).
  factory TdlibFunction.deviceTokenSimplePush({
    String? endpoint,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenSimplePush",
        "endpoint": endpoint,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenSimplePush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenUbuntuPush.html).
  factory TdlibFunction.deviceTokenUbuntuPush({
    String? token,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenUbuntuPush",
        "token": token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenUbuntuPush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenBlackBerryPush.html).
  factory TdlibFunction.deviceTokenBlackBerryPush({
    String? token,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenBlackBerryPush",
        "token": token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenBlackBerryPush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deviceTokenTizenPush.html).
  factory TdlibFunction.deviceTokenTizenPush({
    String? reg_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deviceTokenTizenPush",
        "reg_id": reg_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deviceTokenTizenPush",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushReceiverId.html).
  factory TdlibFunction.pushReceiverId({
    int? id,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushReceiverId",
        "id": id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushReceiverId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgroundFillSolid.html).
  factory TdlibFunction.backgroundFillSolid({
    int? color,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgroundFillSolid",
        "color": color,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgroundFillSolid",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgroundFillGradient.html).
  factory TdlibFunction.backgroundFillGradient({
    int? top_color,
    int? bottom_color,
    int? rotation_angle,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgroundFillGradient",
        "top_color": top_color,
        "bottom_color": bottom_color,
        "rotation_angle": rotation_angle,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgroundFillGradient",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgroundFillFreeformGradient.html).
  factory TdlibFunction.backgroundFillFreeformGradient({
    List<int>? colors,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgroundFillFreeformGradient",
        "colors": colors,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgroundFillFreeformGradient",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgroundTypeWallpaper.html).
  factory TdlibFunction.backgroundTypeWallpaper({
    bool? is_blurred,
    bool? is_moving,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgroundTypeWallpaper",
        "is_blurred": is_blurred,
        "is_moving": is_moving,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgroundTypeWallpaper",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgroundTypePattern.html).
  factory TdlibFunction.backgroundTypePattern({
    TdlibFunction? fill,
    int? intensity,
    bool? is_inverted,
    bool? is_moving,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgroundTypePattern",
        "fill": fill!.toJson(),
        "intensity": intensity,
        "is_inverted": is_inverted,
        "is_moving": is_moving,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgroundTypePattern",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgroundTypeFill.html).
  factory TdlibFunction.backgroundTypeFill({
    TdlibFunction? fill,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgroundTypeFill",
        "fill": fill!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgroundTypeFill",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1background.html).
  factory TdlibFunction.background({
    int? id,
    bool? is_default,
    bool? is_dark,
    String? name,
    TdlibFunction? document,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "background",
        "id": id,
        "is_default": is_default,
        "is_dark": is_dark,
        "name": name,
        "document": document!.toJson(),
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method background",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1backgrounds.html).
  factory TdlibFunction.backgrounds({
    TdlibFunction? backgrounds,
  }) {
    try {
      return TdlibFunction({
        "@type": "backgrounds",
        "backgrounds": backgrounds!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method backgrounds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputBackgroundLocal.html).
  factory TdlibFunction.inputBackgroundLocal({
    TdlibFunction? background,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputBackgroundLocal",
        "background": background!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputBackgroundLocal",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputBackgroundRemote.html).
  factory TdlibFunction.inputBackgroundRemote({
    int? background_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputBackgroundRemote",
        "background_id": background_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputBackgroundRemote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1themeSettings.html).
  factory TdlibFunction.themeSettings({
    int? accent_color,
    TdlibFunction? background,
    TdlibFunction? outgoing_message_fill,
    bool? animate_outgoing_message_fill,
    int? outgoing_message_accent_color,
  }) {
    try {
      return TdlibFunction({
        "@type": "themeSettings",
        "accent_color": accent_color,
        "background": background!.toJson(),
        "outgoing_message_fill": outgoing_message_fill!.toJson(),
        "animate_outgoing_message_fill": animate_outgoing_message_fill,
        "outgoing_message_accent_color": outgoing_message_accent_color,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method themeSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatTheme.html).
  factory TdlibFunction.chatTheme({
    String? name,
    TdlibFunction? light_settings,
    TdlibFunction? dark_settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatTheme",
        "name": name,
        "light_settings": light_settings!.toJson(),
        "dark_settings": dark_settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatTheme",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1hashtags.html).
  factory TdlibFunction.hashtags({
    List<String>? hashtags,
  }) {
    try {
      return TdlibFunction({
        "@type": "hashtags",
        "hashtags": hashtags,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method hashtags",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1canTransferOwnershipResultOk.html).
  factory TdlibFunction.canTransferOwnershipResultOk() {
    try {
      return TdlibFunction({
        "@type": "canTransferOwnershipResultOk",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method canTransferOwnershipResultOk",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1canTransferOwnershipResultPasswordNeeded.html).
  factory TdlibFunction.canTransferOwnershipResultPasswordNeeded() {
    try {
      return TdlibFunction({
        "@type": "canTransferOwnershipResultPasswordNeeded",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method canTransferOwnershipResultPasswordNeeded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1canTransferOwnershipResultPasswordTooFresh.html).
  factory TdlibFunction.canTransferOwnershipResultPasswordTooFresh({
    int? retry_after,
  }) {
    try {
      return TdlibFunction({
        "@type": "canTransferOwnershipResultPasswordTooFresh",
        "retry_after": retry_after,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method canTransferOwnershipResultPasswordTooFresh",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1canTransferOwnershipResultSessionTooFresh.html).
  factory TdlibFunction.canTransferOwnershipResultSessionTooFresh({
    int? retry_after,
  }) {
    try {
      return TdlibFunction({
        "@type": "canTransferOwnershipResultSessionTooFresh",
        "retry_after": retry_after,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method canTransferOwnershipResultSessionTooFresh",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatUsernameResultOk.html).
  factory TdlibFunction.checkChatUsernameResultOk() {
    try {
      return TdlibFunction({
        "@type": "checkChatUsernameResultOk",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatUsernameResultOk",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatUsernameResultUsernameInvalid.html).
  factory TdlibFunction.checkChatUsernameResultUsernameInvalid() {
    try {
      return TdlibFunction({
        "@type": "checkChatUsernameResultUsernameInvalid",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatUsernameResultUsernameInvalid",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatUsernameResultUsernameOccupied.html).
  factory TdlibFunction.checkChatUsernameResultUsernameOccupied() {
    try {
      return TdlibFunction({
        "@type": "checkChatUsernameResultUsernameOccupied",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatUsernameResultUsernameOccupied",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatUsernameResultPublicChatsTooMuch.html).
  factory TdlibFunction.checkChatUsernameResultPublicChatsTooMuch() {
    try {
      return TdlibFunction({
        "@type": "checkChatUsernameResultPublicChatsTooMuch",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatUsernameResultPublicChatsTooMuch",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatUsernameResultPublicGroupsUnavailable.html).
  factory TdlibFunction.checkChatUsernameResultPublicGroupsUnavailable() {
    try {
      return TdlibFunction({
        "@type": "checkChatUsernameResultPublicGroupsUnavailable",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatUsernameResultPublicGroupsUnavailable",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkStickerSetNameResultOk.html).
  factory TdlibFunction.checkStickerSetNameResultOk() {
    try {
      return TdlibFunction({
        "@type": "checkStickerSetNameResultOk",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkStickerSetNameResultOk",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkStickerSetNameResultNameInvalid.html).
  factory TdlibFunction.checkStickerSetNameResultNameInvalid() {
    try {
      return TdlibFunction({
        "@type": "checkStickerSetNameResultNameInvalid",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkStickerSetNameResultNameInvalid",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkStickerSetNameResultNameOccupied.html).
  factory TdlibFunction.checkStickerSetNameResultNameOccupied() {
    try {
      return TdlibFunction({
        "@type": "checkStickerSetNameResultNameOccupied",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkStickerSetNameResultNameOccupied",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetPasswordResultOk.html).
  factory TdlibFunction.resetPasswordResultOk() {
    try {
      return TdlibFunction({
        "@type": "resetPasswordResultOk",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetPasswordResultOk",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetPasswordResultPending.html).
  factory TdlibFunction.resetPasswordResultPending({
    int? pending_reset_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "resetPasswordResultPending",
        "pending_reset_date": pending_reset_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetPasswordResultPending",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetPasswordResultDeclined.html).
  factory TdlibFunction.resetPasswordResultDeclined({
    int? retry_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "resetPasswordResultDeclined",
        "retry_date": retry_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetPasswordResultDeclined",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageFileTypePrivate.html).
  factory TdlibFunction.messageFileTypePrivate({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageFileTypePrivate",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageFileTypePrivate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageFileTypeGroup.html).
  factory TdlibFunction.messageFileTypeGroup({
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageFileTypeGroup",
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageFileTypeGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageFileTypeUnknown.html).
  factory TdlibFunction.messageFileTypeUnknown() {
    try {
      return TdlibFunction({
        "@type": "messageFileTypeUnknown",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageFileTypeUnknown",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentHidden.html).
  factory TdlibFunction.pushMessageContentHidden({
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentHidden",
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentHidden",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentAnimation.html).
  factory TdlibFunction.pushMessageContentAnimation({
    TdlibFunction? animation,
    String? caption,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentAnimation",
        "animation": animation!.toJson(),
        "caption": caption,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentAudio.html).
  factory TdlibFunction.pushMessageContentAudio({
    TdlibFunction? audio,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentAudio",
        "audio": audio!.toJson(),
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentContact.html).
  factory TdlibFunction.pushMessageContentContact({
    String? name,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentContact",
        "name": name,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentContactRegistered.html).
  factory TdlibFunction.pushMessageContentContactRegistered() {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentContactRegistered",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentContactRegistered",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentDocument.html).
  factory TdlibFunction.pushMessageContentDocument({
    TdlibFunction? document,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentDocument",
        "document": document!.toJson(),
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentGame.html).
  factory TdlibFunction.pushMessageContentGame({
    String? title,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentGame",
        "title": title,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentGameScore.html).
  factory TdlibFunction.pushMessageContentGameScore({
    String? title,
    int? score,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentGameScore",
        "title": title,
        "score": score,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentGameScore",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentInvoice.html).
  factory TdlibFunction.pushMessageContentInvoice({
    String? price,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentInvoice",
        "price": price,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentInvoice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentLocation.html).
  factory TdlibFunction.pushMessageContentLocation({
    bool? is_live,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentLocation",
        "is_live": is_live,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentPhoto.html).
  factory TdlibFunction.pushMessageContentPhoto({
    TdlibFunction? photo,
    String? caption,
    bool? is_secret,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentPhoto",
        "photo": photo!.toJson(),
        "caption": caption,
        "is_secret": is_secret,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentPoll.html).
  factory TdlibFunction.pushMessageContentPoll({
    String? question,
    bool? is_regular,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentPoll",
        "question": question,
        "is_regular": is_regular,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentPoll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentScreenshotTaken.html).
  factory TdlibFunction.pushMessageContentScreenshotTaken() {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentScreenshotTaken",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentScreenshotTaken",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentSticker.html).
  factory TdlibFunction.pushMessageContentSticker({
    TdlibFunction? sticker,
    String? emoji,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentSticker",
        "sticker": sticker!.toJson(),
        "emoji": emoji,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentText.html).
  factory TdlibFunction.pushMessageContentText({
    String? text,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentText",
        "text": text,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentVideo.html).
  factory TdlibFunction.pushMessageContentVideo({
    TdlibFunction? video,
    String? caption,
    bool? is_secret,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentVideo",
        "video": video!.toJson(),
        "caption": caption,
        "is_secret": is_secret,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentVideoNote.html).
  factory TdlibFunction.pushMessageContentVideoNote({
    TdlibFunction? video_note,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentVideoNote",
        "video_note": video_note!.toJson(),
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentVoiceNote.html).
  factory TdlibFunction.pushMessageContentVoiceNote({
    TdlibFunction? voice_note,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentVoiceNote",
        "voice_note": voice_note!.toJson(),
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentBasicGroupChatCreate.html).
  factory TdlibFunction.pushMessageContentBasicGroupChatCreate() {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentBasicGroupChatCreate",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentBasicGroupChatCreate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatAddMembers.html).
  factory TdlibFunction.pushMessageContentChatAddMembers({
    String? member_name,
    bool? is_current_user,
    bool? is_returned,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatAddMembers",
        "member_name": member_name,
        "is_current_user": is_current_user,
        "is_returned": is_returned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatAddMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatChangePhoto.html).
  factory TdlibFunction.pushMessageContentChatChangePhoto() {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatChangePhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatChangePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatChangeTitle.html).
  factory TdlibFunction.pushMessageContentChatChangeTitle({
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatChangeTitle",
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatChangeTitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatSetTheme.html).
  factory TdlibFunction.pushMessageContentChatSetTheme({
    String? theme_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatSetTheme",
        "theme_name": theme_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatSetTheme",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatDeleteMember.html).
  factory TdlibFunction.pushMessageContentChatDeleteMember({
    String? member_name,
    bool? is_current_user,
    bool? is_left,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatDeleteMember",
        "member_name": member_name,
        "is_current_user": is_current_user,
        "is_left": is_left,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatDeleteMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatJoinByLink.html).
  factory TdlibFunction.pushMessageContentChatJoinByLink() {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatJoinByLink",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatJoinByLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentChatJoinByRequest.html).
  factory TdlibFunction.pushMessageContentChatJoinByRequest() {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentChatJoinByRequest",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentChatJoinByRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentRecurringPayment.html).
  factory TdlibFunction.pushMessageContentRecurringPayment({
    String? amount,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentRecurringPayment",
        "amount": amount,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentRecurringPayment",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentMessageForwards.html).
  factory TdlibFunction.pushMessageContentMessageForwards({
    int? total_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentMessageForwards",
        "total_count": total_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentMessageForwards",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pushMessageContentMediaAlbum.html).
  factory TdlibFunction.pushMessageContentMediaAlbum({
    int? total_count,
    bool? has_photos,
    bool? has_videos,
    bool? has_audios,
    bool? has_documents,
  }) {
    try {
      return TdlibFunction({
        "@type": "pushMessageContentMediaAlbum",
        "total_count": total_count,
        "has_photos": has_photos,
        "has_videos": has_videos,
        "has_audios": has_audios,
        "has_documents": has_documents,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pushMessageContentMediaAlbum",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationTypeNewMessage.html).
  factory TdlibFunction.notificationTypeNewMessage({
    TdlibFunction? message,
    bool? show_preview,
  }) {
    try {
      return TdlibFunction({
        "@type": "notificationTypeNewMessage",
        "message": message!.toJson(),
        "show_preview": show_preview,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationTypeNewMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationTypeNewSecretChat.html).
  factory TdlibFunction.notificationTypeNewSecretChat() {
    try {
      return TdlibFunction({
        "@type": "notificationTypeNewSecretChat",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationTypeNewSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationTypeNewCall.html).
  factory TdlibFunction.notificationTypeNewCall({
    int? call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "notificationTypeNewCall",
        "call_id": call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationTypeNewCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationTypeNewPushMessage.html).
  factory TdlibFunction.notificationTypeNewPushMessage({
    int? message_id,
    TdlibFunction? sender_id,
    String? sender_name,
    bool? is_outgoing,
    TdlibFunction? content,
  }) {
    try {
      return TdlibFunction({
        "@type": "notificationTypeNewPushMessage",
        "message_id": message_id,
        "sender_id": sender_id!.toJson(),
        "sender_name": sender_name,
        "is_outgoing": is_outgoing,
        "content": content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationTypeNewPushMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationGroupTypeMessages.html).
  factory TdlibFunction.notificationGroupTypeMessages() {
    try {
      return TdlibFunction({
        "@type": "notificationGroupTypeMessages",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationGroupTypeMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationGroupTypeMentions.html).
  factory TdlibFunction.notificationGroupTypeMentions() {
    try {
      return TdlibFunction({
        "@type": "notificationGroupTypeMentions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationGroupTypeMentions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationGroupTypeSecretChat.html).
  factory TdlibFunction.notificationGroupTypeSecretChat() {
    try {
      return TdlibFunction({
        "@type": "notificationGroupTypeSecretChat",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationGroupTypeSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationGroupTypeCalls.html).
  factory TdlibFunction.notificationGroupTypeCalls() {
    try {
      return TdlibFunction({
        "@type": "notificationGroupTypeCalls",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationGroupTypeCalls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationSound.html).
  factory TdlibFunction.notificationSound({
    int? id,
    int? duration,
    int? date,
    String? title,
    String? data,
    TdlibFunction? sound,
  }) {
    try {
      return TdlibFunction({
        "@type": "notificationSound",
        "id": id,
        "duration": duration,
        "date": date,
        "title": title,
        "data": data,
        "sound": sound!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationSound",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationSounds.html).
  factory TdlibFunction.notificationSounds({
    TdlibFunction? notification_sounds,
  }) {
    try {
      return TdlibFunction({
        "@type": "notificationSounds",
        "notification_sounds": notification_sounds!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationSounds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notification.html).
  factory TdlibFunction.notification({
    int? id,
    int? date,
    bool? is_silent,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "notification",
        "id": id,
        "date": date,
        "is_silent": is_silent,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1notificationGroup.html).
  factory TdlibFunction.notificationGroup({
    int? id,
    TdlibFunction? type,
    int? chat_id,
    int? total_count,
    TdlibFunction? notifications,
  }) {
    try {
      return TdlibFunction({
        "@type": "notificationGroup",
        "id": id,
        "type": type!.toJson(),
        "chat_id": chat_id,
        "total_count": total_count,
        "notifications": notifications!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method notificationGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1optionValueBoolean.html).
  factory TdlibFunction.optionValueBoolean({
    bool? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "optionValueBoolean",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method optionValueBoolean",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1optionValueEmpty.html).
  factory TdlibFunction.optionValueEmpty() {
    try {
      return TdlibFunction({
        "@type": "optionValueEmpty",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method optionValueEmpty",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1optionValueInteger.html).
  factory TdlibFunction.optionValueInteger({
    int? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "optionValueInteger",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method optionValueInteger",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1optionValueString.html).
  factory TdlibFunction.optionValueString({
    String? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "optionValueString",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method optionValueString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonObjectMember.html).
  factory TdlibFunction.jsonObjectMember({
    String? key,
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "jsonObjectMember",
        "key": key,
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonObjectMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonValueNull.html).
  factory TdlibFunction.jsonValueNull() {
    try {
      return TdlibFunction({
        "@type": "jsonValueNull",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonValueNull",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonValueBoolean.html).
  factory TdlibFunction.jsonValueBoolean({
    bool? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "jsonValueBoolean",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonValueBoolean",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonValueNumber.html).
  factory TdlibFunction.jsonValueNumber({
    double? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "jsonValueNumber",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonValueNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonValueString.html).
  factory TdlibFunction.jsonValueString({
    String? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "jsonValueString",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonValueString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonValueArray.html).
  factory TdlibFunction.jsonValueArray({
    TdlibFunction? values,
  }) {
    try {
      return TdlibFunction({
        "@type": "jsonValueArray",
        "values": values!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonValueArray",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1jsonValueObject.html).
  factory TdlibFunction.jsonValueObject({
    TdlibFunction? members,
  }) {
    try {
      return TdlibFunction({
        "@type": "jsonValueObject",
        "members": members!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method jsonValueObject",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleAllowAll.html).
  factory TdlibFunction.userPrivacySettingRuleAllowAll() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleAllowAll",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleAllowAll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleAllowContacts.html).
  factory TdlibFunction.userPrivacySettingRuleAllowContacts() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleAllowContacts",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleAllowContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleAllowUsers.html).
  factory TdlibFunction.userPrivacySettingRuleAllowUsers({
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleAllowUsers",
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleAllowUsers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleAllowChatMembers.html).
  factory TdlibFunction.userPrivacySettingRuleAllowChatMembers({
    List<int>? chat_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleAllowChatMembers",
        "chat_ids": chat_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleAllowChatMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleRestrictAll.html).
  factory TdlibFunction.userPrivacySettingRuleRestrictAll() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleRestrictAll",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleRestrictAll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleRestrictContacts.html).
  factory TdlibFunction.userPrivacySettingRuleRestrictContacts() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleRestrictContacts",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleRestrictContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleRestrictUsers.html).
  factory TdlibFunction.userPrivacySettingRuleRestrictUsers({
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleRestrictUsers",
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleRestrictUsers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRuleRestrictChatMembers.html).
  factory TdlibFunction.userPrivacySettingRuleRestrictChatMembers({
    List<int>? chat_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRuleRestrictChatMembers",
        "chat_ids": chat_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRuleRestrictChatMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingRules.html).
  factory TdlibFunction.userPrivacySettingRules({
    TdlibFunction? rules,
  }) {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingRules",
        "rules": rules!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingRules",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingShowStatus.html).
  factory TdlibFunction.userPrivacySettingShowStatus() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingShowStatus",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingShowStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingShowProfilePhoto.html).
  factory TdlibFunction.userPrivacySettingShowProfilePhoto() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingShowProfilePhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingShowProfilePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingShowLinkInForwardedMessages.html).
  factory TdlibFunction.userPrivacySettingShowLinkInForwardedMessages() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingShowLinkInForwardedMessages",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingShowLinkInForwardedMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingShowPhoneNumber.html).
  factory TdlibFunction.userPrivacySettingShowPhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingShowPhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingShowPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingAllowChatInvites.html).
  factory TdlibFunction.userPrivacySettingAllowChatInvites() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingAllowChatInvites",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingAllowChatInvites",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingAllowCalls.html).
  factory TdlibFunction.userPrivacySettingAllowCalls() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingAllowCalls",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingAllowCalls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingAllowPeerToPeerCalls.html).
  factory TdlibFunction.userPrivacySettingAllowPeerToPeerCalls() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingAllowPeerToPeerCalls",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingAllowPeerToPeerCalls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingAllowFindingByPhoneNumber.html).
  factory TdlibFunction.userPrivacySettingAllowFindingByPhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingAllowFindingByPhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingAllowFindingByPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages.html).
  factory TdlibFunction.userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages() {
    try {
      return TdlibFunction({
        "@type": "userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1accountTtl.html).
  factory TdlibFunction.accountTtl({
    int? days,
  }) {
    try {
      return TdlibFunction({
        "@type": "accountTtl",
        "days": days,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method accountTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeAndroid.html).
  factory TdlibFunction.sessionTypeAndroid() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeAndroid",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeAndroid",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeApple.html).
  factory TdlibFunction.sessionTypeApple() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeApple",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeApple",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeBrave.html).
  factory TdlibFunction.sessionTypeBrave() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeBrave",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeBrave",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeChrome.html).
  factory TdlibFunction.sessionTypeChrome() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeChrome",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeChrome",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeEdge.html).
  factory TdlibFunction.sessionTypeEdge() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeEdge",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeEdge",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeFirefox.html).
  factory TdlibFunction.sessionTypeFirefox() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeFirefox",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeFirefox",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeIpad.html).
  factory TdlibFunction.sessionTypeIpad() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeIpad",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeIpad",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeIphone.html).
  factory TdlibFunction.sessionTypeIphone() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeIphone",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeIphone",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeLinux.html).
  factory TdlibFunction.sessionTypeLinux() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeLinux",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeLinux",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeMac.html).
  factory TdlibFunction.sessionTypeMac() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeMac",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeMac",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeOpera.html).
  factory TdlibFunction.sessionTypeOpera() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeOpera",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeOpera",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeSafari.html).
  factory TdlibFunction.sessionTypeSafari() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeSafari",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeSafari",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeUbuntu.html).
  factory TdlibFunction.sessionTypeUbuntu() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeUbuntu",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeUbuntu",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeUnknown.html).
  factory TdlibFunction.sessionTypeUnknown() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeUnknown",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeUnknown",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeVivaldi.html).
  factory TdlibFunction.sessionTypeVivaldi() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeVivaldi",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeVivaldi",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeWindows.html).
  factory TdlibFunction.sessionTypeWindows() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeWindows",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeWindows",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessionTypeXbox.html).
  factory TdlibFunction.sessionTypeXbox() {
    try {
      return TdlibFunction({
        "@type": "sessionTypeXbox",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessionTypeXbox",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1session.html).
  factory TdlibFunction.session({
    int? id,
    bool? is_current,
    bool? is_password_pending,
    bool? can_accept_secret_chats,
    bool? can_accept_calls,
    TdlibFunction? type,
    int? api_id,
    String? application_name,
    String? application_version,
    bool? is_official_application,
    String? device_model,
    String? platform,
    String? system_version,
    int? log_in_date,
    int? last_active_date,
    String? ip,
    String? country,
    String? region,
  }) {
    try {
      return TdlibFunction({
        "@type": "session",
        "id": id,
        "is_current": is_current,
        "is_password_pending": is_password_pending,
        "can_accept_secret_chats": can_accept_secret_chats,
        "can_accept_calls": can_accept_calls,
        "type": type!.toJson(),
        "api_id": api_id,
        "application_name": application_name,
        "application_version": application_version,
        "is_official_application": is_official_application,
        "device_model": device_model,
        "platform": platform,
        "system_version": system_version,
        "log_in_date": log_in_date,
        "last_active_date": last_active_date,
        "ip": ip,
        "country": country,
        "region": region,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method session",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sessions.html).
  factory TdlibFunction.sessions({
    TdlibFunction? sessions,
    int? inactive_session_ttl_days,
  }) {
    try {
      return TdlibFunction({
        "@type": "sessions",
        "sessions": sessions!.toJson(),
        "inactive_session_ttl_days": inactive_session_ttl_days,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sessions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectedWebsite.html).
  factory TdlibFunction.connectedWebsite({
    int? id,
    String? domain_name,
    int? bot_user_id,
    String? browser,
    String? platform,
    int? log_in_date,
    int? last_active_date,
    String? ip,
    String? location,
  }) {
    try {
      return TdlibFunction({
        "@type": "connectedWebsite",
        "id": id,
        "domain_name": domain_name,
        "bot_user_id": bot_user_id,
        "browser": browser,
        "platform": platform,
        "log_in_date": log_in_date,
        "last_active_date": last_active_date,
        "ip": ip,
        "location": location,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectedWebsite",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectedWebsites.html).
  factory TdlibFunction.connectedWebsites({
    TdlibFunction? websites,
  }) {
    try {
      return TdlibFunction({
        "@type": "connectedWebsites",
        "websites": websites!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectedWebsites",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonSpam.html).
  factory TdlibFunction.chatReportReasonSpam() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonSpam",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonSpam",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonViolence.html).
  factory TdlibFunction.chatReportReasonViolence() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonViolence",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonViolence",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonPornography.html).
  factory TdlibFunction.chatReportReasonPornography() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonPornography",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonPornography",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonChildAbuse.html).
  factory TdlibFunction.chatReportReasonChildAbuse() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonChildAbuse",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonChildAbuse",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonCopyright.html).
  factory TdlibFunction.chatReportReasonCopyright() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonCopyright",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonCopyright",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonUnrelatedLocation.html).
  factory TdlibFunction.chatReportReasonUnrelatedLocation() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonUnrelatedLocation",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonUnrelatedLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonFake.html).
  factory TdlibFunction.chatReportReasonFake() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonFake",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonFake",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonIllegalDrugs.html).
  factory TdlibFunction.chatReportReasonIllegalDrugs() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonIllegalDrugs",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonIllegalDrugs",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonPersonalDetails.html).
  factory TdlibFunction.chatReportReasonPersonalDetails() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonPersonalDetails",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonPersonalDetails",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatReportReasonCustom.html).
  factory TdlibFunction.chatReportReasonCustom() {
    try {
      return TdlibFunction({
        "@type": "chatReportReasonCustom",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatReportReasonCustom",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1targetChatCurrent.html).
  factory TdlibFunction.targetChatCurrent() {
    try {
      return TdlibFunction({
        "@type": "targetChatCurrent",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method targetChatCurrent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1targetChatChosen.html).
  factory TdlibFunction.targetChatChosen({
    bool? allow_user_chats,
    bool? allow_bot_chats,
    bool? allow_group_chats,
    bool? allow_channel_chats,
  }) {
    try {
      return TdlibFunction({
        "@type": "targetChatChosen",
        "allow_user_chats": allow_user_chats,
        "allow_bot_chats": allow_bot_chats,
        "allow_group_chats": allow_group_chats,
        "allow_channel_chats": allow_channel_chats,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method targetChatChosen",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1targetChatInternalLink.html).
  factory TdlibFunction.targetChatInternalLink({
    TdlibFunction? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "targetChatInternalLink",
        "link": link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method targetChatInternalLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeActiveSessions.html).
  factory TdlibFunction.internalLinkTypeActiveSessions() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeActiveSessions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeActiveSessions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeAttachmentMenuBot.html).
  factory TdlibFunction.internalLinkTypeAttachmentMenuBot({
    TdlibFunction? target_chat,
    String? bot_username,
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeAttachmentMenuBot",
        "target_chat": target_chat!.toJson(),
        "bot_username": bot_username,
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeAttachmentMenuBot",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeAuthenticationCode.html).
  factory TdlibFunction.internalLinkTypeAuthenticationCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeAuthenticationCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeAuthenticationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeBackground.html).
  factory TdlibFunction.internalLinkTypeBackground({
    String? background_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeBackground",
        "background_name": background_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeBackground",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeBotStart.html).
  factory TdlibFunction.internalLinkTypeBotStart({
    String? bot_username,
    String? start_parameter,
    bool? autostart,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeBotStart",
        "bot_username": bot_username,
        "start_parameter": start_parameter,
        "autostart": autostart,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeBotStart",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeBotStartInGroup.html).
  factory TdlibFunction.internalLinkTypeBotStartInGroup({
    String? bot_username,
    String? start_parameter,
    TdlibFunction? administrator_rights,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeBotStartInGroup",
        "bot_username": bot_username,
        "start_parameter": start_parameter,
        "administrator_rights": administrator_rights!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeBotStartInGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeBotAddToChannel.html).
  factory TdlibFunction.internalLinkTypeBotAddToChannel({
    String? bot_username,
    TdlibFunction? administrator_rights,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeBotAddToChannel",
        "bot_username": bot_username,
        "administrator_rights": administrator_rights!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeBotAddToChannel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeChangePhoneNumber.html).
  factory TdlibFunction.internalLinkTypeChangePhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeChangePhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeChangePhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeChatInvite.html).
  factory TdlibFunction.internalLinkTypeChatInvite({
    String? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeChatInvite",
        "invite_link": invite_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeChatInvite",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeFilterSettings.html).
  factory TdlibFunction.internalLinkTypeFilterSettings() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeFilterSettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeFilterSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeGame.html).
  factory TdlibFunction.internalLinkTypeGame({
    String? bot_username,
    String? game_short_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeGame",
        "bot_username": bot_username,
        "game_short_name": game_short_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeGame",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeInstantView.html).
  factory TdlibFunction.internalLinkTypeInstantView({
    String? url,
    String? fallback_url,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeInstantView",
        "url": url,
        "fallback_url": fallback_url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeInstantView",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeInvoice.html).
  factory TdlibFunction.internalLinkTypeInvoice({
    String? invoice_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeInvoice",
        "invoice_name": invoice_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeInvoice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeLanguagePack.html).
  factory TdlibFunction.internalLinkTypeLanguagePack({
    String? language_pack_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeLanguagePack",
        "language_pack_id": language_pack_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeLanguagePack",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeLanguageSettings.html).
  factory TdlibFunction.internalLinkTypeLanguageSettings() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeLanguageSettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeLanguageSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeMessage.html).
  factory TdlibFunction.internalLinkTypeMessage({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeMessage",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeMessageDraft.html).
  factory TdlibFunction.internalLinkTypeMessageDraft({
    TdlibFunction? text,
    bool? contains_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeMessageDraft",
        "text": text!.toJson(),
        "contains_link": contains_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeMessageDraft",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypePassportDataRequest.html).
  factory TdlibFunction.internalLinkTypePassportDataRequest({
    int? bot_user_id,
    String? scope,
    String? public_key,
    String? nonce,
    String? callback_url,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypePassportDataRequest",
        "bot_user_id": bot_user_id,
        "scope": scope,
        "public_key": public_key,
        "nonce": nonce,
        "callback_url": callback_url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypePassportDataRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypePhoneNumberConfirmation.html).
  factory TdlibFunction.internalLinkTypePhoneNumberConfirmation({
    String? hash,
    String? phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypePhoneNumberConfirmation",
        "hash": hash,
        "phone_number": phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypePhoneNumberConfirmation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypePremiumFeatures.html).
  factory TdlibFunction.internalLinkTypePremiumFeatures({
    String? referrer,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypePremiumFeatures",
        "referrer": referrer,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypePremiumFeatures",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypePrivacyAndSecuritySettings.html).
  factory TdlibFunction.internalLinkTypePrivacyAndSecuritySettings() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypePrivacyAndSecuritySettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypePrivacyAndSecuritySettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeProxy.html).
  factory TdlibFunction.internalLinkTypeProxy({
    String? server,
    int? port,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeProxy",
        "server": server,
        "port": port,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypePublicChat.html).
  factory TdlibFunction.internalLinkTypePublicChat({
    String? chat_username,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypePublicChat",
        "chat_username": chat_username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypePublicChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeQrCodeAuthentication.html).
  factory TdlibFunction.internalLinkTypeQrCodeAuthentication() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeQrCodeAuthentication",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeQrCodeAuthentication",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeRestorePurchases.html).
  factory TdlibFunction.internalLinkTypeRestorePurchases() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeRestorePurchases",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeRestorePurchases",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeSettings.html).
  factory TdlibFunction.internalLinkTypeSettings() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeSettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeStickerSet.html).
  factory TdlibFunction.internalLinkTypeStickerSet({
    String? sticker_set_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeStickerSet",
        "sticker_set_name": sticker_set_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeTheme.html).
  factory TdlibFunction.internalLinkTypeTheme({
    String? theme_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeTheme",
        "theme_name": theme_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeTheme",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeThemeSettings.html).
  factory TdlibFunction.internalLinkTypeThemeSettings() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeThemeSettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeThemeSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeUnknownDeepLink.html).
  factory TdlibFunction.internalLinkTypeUnknownDeepLink({
    String? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeUnknownDeepLink",
        "link": link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeUnknownDeepLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeUnsupportedProxy.html).
  factory TdlibFunction.internalLinkTypeUnsupportedProxy() {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeUnsupportedProxy",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeUnsupportedProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeUserPhoneNumber.html).
  factory TdlibFunction.internalLinkTypeUserPhoneNumber({
    String? phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeUserPhoneNumber",
        "phone_number": phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeUserPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1internalLinkTypeVideoChat.html).
  factory TdlibFunction.internalLinkTypeVideoChat({
    String? chat_username,
    String? invite_hash,
    bool? is_live_stream,
  }) {
    try {
      return TdlibFunction({
        "@type": "internalLinkTypeVideoChat",
        "chat_username": chat_username,
        "invite_hash": invite_hash,
        "is_live_stream": is_live_stream,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method internalLinkTypeVideoChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageLink.html).
  factory TdlibFunction.messageLink({
    String? link,
    bool? is_public,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageLink",
        "link": link,
        "is_public": is_public,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageLinkInfo.html).
  factory TdlibFunction.messageLinkInfo({
    bool? is_public,
    int? chat_id,
    TdlibFunction? message,
    int? media_timestamp,
    bool? for_album,
    bool? for_comment,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageLinkInfo",
        "is_public": is_public,
        "chat_id": chat_id,
        "message": message!.toJson(),
        "media_timestamp": media_timestamp,
        "for_album": for_album,
        "for_comment": for_comment,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageLinkInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1filePart.html).
  factory TdlibFunction.filePart({
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "filePart",
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method filePart",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeNone.html).
  factory TdlibFunction.fileTypeNone() {
    try {
      return TdlibFunction({
        "@type": "fileTypeNone",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeNone",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeAnimation.html).
  factory TdlibFunction.fileTypeAnimation() {
    try {
      return TdlibFunction({
        "@type": "fileTypeAnimation",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeAudio.html).
  factory TdlibFunction.fileTypeAudio() {
    try {
      return TdlibFunction({
        "@type": "fileTypeAudio",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeAudio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeDocument.html).
  factory TdlibFunction.fileTypeDocument() {
    try {
      return TdlibFunction({
        "@type": "fileTypeDocument",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeDocument",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeNotificationSound.html).
  factory TdlibFunction.fileTypeNotificationSound() {
    try {
      return TdlibFunction({
        "@type": "fileTypeNotificationSound",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeNotificationSound",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypePhoto.html).
  factory TdlibFunction.fileTypePhoto() {
    try {
      return TdlibFunction({
        "@type": "fileTypePhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeProfilePhoto.html).
  factory TdlibFunction.fileTypeProfilePhoto() {
    try {
      return TdlibFunction({
        "@type": "fileTypeProfilePhoto",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeProfilePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeSecret.html).
  factory TdlibFunction.fileTypeSecret() {
    try {
      return TdlibFunction({
        "@type": "fileTypeSecret",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeSecret",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeSecretThumbnail.html).
  factory TdlibFunction.fileTypeSecretThumbnail() {
    try {
      return TdlibFunction({
        "@type": "fileTypeSecretThumbnail",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeSecretThumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeSecure.html).
  factory TdlibFunction.fileTypeSecure() {
    try {
      return TdlibFunction({
        "@type": "fileTypeSecure",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeSecure",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeSticker.html).
  factory TdlibFunction.fileTypeSticker() {
    try {
      return TdlibFunction({
        "@type": "fileTypeSticker",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeThumbnail.html).
  factory TdlibFunction.fileTypeThumbnail() {
    try {
      return TdlibFunction({
        "@type": "fileTypeThumbnail",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeThumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeUnknown.html).
  factory TdlibFunction.fileTypeUnknown() {
    try {
      return TdlibFunction({
        "@type": "fileTypeUnknown",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeUnknown",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeVideo.html).
  factory TdlibFunction.fileTypeVideo() {
    try {
      return TdlibFunction({
        "@type": "fileTypeVideo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeVideo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeVideoNote.html).
  factory TdlibFunction.fileTypeVideoNote() {
    try {
      return TdlibFunction({
        "@type": "fileTypeVideoNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeVideoNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeVoiceNote.html).
  factory TdlibFunction.fileTypeVoiceNote() {
    try {
      return TdlibFunction({
        "@type": "fileTypeVoiceNote",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeVoiceNote",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileTypeWallpaper.html).
  factory TdlibFunction.fileTypeWallpaper() {
    try {
      return TdlibFunction({
        "@type": "fileTypeWallpaper",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileTypeWallpaper",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1storageStatisticsByFileType.html).
  factory TdlibFunction.storageStatisticsByFileType({
    TdlibFunction? file_type,
    int? size,
    int? count,
  }) {
    try {
      return TdlibFunction({
        "@type": "storageStatisticsByFileType",
        "file_type": file_type!.toJson(),
        "size": size,
        "count": count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method storageStatisticsByFileType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1storageStatisticsByChat.html).
  factory TdlibFunction.storageStatisticsByChat({
    int? chat_id,
    int? size,
    int? count,
    TdlibFunction? by_file_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "storageStatisticsByChat",
        "chat_id": chat_id,
        "size": size,
        "count": count,
        "by_file_type": by_file_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method storageStatisticsByChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1storageStatistics.html).
  factory TdlibFunction.storageStatistics({
    int? size,
    int? count,
    TdlibFunction? by_chat,
  }) {
    try {
      return TdlibFunction({
        "@type": "storageStatistics",
        "size": size,
        "count": count,
        "by_chat": by_chat!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method storageStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1storageStatisticsFast.html).
  factory TdlibFunction.storageStatisticsFast({
    int? files_size,
    int? file_count,
    int? database_size,
    int? language_pack_database_size,
    int? log_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "storageStatisticsFast",
        "files_size": files_size,
        "file_count": file_count,
        "database_size": database_size,
        "language_pack_database_size": language_pack_database_size,
        "log_size": log_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method storageStatisticsFast",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1databaseStatistics.html).
  factory TdlibFunction.databaseStatistics({
    String? statistics,
  }) {
    try {
      return TdlibFunction({
        "@type": "databaseStatistics",
        "statistics": statistics,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method databaseStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkTypeNone.html).
  factory TdlibFunction.networkTypeNone() {
    try {
      return TdlibFunction({
        "@type": "networkTypeNone",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkTypeNone",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkTypeMobile.html).
  factory TdlibFunction.networkTypeMobile() {
    try {
      return TdlibFunction({
        "@type": "networkTypeMobile",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkTypeMobile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkTypeMobileRoaming.html).
  factory TdlibFunction.networkTypeMobileRoaming() {
    try {
      return TdlibFunction({
        "@type": "networkTypeMobileRoaming",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkTypeMobileRoaming",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkTypeWiFi.html).
  factory TdlibFunction.networkTypeWiFi() {
    try {
      return TdlibFunction({
        "@type": "networkTypeWiFi",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkTypeWiFi",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkTypeOther.html).
  factory TdlibFunction.networkTypeOther() {
    try {
      return TdlibFunction({
        "@type": "networkTypeOther",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkTypeOther",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkStatisticsEntryFile.html).
  factory TdlibFunction.networkStatisticsEntryFile({
    TdlibFunction? file_type,
    TdlibFunction? network_type,
    int? sent_bytes,
    int? received_bytes,
  }) {
    try {
      return TdlibFunction({
        "@type": "networkStatisticsEntryFile",
        "file_type": file_type!.toJson(),
        "network_type": network_type!.toJson(),
        "sent_bytes": sent_bytes,
        "received_bytes": received_bytes,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkStatisticsEntryFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkStatisticsEntryCall.html).
  factory TdlibFunction.networkStatisticsEntryCall({
    TdlibFunction? network_type,
    int? sent_bytes,
    int? received_bytes,
    double? duration,
  }) {
    try {
      return TdlibFunction({
        "@type": "networkStatisticsEntryCall",
        "network_type": network_type!.toJson(),
        "sent_bytes": sent_bytes,
        "received_bytes": received_bytes,
        "duration": duration,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkStatisticsEntryCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1networkStatistics.html).
  factory TdlibFunction.networkStatistics({
    int? since_date,
    TdlibFunction? entries,
  }) {
    try {
      return TdlibFunction({
        "@type": "networkStatistics",
        "since_date": since_date,
        "entries": entries!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method networkStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1autoDownloadSettings.html).
  factory TdlibFunction.autoDownloadSettings({
    bool? is_auto_download_enabled,
    int? max_photo_file_size,
    int? max_video_file_size,
    int? max_other_file_size,
    int? video_upload_bitrate,
    bool? preload_large_videos,
    bool? preload_next_audio,
    bool? use_less_data_for_calls,
  }) {
    try {
      return TdlibFunction({
        "@type": "autoDownloadSettings",
        "is_auto_download_enabled": is_auto_download_enabled,
        "max_photo_file_size": max_photo_file_size,
        "max_video_file_size": max_video_file_size,
        "max_other_file_size": max_other_file_size,
        "video_upload_bitrate": video_upload_bitrate,
        "preload_large_videos": preload_large_videos,
        "preload_next_audio": preload_next_audio,
        "use_less_data_for_calls": use_less_data_for_calls,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method autoDownloadSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1autoDownloadSettingsPresets.html).
  factory TdlibFunction.autoDownloadSettingsPresets({
    TdlibFunction? low,
    TdlibFunction? medium,
    TdlibFunction? high,
  }) {
    try {
      return TdlibFunction({
        "@type": "autoDownloadSettingsPresets",
        "low": low!.toJson(),
        "medium": medium!.toJson(),
        "high": high!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method autoDownloadSettingsPresets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectionStateWaitingForNetwork.html).
  factory TdlibFunction.connectionStateWaitingForNetwork() {
    try {
      return TdlibFunction({
        "@type": "connectionStateWaitingForNetwork",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectionStateWaitingForNetwork",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectionStateConnectingToProxy.html).
  factory TdlibFunction.connectionStateConnectingToProxy() {
    try {
      return TdlibFunction({
        "@type": "connectionStateConnectingToProxy",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectionStateConnectingToProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectionStateConnecting.html).
  factory TdlibFunction.connectionStateConnecting() {
    try {
      return TdlibFunction({
        "@type": "connectionStateConnecting",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectionStateConnecting",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectionStateUpdating.html).
  factory TdlibFunction.connectionStateUpdating() {
    try {
      return TdlibFunction({
        "@type": "connectionStateUpdating",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectionStateUpdating",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1connectionStateReady.html).
  factory TdlibFunction.connectionStateReady() {
    try {
      return TdlibFunction({
        "@type": "connectionStateReady",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method connectionStateReady",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryUsers.html).
  factory TdlibFunction.topChatCategoryUsers() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryUsers",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryUsers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryBots.html).
  factory TdlibFunction.topChatCategoryBots() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryBots",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryBots",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryGroups.html).
  factory TdlibFunction.topChatCategoryGroups() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryGroups",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryGroups",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryChannels.html).
  factory TdlibFunction.topChatCategoryChannels() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryChannels",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryChannels",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryInlineBots.html).
  factory TdlibFunction.topChatCategoryInlineBots() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryInlineBots",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryInlineBots",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryCalls.html).
  factory TdlibFunction.topChatCategoryCalls() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryCalls",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryCalls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1topChatCategoryForwardChats.html).
  factory TdlibFunction.topChatCategoryForwardChats() {
    try {
      return TdlibFunction({
        "@type": "topChatCategoryForwardChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method topChatCategoryForwardChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tMeUrlTypeUser.html).
  factory TdlibFunction.tMeUrlTypeUser({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "tMeUrlTypeUser",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method tMeUrlTypeUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tMeUrlTypeSupergroup.html).
  factory TdlibFunction.tMeUrlTypeSupergroup({
    int? supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "tMeUrlTypeSupergroup",
        "supergroup_id": supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method tMeUrlTypeSupergroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tMeUrlTypeChatInvite.html).
  factory TdlibFunction.tMeUrlTypeChatInvite({
    TdlibFunction? info,
  }) {
    try {
      return TdlibFunction({
        "@type": "tMeUrlTypeChatInvite",
        "info": info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method tMeUrlTypeChatInvite",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tMeUrlTypeStickerSet.html).
  factory TdlibFunction.tMeUrlTypeStickerSet({
    int? sticker_set_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "tMeUrlTypeStickerSet",
        "sticker_set_id": sticker_set_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method tMeUrlTypeStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tMeUrl.html).
  factory TdlibFunction.tMeUrl({
    String? url,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "tMeUrl",
        "url": url,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method tMeUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tMeUrls.html).
  factory TdlibFunction.tMeUrls({
    TdlibFunction? urls,
  }) {
    try {
      return TdlibFunction({
        "@type": "tMeUrls",
        "urls": urls!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method tMeUrls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1suggestedActionEnableArchiveAndMuteNewChats.html).
  factory TdlibFunction.suggestedActionEnableArchiveAndMuteNewChats() {
    try {
      return TdlibFunction({
        "@type": "suggestedActionEnableArchiveAndMuteNewChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method suggestedActionEnableArchiveAndMuteNewChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1suggestedActionCheckPassword.html).
  factory TdlibFunction.suggestedActionCheckPassword() {
    try {
      return TdlibFunction({
        "@type": "suggestedActionCheckPassword",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method suggestedActionCheckPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1suggestedActionCheckPhoneNumber.html).
  factory TdlibFunction.suggestedActionCheckPhoneNumber() {
    try {
      return TdlibFunction({
        "@type": "suggestedActionCheckPhoneNumber",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method suggestedActionCheckPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1suggestedActionViewChecksHint.html).
  factory TdlibFunction.suggestedActionViewChecksHint() {
    try {
      return TdlibFunction({
        "@type": "suggestedActionViewChecksHint",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method suggestedActionViewChecksHint",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1suggestedActionConvertToBroadcastGroup.html).
  factory TdlibFunction.suggestedActionConvertToBroadcastGroup({
    int? supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "suggestedActionConvertToBroadcastGroup",
        "supergroup_id": supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method suggestedActionConvertToBroadcastGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1suggestedActionSetPassword.html).
  factory TdlibFunction.suggestedActionSetPassword({
    int? authorization_delay,
  }) {
    try {
      return TdlibFunction({
        "@type": "suggestedActionSetPassword",
        "authorization_delay": authorization_delay,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method suggestedActionSetPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1count.html).
  factory TdlibFunction.count({
    int? count,
  }) {
    try {
      return TdlibFunction({
        "@type": "count",
        "count": count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method count",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1text.html).
  factory TdlibFunction.text({
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "text",
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method text",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1seconds.html).
  factory TdlibFunction.seconds({
    double? seconds,
  }) {
    try {
      return TdlibFunction({
        "@type": "seconds",
        "seconds": seconds,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method seconds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1fileDownloadedPrefixSize.html).
  factory TdlibFunction.fileDownloadedPrefixSize({
    int? size,
  }) {
    try {
      return TdlibFunction({
        "@type": "fileDownloadedPrefixSize",
        "size": size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method fileDownloadedPrefixSize",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deepLinkInfo.html).
  factory TdlibFunction.deepLinkInfo({
    TdlibFunction? text,
    bool? need_update_application,
  }) {
    try {
      return TdlibFunction({
        "@type": "deepLinkInfo",
        "text": text!.toJson(),
        "need_update_application": need_update_application,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deepLinkInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textParseModeMarkdown.html).
  factory TdlibFunction.textParseModeMarkdown({
    int? version,
  }) {
    try {
      return TdlibFunction({
        "@type": "textParseModeMarkdown",
        "version": version,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textParseModeMarkdown",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1textParseModeHTML.html).
  factory TdlibFunction.textParseModeHTML() {
    try {
      return TdlibFunction({
        "@type": "textParseModeHTML",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method textParseModeHTML",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1proxyTypeSocks5.html).
  factory TdlibFunction.proxyTypeSocks5({
    String? username,
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "proxyTypeSocks5",
        "username": username,
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method proxyTypeSocks5",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1proxyTypeHttp.html).
  factory TdlibFunction.proxyTypeHttp({
    String? username,
    String? password,
    bool? http_only,
  }) {
    try {
      return TdlibFunction({
        "@type": "proxyTypeHttp",
        "username": username,
        "password": password,
        "http_only": http_only,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method proxyTypeHttp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1proxyTypeMtproto.html).
  factory TdlibFunction.proxyTypeMtproto({
    String? secret,
  }) {
    try {
      return TdlibFunction({
        "@type": "proxyTypeMtproto",
        "secret": secret,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method proxyTypeMtproto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1proxy.html).
  factory TdlibFunction.proxy({
    int? id,
    String? server,
    int? port,
    int? last_used_date,
    bool? is_enabled,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "proxy",
        "id": id,
        "server": server,
        "port": port,
        "last_used_date": last_used_date,
        "is_enabled": is_enabled,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method proxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1proxies.html).
  factory TdlibFunction.proxies({
    TdlibFunction? proxies,
  }) {
    try {
      return TdlibFunction({
        "@type": "proxies",
        "proxies": proxies!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method proxies",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inputSticker.html).
  factory TdlibFunction.inputSticker({
    TdlibFunction? sticker,
    String? emojis,
    TdlibFunction? format,
    TdlibFunction? mask_position,
  }) {
    try {
      return TdlibFunction({
        "@type": "inputSticker",
        "sticker": sticker!.toJson(),
        "emojis": emojis,
        "format": format!.toJson(),
        "mask_position": mask_position!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inputSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1dateRange.html).
  factory TdlibFunction.dateRange({
    int? start_date,
    int? end_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "dateRange",
        "start_date": start_date,
        "end_date": end_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method dateRange",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1statisticalValue.html).
  factory TdlibFunction.statisticalValue({
    double? value,
    double? previous_value,
    double? growth_rate_percentage,
  }) {
    try {
      return TdlibFunction({
        "@type": "statisticalValue",
        "value": value,
        "previous_value": previous_value,
        "growth_rate_percentage": growth_rate_percentage,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method statisticalValue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1statisticalGraphData.html).
  factory TdlibFunction.statisticalGraphData({
    String? json_data,
    String? zoom_token,
  }) {
    try {
      return TdlibFunction({
        "@type": "statisticalGraphData",
        "json_data": json_data,
        "zoom_token": zoom_token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method statisticalGraphData",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1statisticalGraphAsync.html).
  factory TdlibFunction.statisticalGraphAsync({
    String? token,
  }) {
    try {
      return TdlibFunction({
        "@type": "statisticalGraphAsync",
        "token": token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method statisticalGraphAsync",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1statisticalGraphError.html).
  factory TdlibFunction.statisticalGraphError({
    String? error_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "statisticalGraphError",
        "error_message": error_message,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method statisticalGraphError",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatStatisticsMessageInteractionInfo.html).
  factory TdlibFunction.chatStatisticsMessageInteractionInfo({
    int? message_id,
    int? view_count,
    int? forward_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatStatisticsMessageInteractionInfo",
        "message_id": message_id,
        "view_count": view_count,
        "forward_count": forward_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatStatisticsMessageInteractionInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatStatisticsMessageSenderInfo.html).
  factory TdlibFunction.chatStatisticsMessageSenderInfo({
    int? user_id,
    int? sent_message_count,
    int? average_character_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatStatisticsMessageSenderInfo",
        "user_id": user_id,
        "sent_message_count": sent_message_count,
        "average_character_count": average_character_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatStatisticsMessageSenderInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatStatisticsAdministratorActionsInfo.html).
  factory TdlibFunction.chatStatisticsAdministratorActionsInfo({
    int? user_id,
    int? deleted_message_count,
    int? banned_user_count,
    int? restricted_user_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatStatisticsAdministratorActionsInfo",
        "user_id": user_id,
        "deleted_message_count": deleted_message_count,
        "banned_user_count": banned_user_count,
        "restricted_user_count": restricted_user_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatStatisticsAdministratorActionsInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatStatisticsInviterInfo.html).
  factory TdlibFunction.chatStatisticsInviterInfo({
    int? user_id,
    int? added_member_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatStatisticsInviterInfo",
        "user_id": user_id,
        "added_member_count": added_member_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatStatisticsInviterInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatStatisticsSupergroup.html).
  factory TdlibFunction.chatStatisticsSupergroup({
    TdlibFunction? period,
    TdlibFunction? member_count,
    TdlibFunction? message_count,
    TdlibFunction? viewer_count,
    TdlibFunction? sender_count,
    TdlibFunction? member_count_graph,
    TdlibFunction? join_graph,
    TdlibFunction? join_by_source_graph,
    TdlibFunction? language_graph,
    TdlibFunction? message_content_graph,
    TdlibFunction? action_graph,
    TdlibFunction? day_graph,
    TdlibFunction? week_graph,
    TdlibFunction? top_senders,
    TdlibFunction? top_administrators,
    TdlibFunction? top_inviters,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatStatisticsSupergroup",
        "period": period!.toJson(),
        "member_count": member_count!.toJson(),
        "message_count": message_count!.toJson(),
        "viewer_count": viewer_count!.toJson(),
        "sender_count": sender_count!.toJson(),
        "member_count_graph": member_count_graph!.toJson(),
        "join_graph": join_graph!.toJson(),
        "join_by_source_graph": join_by_source_graph!.toJson(),
        "language_graph": language_graph!.toJson(),
        "message_content_graph": message_content_graph!.toJson(),
        "action_graph": action_graph!.toJson(),
        "day_graph": day_graph!.toJson(),
        "week_graph": week_graph!.toJson(),
        "top_senders": top_senders!.toJson(),
        "top_administrators": top_administrators!.toJson(),
        "top_inviters": top_inviters!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatStatisticsSupergroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1chatStatisticsChannel.html).
  factory TdlibFunction.chatStatisticsChannel({
    TdlibFunction? period,
    TdlibFunction? member_count,
    TdlibFunction? mean_view_count,
    TdlibFunction? mean_share_count,
    double? enabled_notifications_percentage,
    TdlibFunction? member_count_graph,
    TdlibFunction? join_graph,
    TdlibFunction? mute_graph,
    TdlibFunction? view_count_by_hour_graph,
    TdlibFunction? view_count_by_source_graph,
    TdlibFunction? join_by_source_graph,
    TdlibFunction? language_graph,
    TdlibFunction? message_interaction_graph,
    TdlibFunction? instant_view_interaction_graph,
    TdlibFunction? recent_message_interactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "chatStatisticsChannel",
        "period": period!.toJson(),
        "member_count": member_count!.toJson(),
        "mean_view_count": mean_view_count!.toJson(),
        "mean_share_count": mean_share_count!.toJson(),
        "enabled_notifications_percentage": enabled_notifications_percentage,
        "member_count_graph": member_count_graph!.toJson(),
        "join_graph": join_graph!.toJson(),
        "mute_graph": mute_graph!.toJson(),
        "view_count_by_hour_graph": view_count_by_hour_graph!.toJson(),
        "view_count_by_source_graph": view_count_by_source_graph!.toJson(),
        "join_by_source_graph": join_by_source_graph!.toJson(),
        "language_graph": language_graph!.toJson(),
        "message_interaction_graph": message_interaction_graph!.toJson(),
        "instant_view_interaction_graph": instant_view_interaction_graph!.toJson(),
        "recent_message_interactions": recent_message_interactions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method chatStatisticsChannel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1messageStatistics.html).
  factory TdlibFunction.messageStatistics({
    TdlibFunction? message_interaction_graph,
  }) {
    try {
      return TdlibFunction({
        "@type": "messageStatistics",
        "message_interaction_graph": message_interaction_graph!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method messageStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1point.html).
  factory TdlibFunction.point({
    double? x,
    double? y,
  }) {
    try {
      return TdlibFunction({
        "@type": "point",
        "x": x,
        "y": y,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method point",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1vectorPathCommandLine.html).
  factory TdlibFunction.vectorPathCommandLine({
    TdlibFunction? end_point,
  }) {
    try {
      return TdlibFunction({
        "@type": "vectorPathCommandLine",
        "end_point": end_point!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method vectorPathCommandLine",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1vectorPathCommandCubicBezierCurve.html).
  factory TdlibFunction.vectorPathCommandCubicBezierCurve({
    TdlibFunction? start_control_point,
    TdlibFunction? end_control_point,
    TdlibFunction? end_point,
  }) {
    try {
      return TdlibFunction({
        "@type": "vectorPathCommandCubicBezierCurve",
        "start_control_point": start_control_point!.toJson(),
        "end_control_point": end_control_point!.toJson(),
        "end_point": end_point!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method vectorPathCommandCubicBezierCurve",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeDefault.html).
  factory TdlibFunction.botCommandScopeDefault() {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeDefault",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeDefault",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeAllPrivateChats.html).
  factory TdlibFunction.botCommandScopeAllPrivateChats() {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeAllPrivateChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeAllPrivateChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeAllGroupChats.html).
  factory TdlibFunction.botCommandScopeAllGroupChats() {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeAllGroupChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeAllGroupChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeAllChatAdministrators.html).
  factory TdlibFunction.botCommandScopeAllChatAdministrators() {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeAllChatAdministrators",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeAllChatAdministrators",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeChat.html).
  factory TdlibFunction.botCommandScopeChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeChatAdministrators.html).
  factory TdlibFunction.botCommandScopeChatAdministrators({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeChatAdministrators",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeChatAdministrators",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1botCommandScopeChatMember.html).
  factory TdlibFunction.botCommandScopeChatMember({
    int? chat_id,
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "botCommandScopeChatMember",
        "chat_id": chat_id,
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method botCommandScopeChatMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateAuthorizationState.html).
  factory TdlibFunction.updateAuthorizationState({
    TdlibFunction? authorization_state,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateAuthorizationState",
        "authorization_state": authorization_state!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateAuthorizationState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewMessage.html).
  factory TdlibFunction.updateNewMessage({
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewMessage",
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageSendAcknowledged.html).
  factory TdlibFunction.updateMessageSendAcknowledged({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageSendAcknowledged",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageSendAcknowledged",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageSendSucceeded.html).
  factory TdlibFunction.updateMessageSendSucceeded({
    TdlibFunction? message,
    int? old_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageSendSucceeded",
        "message": message!.toJson(),
        "old_message_id": old_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageSendSucceeded",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageSendFailed.html).
  factory TdlibFunction.updateMessageSendFailed({
    TdlibFunction? message,
    int? old_message_id,
    int? error_code,
    String? error_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageSendFailed",
        "message": message!.toJson(),
        "old_message_id": old_message_id,
        "error_code": error_code,
        "error_message": error_message,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageSendFailed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageContent.html).
  factory TdlibFunction.updateMessageContent({
    int? chat_id,
    int? message_id,
    TdlibFunction? new_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageContent",
        "chat_id": chat_id,
        "message_id": message_id,
        "new_content": new_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageContent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageEdited.html).
  factory TdlibFunction.updateMessageEdited({
    int? chat_id,
    int? message_id,
    int? edit_date,
    TdlibFunction? reply_markup,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageEdited",
        "chat_id": chat_id,
        "message_id": message_id,
        "edit_date": edit_date,
        "reply_markup": reply_markup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageEdited",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageIsPinned.html).
  factory TdlibFunction.updateMessageIsPinned({
    int? chat_id,
    int? message_id,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageIsPinned",
        "chat_id": chat_id,
        "message_id": message_id,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageIsPinned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageInteractionInfo.html).
  factory TdlibFunction.updateMessageInteractionInfo({
    int? chat_id,
    int? message_id,
    TdlibFunction? interaction_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageInteractionInfo",
        "chat_id": chat_id,
        "message_id": message_id,
        "interaction_info": interaction_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageInteractionInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageContentOpened.html).
  factory TdlibFunction.updateMessageContentOpened({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageContentOpened",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageContentOpened",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageMentionRead.html).
  factory TdlibFunction.updateMessageMentionRead({
    int? chat_id,
    int? message_id,
    int? unread_mention_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageMentionRead",
        "chat_id": chat_id,
        "message_id": message_id,
        "unread_mention_count": unread_mention_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageMentionRead",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageUnreadReactions.html).
  factory TdlibFunction.updateMessageUnreadReactions({
    int? chat_id,
    int? message_id,
    TdlibFunction? unread_reactions,
    int? unread_reaction_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageUnreadReactions",
        "chat_id": chat_id,
        "message_id": message_id,
        "unread_reactions": unread_reactions!.toJson(),
        "unread_reaction_count": unread_reaction_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageUnreadReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateMessageLiveLocationViewed.html).
  factory TdlibFunction.updateMessageLiveLocationViewed({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateMessageLiveLocationViewed",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateMessageLiveLocationViewed",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewChat.html).
  factory TdlibFunction.updateNewChat({
    TdlibFunction? chat,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewChat",
        "chat": chat!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatTitle.html).
  factory TdlibFunction.updateChatTitle({
    int? chat_id,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatTitle",
        "chat_id": chat_id,
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatTitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatPhoto.html).
  factory TdlibFunction.updateChatPhoto({
    int? chat_id,
    TdlibFunction? photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatPhoto",
        "chat_id": chat_id,
        "photo": photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatPermissions.html).
  factory TdlibFunction.updateChatPermissions({
    int? chat_id,
    TdlibFunction? permissions,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatPermissions",
        "chat_id": chat_id,
        "permissions": permissions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatPermissions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatLastMessage.html).
  factory TdlibFunction.updateChatLastMessage({
    int? chat_id,
    TdlibFunction? last_message,
    TdlibFunction? positions,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatLastMessage",
        "chat_id": chat_id,
        "last_message": last_message!.toJson(),
        "positions": positions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatLastMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatPosition.html).
  factory TdlibFunction.updateChatPosition({
    int? chat_id,
    TdlibFunction? position,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatPosition",
        "chat_id": chat_id,
        "position": position!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatPosition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatReadInbox.html).
  factory TdlibFunction.updateChatReadInbox({
    int? chat_id,
    int? last_read_inbox_message_id,
    int? unread_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatReadInbox",
        "chat_id": chat_id,
        "last_read_inbox_message_id": last_read_inbox_message_id,
        "unread_count": unread_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatReadInbox",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatReadOutbox.html).
  factory TdlibFunction.updateChatReadOutbox({
    int? chat_id,
    int? last_read_outbox_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatReadOutbox",
        "chat_id": chat_id,
        "last_read_outbox_message_id": last_read_outbox_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatReadOutbox",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatActionBar.html).
  factory TdlibFunction.updateChatActionBar({
    int? chat_id,
    TdlibFunction? action_bar,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatActionBar",
        "chat_id": chat_id,
        "action_bar": action_bar!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatActionBar",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatAvailableReactions.html).
  factory TdlibFunction.updateChatAvailableReactions({
    int? chat_id,
    TdlibFunction? available_reactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatAvailableReactions",
        "chat_id": chat_id,
        "available_reactions": available_reactions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatAvailableReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatDraftMessage.html).
  factory TdlibFunction.updateChatDraftMessage({
    int? chat_id,
    TdlibFunction? draft_message,
    TdlibFunction? positions,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatDraftMessage",
        "chat_id": chat_id,
        "draft_message": draft_message!.toJson(),
        "positions": positions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatDraftMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatMessageSender.html).
  factory TdlibFunction.updateChatMessageSender({
    int? chat_id,
    TdlibFunction? message_sender_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatMessageSender",
        "chat_id": chat_id,
        "message_sender_id": message_sender_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatMessageSender",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatMessageTtl.html).
  factory TdlibFunction.updateChatMessageTtl({
    int? chat_id,
    int? message_ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatMessageTtl",
        "chat_id": chat_id,
        "message_ttl": message_ttl,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatMessageTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatNotificationSettings.html).
  factory TdlibFunction.updateChatNotificationSettings({
    int? chat_id,
    TdlibFunction? notification_settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatNotificationSettings",
        "chat_id": chat_id,
        "notification_settings": notification_settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatPendingJoinRequests.html).
  factory TdlibFunction.updateChatPendingJoinRequests({
    int? chat_id,
    TdlibFunction? pending_join_requests,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatPendingJoinRequests",
        "chat_id": chat_id,
        "pending_join_requests": pending_join_requests!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatPendingJoinRequests",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatReplyMarkup.html).
  factory TdlibFunction.updateChatReplyMarkup({
    int? chat_id,
    int? reply_markup_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatReplyMarkup",
        "chat_id": chat_id,
        "reply_markup_message_id": reply_markup_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatReplyMarkup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatTheme.html).
  factory TdlibFunction.updateChatTheme({
    int? chat_id,
    String? theme_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatTheme",
        "chat_id": chat_id,
        "theme_name": theme_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatTheme",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatUnreadMentionCount.html).
  factory TdlibFunction.updateChatUnreadMentionCount({
    int? chat_id,
    int? unread_mention_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatUnreadMentionCount",
        "chat_id": chat_id,
        "unread_mention_count": unread_mention_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatUnreadMentionCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatUnreadReactionCount.html).
  factory TdlibFunction.updateChatUnreadReactionCount({
    int? chat_id,
    int? unread_reaction_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatUnreadReactionCount",
        "chat_id": chat_id,
        "unread_reaction_count": unread_reaction_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatUnreadReactionCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatVideoChat.html).
  factory TdlibFunction.updateChatVideoChat({
    int? chat_id,
    TdlibFunction? video_chat,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatVideoChat",
        "chat_id": chat_id,
        "video_chat": video_chat!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatVideoChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatDefaultDisableNotification.html).
  factory TdlibFunction.updateChatDefaultDisableNotification({
    int? chat_id,
    bool? default_disable_notification,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatDefaultDisableNotification",
        "chat_id": chat_id,
        "default_disable_notification": default_disable_notification,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatDefaultDisableNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatHasProtectedContent.html).
  factory TdlibFunction.updateChatHasProtectedContent({
    int? chat_id,
    bool? has_protected_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatHasProtectedContent",
        "chat_id": chat_id,
        "has_protected_content": has_protected_content,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatHasProtectedContent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatHasScheduledMessages.html).
  factory TdlibFunction.updateChatHasScheduledMessages({
    int? chat_id,
    bool? has_scheduled_messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatHasScheduledMessages",
        "chat_id": chat_id,
        "has_scheduled_messages": has_scheduled_messages,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatHasScheduledMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatIsBlocked.html).
  factory TdlibFunction.updateChatIsBlocked({
    int? chat_id,
    bool? is_blocked,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatIsBlocked",
        "chat_id": chat_id,
        "is_blocked": is_blocked,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatIsBlocked",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatIsMarkedAsUnread.html).
  factory TdlibFunction.updateChatIsMarkedAsUnread({
    int? chat_id,
    bool? is_marked_as_unread,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatIsMarkedAsUnread",
        "chat_id": chat_id,
        "is_marked_as_unread": is_marked_as_unread,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatIsMarkedAsUnread",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatFilters.html).
  factory TdlibFunction.updateChatFilters({
    TdlibFunction? chat_filters,
    int? main_chat_list_position,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatFilters",
        "chat_filters": chat_filters!.toJson(),
        "main_chat_list_position": main_chat_list_position,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatFilters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatOnlineMemberCount.html).
  factory TdlibFunction.updateChatOnlineMemberCount({
    int? chat_id,
    int? online_member_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatOnlineMemberCount",
        "chat_id": chat_id,
        "online_member_count": online_member_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatOnlineMemberCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateScopeNotificationSettings.html).
  factory TdlibFunction.updateScopeNotificationSettings({
    TdlibFunction? scope,
    TdlibFunction? notification_settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateScopeNotificationSettings",
        "scope": scope!.toJson(),
        "notification_settings": notification_settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateScopeNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNotification.html).
  factory TdlibFunction.updateNotification({
    int? notification_group_id,
    TdlibFunction? notification,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNotification",
        "notification_group_id": notification_group_id,
        "notification": notification!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNotificationGroup.html).
  factory TdlibFunction.updateNotificationGroup({
    int? notification_group_id,
    TdlibFunction? type,
    int? chat_id,
    int? notification_settings_chat_id,
    int? notification_sound_id,
    int? total_count,
    TdlibFunction? added_notifications,
    List<int>? removed_notification_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNotificationGroup",
        "notification_group_id": notification_group_id,
        "type": type!.toJson(),
        "chat_id": chat_id,
        "notification_settings_chat_id": notification_settings_chat_id,
        "notification_sound_id": notification_sound_id,
        "total_count": total_count,
        "added_notifications": added_notifications!.toJson(),
        "removed_notification_ids": removed_notification_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNotificationGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateActiveNotifications.html).
  factory TdlibFunction.updateActiveNotifications({
    TdlibFunction? groups,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateActiveNotifications",
        "groups": groups!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateActiveNotifications",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateHavePendingNotifications.html).
  factory TdlibFunction.updateHavePendingNotifications({
    bool? have_delayed_notifications,
    bool? have_unreceived_notifications,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateHavePendingNotifications",
        "have_delayed_notifications": have_delayed_notifications,
        "have_unreceived_notifications": have_unreceived_notifications,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateHavePendingNotifications",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateDeleteMessages.html).
  factory TdlibFunction.updateDeleteMessages({
    int? chat_id,
    List<int>? message_ids,
    bool? is_permanent,
    bool? from_cache,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateDeleteMessages",
        "chat_id": chat_id,
        "message_ids": message_ids,
        "is_permanent": is_permanent,
        "from_cache": from_cache,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateDeleteMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatAction.html).
  factory TdlibFunction.updateChatAction({
    int? chat_id,
    int? message_thread_id,
    TdlibFunction? sender_id,
    TdlibFunction? action,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatAction",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "sender_id": sender_id!.toJson(),
        "action": action!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatAction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUserStatus.html).
  factory TdlibFunction.updateUserStatus({
    int? user_id,
    TdlibFunction? status,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUserStatus",
        "user_id": user_id,
        "status": status!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUserStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUser.html).
  factory TdlibFunction.updateUser({
    TdlibFunction? user,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUser",
        "user": user!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateBasicGroup.html).
  factory TdlibFunction.updateBasicGroup({
    TdlibFunction? basic_group,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateBasicGroup",
        "basic_group": basic_group!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateBasicGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSupergroup.html).
  factory TdlibFunction.updateSupergroup({
    TdlibFunction? supergroup,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSupergroup",
        "supergroup": supergroup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSupergroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSecretChat.html).
  factory TdlibFunction.updateSecretChat({
    TdlibFunction? secret_chat,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSecretChat",
        "secret_chat": secret_chat!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUserFullInfo.html).
  factory TdlibFunction.updateUserFullInfo({
    int? user_id,
    TdlibFunction? user_full_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUserFullInfo",
        "user_id": user_id,
        "user_full_info": user_full_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUserFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateBasicGroupFullInfo.html).
  factory TdlibFunction.updateBasicGroupFullInfo({
    int? basic_group_id,
    TdlibFunction? basic_group_full_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateBasicGroupFullInfo",
        "basic_group_id": basic_group_id,
        "basic_group_full_info": basic_group_full_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateBasicGroupFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSupergroupFullInfo.html).
  factory TdlibFunction.updateSupergroupFullInfo({
    int? supergroup_id,
    TdlibFunction? supergroup_full_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSupergroupFullInfo",
        "supergroup_id": supergroup_id,
        "supergroup_full_info": supergroup_full_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSupergroupFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateServiceNotification.html).
  factory TdlibFunction.updateServiceNotification({
    String? type,
    TdlibFunction? content,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateServiceNotification",
        "type": type,
        "content": content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateServiceNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFile.html).
  factory TdlibFunction.updateFile({
    TdlibFunction? file,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFile",
        "file": file!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFileGenerationStart.html).
  factory TdlibFunction.updateFileGenerationStart({
    int? generation_id,
    String? original_path,
    String? destination_path,
    String? conversion,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFileGenerationStart",
        "generation_id": generation_id,
        "original_path": original_path,
        "destination_path": destination_path,
        "conversion": conversion,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFileGenerationStart",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFileGenerationStop.html).
  factory TdlibFunction.updateFileGenerationStop({
    int? generation_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFileGenerationStop",
        "generation_id": generation_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFileGenerationStop",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFileDownloads.html).
  factory TdlibFunction.updateFileDownloads({
    int? total_size,
    int? total_count,
    int? downloaded_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFileDownloads",
        "total_size": total_size,
        "total_count": total_count,
        "downloaded_size": downloaded_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFileDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFileAddedToDownloads.html).
  factory TdlibFunction.updateFileAddedToDownloads({
    TdlibFunction? file_download,
    TdlibFunction? counts,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFileAddedToDownloads",
        "file_download": file_download!.toJson(),
        "counts": counts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFileAddedToDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFileDownload.html).
  factory TdlibFunction.updateFileDownload({
    int? file_id,
    int? complete_date,
    bool? is_paused,
    TdlibFunction? counts,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFileDownload",
        "file_id": file_id,
        "complete_date": complete_date,
        "is_paused": is_paused,
        "counts": counts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFileDownload",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFileRemovedFromDownloads.html).
  factory TdlibFunction.updateFileRemovedFromDownloads({
    int? file_id,
    TdlibFunction? counts,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFileRemovedFromDownloads",
        "file_id": file_id,
        "counts": counts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFileRemovedFromDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateCall.html).
  factory TdlibFunction.updateCall({
    TdlibFunction? call,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateCall",
        "call": call!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateGroupCall.html).
  factory TdlibFunction.updateGroupCall({
    TdlibFunction? group_call,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateGroupCall",
        "group_call": group_call!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateGroupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateGroupCallParticipant.html).
  factory TdlibFunction.updateGroupCallParticipant({
    int? group_call_id,
    TdlibFunction? participant,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateGroupCallParticipant",
        "group_call_id": group_call_id,
        "participant": participant!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateGroupCallParticipant",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewCallSignalingData.html).
  factory TdlibFunction.updateNewCallSignalingData({
    int? call_id,
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewCallSignalingData",
        "call_id": call_id,
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewCallSignalingData",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUserPrivacySettingRules.html).
  factory TdlibFunction.updateUserPrivacySettingRules({
    TdlibFunction? setting,
    TdlibFunction? rules,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUserPrivacySettingRules",
        "setting": setting!.toJson(),
        "rules": rules!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUserPrivacySettingRules",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUnreadMessageCount.html).
  factory TdlibFunction.updateUnreadMessageCount({
    TdlibFunction? chat_list,
    int? unread_count,
    int? unread_unmuted_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUnreadMessageCount",
        "chat_list": chat_list!.toJson(),
        "unread_count": unread_count,
        "unread_unmuted_count": unread_unmuted_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUnreadMessageCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUnreadChatCount.html).
  factory TdlibFunction.updateUnreadChatCount({
    TdlibFunction? chat_list,
    int? total_count,
    int? unread_count,
    int? unread_unmuted_count,
    int? marked_as_unread_count,
    int? marked_as_unread_unmuted_count,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUnreadChatCount",
        "chat_list": chat_list!.toJson(),
        "total_count": total_count,
        "unread_count": unread_count,
        "unread_unmuted_count": unread_unmuted_count,
        "marked_as_unread_count": marked_as_unread_count,
        "marked_as_unread_unmuted_count": marked_as_unread_unmuted_count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUnreadChatCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateOption.html).
  factory TdlibFunction.updateOption({
    String? name,
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateOption",
        "name": name,
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateStickerSet.html).
  factory TdlibFunction.updateStickerSet({
    TdlibFunction? sticker_set,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateStickerSet",
        "sticker_set": sticker_set!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateInstalledStickerSets.html).
  factory TdlibFunction.updateInstalledStickerSets({
    TdlibFunction? sticker_type,
    List<int>? sticker_set_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateInstalledStickerSets",
        "sticker_type": sticker_type!.toJson(),
        "sticker_set_ids": sticker_set_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateInstalledStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateTrendingStickerSets.html).
  factory TdlibFunction.updateTrendingStickerSets({
    TdlibFunction? sticker_type,
    TdlibFunction? sticker_sets,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateTrendingStickerSets",
        "sticker_type": sticker_type!.toJson(),
        "sticker_sets": sticker_sets!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateTrendingStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateRecentStickers.html).
  factory TdlibFunction.updateRecentStickers({
    bool? is_attached,
    List<int>? sticker_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateRecentStickers",
        "is_attached": is_attached,
        "sticker_ids": sticker_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateRecentStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateFavoriteStickers.html).
  factory TdlibFunction.updateFavoriteStickers({
    List<int>? sticker_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateFavoriteStickers",
        "sticker_ids": sticker_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateFavoriteStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSavedAnimations.html).
  factory TdlibFunction.updateSavedAnimations({
    List<int>? animation_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSavedAnimations",
        "animation_ids": animation_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSavedAnimations",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSavedNotificationSounds.html).
  factory TdlibFunction.updateSavedNotificationSounds({
    List<int>? notification_sound_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSavedNotificationSounds",
        "notification_sound_ids": notification_sound_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSavedNotificationSounds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSelectedBackground.html).
  factory TdlibFunction.updateSelectedBackground({
    bool? for_dark_theme,
    TdlibFunction? background,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSelectedBackground",
        "for_dark_theme": for_dark_theme,
        "background": background!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSelectedBackground",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatThemes.html).
  factory TdlibFunction.updateChatThemes({
    TdlibFunction? chat_themes,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatThemes",
        "chat_themes": chat_themes!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatThemes",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateLanguagePackStrings.html).
  factory TdlibFunction.updateLanguagePackStrings({
    String? localization_target,
    String? language_pack_id,
    TdlibFunction? strings,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateLanguagePackStrings",
        "localization_target": localization_target,
        "language_pack_id": language_pack_id,
        "strings": strings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateLanguagePackStrings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateConnectionState.html).
  factory TdlibFunction.updateConnectionState({
    TdlibFunction? state,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateConnectionState",
        "state": state!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateConnectionState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateTermsOfService.html).
  factory TdlibFunction.updateTermsOfService({
    String? terms_of_service_id,
    TdlibFunction? terms_of_service,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateTermsOfService",
        "terms_of_service_id": terms_of_service_id,
        "terms_of_service": terms_of_service!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateTermsOfService",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateUsersNearby.html).
  factory TdlibFunction.updateUsersNearby({
    TdlibFunction? users_nearby,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateUsersNearby",
        "users_nearby": users_nearby!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateUsersNearby",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateAttachmentMenuBots.html).
  factory TdlibFunction.updateAttachmentMenuBots({
    TdlibFunction? bots,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateAttachmentMenuBots",
        "bots": bots!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateAttachmentMenuBots",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateWebAppMessageSent.html).
  factory TdlibFunction.updateWebAppMessageSent({
    int? web_app_launch_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateWebAppMessageSent",
        "web_app_launch_id": web_app_launch_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateWebAppMessageSent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateActiveEmojiReactions.html).
  factory TdlibFunction.updateActiveEmojiReactions({
    List<String>? emojis,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateActiveEmojiReactions",
        "emojis": emojis,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateActiveEmojiReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateDefaultReactionType.html).
  factory TdlibFunction.updateDefaultReactionType({
    TdlibFunction? reaction_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateDefaultReactionType",
        "reaction_type": reaction_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateDefaultReactionType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateDiceEmojis.html).
  factory TdlibFunction.updateDiceEmojis({
    List<String>? emojis,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateDiceEmojis",
        "emojis": emojis,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateDiceEmojis",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateAnimatedEmojiMessageClicked.html).
  factory TdlibFunction.updateAnimatedEmojiMessageClicked({
    int? chat_id,
    int? message_id,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateAnimatedEmojiMessageClicked",
        "chat_id": chat_id,
        "message_id": message_id,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateAnimatedEmojiMessageClicked",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateAnimationSearchParameters.html).
  factory TdlibFunction.updateAnimationSearchParameters({
    String? provider,
    List<String>? emojis,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateAnimationSearchParameters",
        "provider": provider,
        "emojis": emojis,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateAnimationSearchParameters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateSuggestedActions.html).
  factory TdlibFunction.updateSuggestedActions({
    TdlibFunction? added_actions,
    TdlibFunction? removed_actions,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateSuggestedActions",
        "added_actions": added_actions!.toJson(),
        "removed_actions": removed_actions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateSuggestedActions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewInlineQuery.html).
  factory TdlibFunction.updateNewInlineQuery({
    int? id,
    int? sender_user_id,
    TdlibFunction? user_location,
    TdlibFunction? chat_type,
    String? query,
    String? offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewInlineQuery",
        "id": id,
        "sender_user_id": sender_user_id,
        "user_location": user_location!.toJson(),
        "chat_type": chat_type!.toJson(),
        "query": query,
        "offset": offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewInlineQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewChosenInlineResult.html).
  factory TdlibFunction.updateNewChosenInlineResult({
    int? sender_user_id,
    TdlibFunction? user_location,
    String? query,
    String? result_id,
    String? inline_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewChosenInlineResult",
        "sender_user_id": sender_user_id,
        "user_location": user_location!.toJson(),
        "query": query,
        "result_id": result_id,
        "inline_message_id": inline_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewChosenInlineResult",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewCallbackQuery.html).
  factory TdlibFunction.updateNewCallbackQuery({
    int? id,
    int? sender_user_id,
    int? chat_id,
    int? message_id,
    int? chat_instance,
    TdlibFunction? payload,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewCallbackQuery",
        "id": id,
        "sender_user_id": sender_user_id,
        "chat_id": chat_id,
        "message_id": message_id,
        "chat_instance": chat_instance,
        "payload": payload!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewCallbackQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewInlineCallbackQuery.html).
  factory TdlibFunction.updateNewInlineCallbackQuery({
    int? id,
    int? sender_user_id,
    String? inline_message_id,
    int? chat_instance,
    TdlibFunction? payload,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewInlineCallbackQuery",
        "id": id,
        "sender_user_id": sender_user_id,
        "inline_message_id": inline_message_id,
        "chat_instance": chat_instance,
        "payload": payload!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewInlineCallbackQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewShippingQuery.html).
  factory TdlibFunction.updateNewShippingQuery({
    int? id,
    int? sender_user_id,
    String? invoice_payload,
    TdlibFunction? shipping_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewShippingQuery",
        "id": id,
        "sender_user_id": sender_user_id,
        "invoice_payload": invoice_payload,
        "shipping_address": shipping_address!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewShippingQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewPreCheckoutQuery.html).
  factory TdlibFunction.updateNewPreCheckoutQuery({
    int? id,
    int? sender_user_id,
    String? currency,
    int? total_amount,
    TdlibFunction? invoice_payload,
    String? shipping_option_id,
    TdlibFunction? order_info,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewPreCheckoutQuery",
        "id": id,
        "sender_user_id": sender_user_id,
        "currency": currency,
        "total_amount": total_amount,
        "invoice_payload": invoice_payload!.toJson(),
        "shipping_option_id": shipping_option_id,
        "order_info": order_info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewPreCheckoutQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewCustomEvent.html).
  factory TdlibFunction.updateNewCustomEvent({
    String? event,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewCustomEvent",
        "event": event,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewCustomEvent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewCustomQuery.html).
  factory TdlibFunction.updateNewCustomQuery({
    int? id,
    String? data,
    int? timeout,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewCustomQuery",
        "id": id,
        "data": data,
        "timeout": timeout,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewCustomQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updatePoll.html).
  factory TdlibFunction.updatePoll({
    TdlibFunction? poll,
  }) {
    try {
      return TdlibFunction({
        "@type": "updatePoll",
        "poll": poll!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updatePoll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updatePollAnswer.html).
  factory TdlibFunction.updatePollAnswer({
    int? poll_id,
    int? user_id,
    List<int>? option_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "updatePollAnswer",
        "poll_id": poll_id,
        "user_id": user_id,
        "option_ids": option_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updatePollAnswer",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateChatMember.html).
  factory TdlibFunction.updateChatMember({
    int? chat_id,
    int? actor_user_id,
    int? date,
    TdlibFunction? invite_link,
    TdlibFunction? old_chat_member,
    TdlibFunction? new_chat_member,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateChatMember",
        "chat_id": chat_id,
        "actor_user_id": actor_user_id,
        "date": date,
        "invite_link": invite_link!.toJson(),
        "old_chat_member": old_chat_member!.toJson(),
        "new_chat_member": new_chat_member!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateChatMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updateNewChatJoinRequest.html).
  factory TdlibFunction.updateNewChatJoinRequest({
    int? chat_id,
    TdlibFunction? request,
    TdlibFunction? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "updateNewChatJoinRequest",
        "chat_id": chat_id,
        "request": request!.toJson(),
        "invite_link": invite_link!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updateNewChatJoinRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1updates.html).
  factory TdlibFunction.updates({
    TdlibFunction? updates,
  }) {
    try {
      return TdlibFunction({
        "@type": "updates",
        "updates": updates!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method updates",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1logStreamDefault.html).
  factory TdlibFunction.logStreamDefault() {
    try {
      return TdlibFunction({
        "@type": "logStreamDefault",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method logStreamDefault",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1logStreamFile.html).
  factory TdlibFunction.logStreamFile({
    String? path,
    int? max_file_size,
    bool? redirect_stderr,
  }) {
    try {
      return TdlibFunction({
        "@type": "logStreamFile",
        "path": path,
        "max_file_size": max_file_size,
        "redirect_stderr": redirect_stderr,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method logStreamFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1logStreamEmpty.html).
  factory TdlibFunction.logStreamEmpty() {
    try {
      return TdlibFunction({
        "@type": "logStreamEmpty",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method logStreamEmpty",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1logVerbosityLevel.html).
  factory TdlibFunction.logVerbosityLevel({
    int? verbosity_level,
  }) {
    try {
      return TdlibFunction({
        "@type": "logVerbosityLevel",
        "verbosity_level": verbosity_level,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method logVerbosityLevel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1logTags.html).
  factory TdlibFunction.logTags({
    List<String>? tags,
  }) {
    try {
      return TdlibFunction({
        "@type": "logTags",
        "tags": tags,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method logTags",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1userSupportInfo.html).
  factory TdlibFunction.userSupportInfo({
    TdlibFunction? message,
    String? author,
    int? date,
  }) {
    try {
      return TdlibFunction({
        "@type": "userSupportInfo",
        "message": message!.toJson(),
        "author": author,
        "date": date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method userSupportInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testInt.html).
  factory TdlibFunction.testInt({
    int? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testInt",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testInt",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testString.html).
  factory TdlibFunction.testString({
    String? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testString",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testBytes.html).
  factory TdlibFunction.testBytes({
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testBytes",
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testBytes",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testVectorInt.html).
  factory TdlibFunction.testVectorInt({
    List<int>? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testVectorInt",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testVectorInt",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testVectorIntObject.html).
  factory TdlibFunction.testVectorIntObject({
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testVectorIntObject",
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testVectorIntObject",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testVectorString.html).
  factory TdlibFunction.testVectorString({
    List<String>? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testVectorString",
        "value": value,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testVectorString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testVectorStringObject.html).
  factory TdlibFunction.testVectorStringObject({
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "testVectorStringObject",
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testVectorStringObject",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAuthorizationState.html).
  factory TdlibFunction.getAuthorizationState() {
    try {
      return TdlibFunction({
        "@type": "getAuthorizationState",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAuthorizationState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setTdlibParameters.html).
  factory TdlibFunction.setTdlibParameters({
    bool? use_test_dc,
    String? database_directory,
    String? files_directory,
    TdlibFunction? database_encryption_key,
    bool? use_file_database,
    bool? use_chat_info_database,
    bool? use_message_database,
    bool? use_secret_chats,
    int? api_id,
    String? api_hash,
    String? system_language_code,
    String? device_model,
    String? system_version,
    String? application_version,
    bool? enable_storage_optimizer,
    bool? ignore_file_names,
  }) {
    try {
      return TdlibFunction({
        "@type": "setTdlibParameters",
        "use_test_dc": use_test_dc,
        "database_directory": database_directory,
        "files_directory": files_directory,
        "database_encryption_key": database_encryption_key!.toJson(),
        "use_file_database": use_file_database,
        "use_chat_info_database": use_chat_info_database,
        "use_message_database": use_message_database,
        "use_secret_chats": use_secret_chats,
        "api_id": api_id,
        "api_hash": api_hash,
        "system_language_code": system_language_code,
        "device_model": device_model,
        "system_version": system_version,
        "application_version": application_version,
        "enable_storage_optimizer": enable_storage_optimizer,
        "ignore_file_names": ignore_file_names,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setTdlibParameters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setAuthenticationPhoneNumber.html).
  factory TdlibFunction.setAuthenticationPhoneNumber({
    String? phone_number,
    TdlibFunction? settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "setAuthenticationPhoneNumber",
        "phone_number": phone_number,
        "settings": settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setAuthenticationPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setAuthenticationEmailAddress.html).
  factory TdlibFunction.setAuthenticationEmailAddress({
    String? email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "setAuthenticationEmailAddress",
        "email_address": email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setAuthenticationEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendAuthenticationCode.html).
  factory TdlibFunction.resendAuthenticationCode() {
    try {
      return TdlibFunction({
        "@type": "resendAuthenticationCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendAuthenticationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkAuthenticationEmailCode.html).
  factory TdlibFunction.checkAuthenticationEmailCode({
    TdlibFunction? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkAuthenticationEmailCode",
        "code": code!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkAuthenticationEmailCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkAuthenticationCode.html).
  factory TdlibFunction.checkAuthenticationCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkAuthenticationCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkAuthenticationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1requestQrCodeAuthentication.html).
  factory TdlibFunction.requestQrCodeAuthentication({
    List<int>? other_user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "requestQrCodeAuthentication",
        "other_user_ids": other_user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method requestQrCodeAuthentication",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1registerUser.html).
  factory TdlibFunction.registerUser({
    String? first_name,
    String? last_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "registerUser",
        "first_name": first_name,
        "last_name": last_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method registerUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkAuthenticationPassword.html).
  factory TdlibFunction.checkAuthenticationPassword({
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkAuthenticationPassword",
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkAuthenticationPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1requestAuthenticationPasswordRecovery.html).
  factory TdlibFunction.requestAuthenticationPasswordRecovery() {
    try {
      return TdlibFunction({
        "@type": "requestAuthenticationPasswordRecovery",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method requestAuthenticationPasswordRecovery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkAuthenticationPasswordRecoveryCode.html).
  factory TdlibFunction.checkAuthenticationPasswordRecoveryCode({
    String? recovery_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkAuthenticationPasswordRecoveryCode",
        "recovery_code": recovery_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkAuthenticationPasswordRecoveryCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1recoverAuthenticationPassword.html).
  factory TdlibFunction.recoverAuthenticationPassword({
    String? recovery_code,
    String? new_password,
    String? new_hint,
  }) {
    try {
      return TdlibFunction({
        "@type": "recoverAuthenticationPassword",
        "recovery_code": recovery_code,
        "new_password": new_password,
        "new_hint": new_hint,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method recoverAuthenticationPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkAuthenticationBotToken.html).
  factory TdlibFunction.checkAuthenticationBotToken({
    String? token,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkAuthenticationBotToken",
        "token": token,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkAuthenticationBotToken",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1logOut.html).
  factory TdlibFunction.logOut() {
    try {
      return TdlibFunction({
        "@type": "logOut",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method logOut",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1close.html).
  factory TdlibFunction.close() {
    try {
      return TdlibFunction({
        "@type": "close",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method close",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1destroy.html).
  factory TdlibFunction.destroy() {
    try {
      return TdlibFunction({
        "@type": "destroy",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method destroy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1confirmQrCodeAuthentication.html).
  factory TdlibFunction.confirmQrCodeAuthentication({
    String? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "confirmQrCodeAuthentication",
        "link": link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method confirmQrCodeAuthentication",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCurrentState.html).
  factory TdlibFunction.getCurrentState() {
    try {
      return TdlibFunction({
        "@type": "getCurrentState",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCurrentState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setDatabaseEncryptionKey.html).
  factory TdlibFunction.setDatabaseEncryptionKey({
    TdlibFunction? new_encryption_key,
  }) {
    try {
      return TdlibFunction({
        "@type": "setDatabaseEncryptionKey",
        "new_encryption_key": new_encryption_key!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setDatabaseEncryptionKey",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPasswordState.html).
  factory TdlibFunction.getPasswordState() {
    try {
      return TdlibFunction({
        "@type": "getPasswordState",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPasswordState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setPassword.html).
  factory TdlibFunction.setPassword({
    String? old_password,
    String? new_password,
    String? new_hint,
    bool? set_recovery_email_address,
    String? new_recovery_email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "setPassword",
        "old_password": old_password,
        "new_password": new_password,
        "new_hint": new_hint,
        "set_recovery_email_address": set_recovery_email_address,
        "new_recovery_email_address": new_recovery_email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setLoginEmailAddress.html).
  factory TdlibFunction.setLoginEmailAddress({
    String? new_login_email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "setLoginEmailAddress",
        "new_login_email_address": new_login_email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setLoginEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendLoginEmailAddressCode.html).
  factory TdlibFunction.resendLoginEmailAddressCode() {
    try {
      return TdlibFunction({
        "@type": "resendLoginEmailAddressCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendLoginEmailAddressCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkLoginEmailAddressCode.html).
  factory TdlibFunction.checkLoginEmailAddressCode({
    TdlibFunction? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkLoginEmailAddressCode",
        "code": code!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkLoginEmailAddressCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecoveryEmailAddress.html).
  factory TdlibFunction.getRecoveryEmailAddress({
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "getRecoveryEmailAddress",
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecoveryEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setRecoveryEmailAddress.html).
  factory TdlibFunction.setRecoveryEmailAddress({
    String? password,
    String? new_recovery_email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "setRecoveryEmailAddress",
        "password": password,
        "new_recovery_email_address": new_recovery_email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setRecoveryEmailAddress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkRecoveryEmailAddressCode.html).
  factory TdlibFunction.checkRecoveryEmailAddressCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkRecoveryEmailAddressCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkRecoveryEmailAddressCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendRecoveryEmailAddressCode.html).
  factory TdlibFunction.resendRecoveryEmailAddressCode() {
    try {
      return TdlibFunction({
        "@type": "resendRecoveryEmailAddressCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendRecoveryEmailAddressCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1requestPasswordRecovery.html).
  factory TdlibFunction.requestPasswordRecovery() {
    try {
      return TdlibFunction({
        "@type": "requestPasswordRecovery",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method requestPasswordRecovery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkPasswordRecoveryCode.html).
  factory TdlibFunction.checkPasswordRecoveryCode({
    String? recovery_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkPasswordRecoveryCode",
        "recovery_code": recovery_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkPasswordRecoveryCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1recoverPassword.html).
  factory TdlibFunction.recoverPassword({
    String? recovery_code,
    String? new_password,
    String? new_hint,
  }) {
    try {
      return TdlibFunction({
        "@type": "recoverPassword",
        "recovery_code": recovery_code,
        "new_password": new_password,
        "new_hint": new_hint,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method recoverPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetPassword.html).
  factory TdlibFunction.resetPassword() {
    try {
      return TdlibFunction({
        "@type": "resetPassword",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1cancelPasswordReset.html).
  factory TdlibFunction.cancelPasswordReset() {
    try {
      return TdlibFunction({
        "@type": "cancelPasswordReset",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method cancelPasswordReset",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createTemporaryPassword.html).
  factory TdlibFunction.createTemporaryPassword({
    String? password,
    int? valid_for,
  }) {
    try {
      return TdlibFunction({
        "@type": "createTemporaryPassword",
        "password": password,
        "valid_for": valid_for,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createTemporaryPassword",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getTemporaryPasswordState.html).
  factory TdlibFunction.getTemporaryPasswordState() {
    try {
      return TdlibFunction({
        "@type": "getTemporaryPasswordState",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getTemporaryPasswordState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMe.html).
  factory TdlibFunction.getMe() {
    try {
      return TdlibFunction({
        "@type": "getMe",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMe",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getUser.html).
  factory TdlibFunction.getUser({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getUser",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getUserFullInfo.html).
  factory TdlibFunction.getUserFullInfo({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getUserFullInfo",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getUserFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getBasicGroup.html).
  factory TdlibFunction.getBasicGroup({
    int? basic_group_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getBasicGroup",
        "basic_group_id": basic_group_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getBasicGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getBasicGroupFullInfo.html).
  factory TdlibFunction.getBasicGroupFullInfo({
    int? basic_group_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getBasicGroupFullInfo",
        "basic_group_id": basic_group_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getBasicGroupFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSupergroup.html).
  factory TdlibFunction.getSupergroup({
    int? supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSupergroup",
        "supergroup_id": supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSupergroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSupergroupFullInfo.html).
  factory TdlibFunction.getSupergroupFullInfo({
    int? supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSupergroupFullInfo",
        "supergroup_id": supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSupergroupFullInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSecretChat.html).
  factory TdlibFunction.getSecretChat({
    int? secret_chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSecretChat",
        "secret_chat_id": secret_chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChat.html).
  factory TdlibFunction.getChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessage.html).
  factory TdlibFunction.getMessage({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessage",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageLocally.html).
  factory TdlibFunction.getMessageLocally({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageLocally",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageLocally",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRepliedMessage.html).
  factory TdlibFunction.getRepliedMessage({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getRepliedMessage",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRepliedMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatPinnedMessage.html).
  factory TdlibFunction.getChatPinnedMessage({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatPinnedMessage",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatPinnedMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCallbackQueryMessage.html).
  factory TdlibFunction.getCallbackQueryMessage({
    int? chat_id,
    int? message_id,
    int? callback_query_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getCallbackQueryMessage",
        "chat_id": chat_id,
        "message_id": message_id,
        "callback_query_id": callback_query_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCallbackQueryMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessages.html).
  factory TdlibFunction.getMessages({
    int? chat_id,
    List<int>? message_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessages",
        "chat_id": chat_id,
        "message_ids": message_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageThread.html).
  factory TdlibFunction.getMessageThread({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageThread",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageThread",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageViewers.html).
  factory TdlibFunction.getMessageViewers({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageViewers",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageViewers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getFile.html).
  factory TdlibFunction.getFile({
    int? file_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getFile",
        "file_id": file_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRemoteFile.html).
  factory TdlibFunction.getRemoteFile({
    String? remote_file_id,
    TdlibFunction? file_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "getRemoteFile",
        "remote_file_id": remote_file_id,
        "file_type": file_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRemoteFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1loadChats.html).
  factory TdlibFunction.loadChats({
    TdlibFunction? chat_list,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "loadChats",
        "chat_list": chat_list!.toJson(),
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method loadChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChats.html).
  factory TdlibFunction.getChats({
    TdlibFunction? chat_list,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChats",
        "chat_list": chat_list!.toJson(),
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchPublicChat.html).
  factory TdlibFunction.searchPublicChat({
    String? username,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchPublicChat",
        "username": username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchPublicChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchPublicChats.html).
  factory TdlibFunction.searchPublicChats({
    String? query,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchPublicChats",
        "query": query,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchPublicChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchChats.html).
  factory TdlibFunction.searchChats({
    String? query,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchChats",
        "query": query,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchChatsOnServer.html).
  factory TdlibFunction.searchChatsOnServer({
    String? query,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchChatsOnServer",
        "query": query,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchChatsOnServer",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchChatsNearby.html).
  factory TdlibFunction.searchChatsNearby({
    TdlibFunction? location,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchChatsNearby",
        "location": location!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchChatsNearby",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getTopChats.html).
  factory TdlibFunction.getTopChats({
    TdlibFunction? category,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getTopChats",
        "category": category!.toJson(),
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getTopChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeTopChat.html).
  factory TdlibFunction.removeTopChat({
    TdlibFunction? category,
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeTopChat",
        "category": category!.toJson(),
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeTopChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addRecentlyFoundChat.html).
  factory TdlibFunction.addRecentlyFoundChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "addRecentlyFoundChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addRecentlyFoundChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeRecentlyFoundChat.html).
  factory TdlibFunction.removeRecentlyFoundChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeRecentlyFoundChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeRecentlyFoundChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clearRecentlyFoundChats.html).
  factory TdlibFunction.clearRecentlyFoundChats() {
    try {
      return TdlibFunction({
        "@type": "clearRecentlyFoundChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clearRecentlyFoundChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecentlyOpenedChats.html).
  factory TdlibFunction.getRecentlyOpenedChats({
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getRecentlyOpenedChats",
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecentlyOpenedChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatUsername.html).
  factory TdlibFunction.checkChatUsername({
    int? chat_id,
    String? username,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkChatUsername",
        "chat_id": chat_id,
        "username": username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatUsername",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCreatedPublicChats.html).
  factory TdlibFunction.getCreatedPublicChats({
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "getCreatedPublicChats",
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCreatedPublicChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkCreatedPublicChatsLimit.html).
  factory TdlibFunction.checkCreatedPublicChatsLimit({
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkCreatedPublicChatsLimit",
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkCreatedPublicChatsLimit",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSuitableDiscussionChats.html).
  factory TdlibFunction.getSuitableDiscussionChats() {
    try {
      return TdlibFunction({
        "@type": "getSuitableDiscussionChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSuitableDiscussionChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getInactiveSupergroupChats.html).
  factory TdlibFunction.getInactiveSupergroupChats() {
    try {
      return TdlibFunction({
        "@type": "getInactiveSupergroupChats",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getInactiveSupergroupChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getGroupsInCommon.html).
  factory TdlibFunction.getGroupsInCommon({
    int? user_id,
    int? offset_chat_id,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getGroupsInCommon",
        "user_id": user_id,
        "offset_chat_id": offset_chat_id,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getGroupsInCommon",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatHistory.html).
  factory TdlibFunction.getChatHistory({
    int? chat_id,
    int? from_message_id,
    int? offset,
    int? limit,
    bool? only_local,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatHistory",
        "chat_id": chat_id,
        "from_message_id": from_message_id,
        "offset": offset,
        "limit": limit,
        "only_local": only_local,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatHistory",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageThreadHistory.html).
  factory TdlibFunction.getMessageThreadHistory({
    int? chat_id,
    int? message_id,
    int? from_message_id,
    int? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageThreadHistory",
        "chat_id": chat_id,
        "message_id": message_id,
        "from_message_id": from_message_id,
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageThreadHistory",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteChatHistory.html).
  factory TdlibFunction.deleteChatHistory({
    int? chat_id,
    bool? remove_from_chat_list,
    bool? revoke,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteChatHistory",
        "chat_id": chat_id,
        "remove_from_chat_list": remove_from_chat_list,
        "revoke": revoke,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteChatHistory",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteChat.html).
  factory TdlibFunction.deleteChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchChatMessages.html).
  factory TdlibFunction.searchChatMessages({
    int? chat_id,
    String? query,
    TdlibFunction? sender_id,
    int? from_message_id,
    int? offset,
    int? limit,
    TdlibFunction? filter,
    int? message_thread_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchChatMessages",
        "chat_id": chat_id,
        "query": query,
        "sender_id": sender_id!.toJson(),
        "from_message_id": from_message_id,
        "offset": offset,
        "limit": limit,
        "filter": filter!.toJson(),
        "message_thread_id": message_thread_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchChatMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchMessages.html).
  factory TdlibFunction.searchMessages({
    TdlibFunction? chat_list,
    String? query,
    int? offset_date,
    int? offset_chat_id,
    int? offset_message_id,
    int? limit,
    TdlibFunction? filter,
    int? min_date,
    int? max_date,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchMessages",
        "chat_list": chat_list!.toJson(),
        "query": query,
        "offset_date": offset_date,
        "offset_chat_id": offset_chat_id,
        "offset_message_id": offset_message_id,
        "limit": limit,
        "filter": filter!.toJson(),
        "min_date": min_date,
        "max_date": max_date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchSecretMessages.html).
  factory TdlibFunction.searchSecretMessages({
    int? chat_id,
    String? query,
    String? offset,
    int? limit,
    TdlibFunction? filter,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchSecretMessages",
        "chat_id": chat_id,
        "query": query,
        "offset": offset,
        "limit": limit,
        "filter": filter!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchSecretMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchCallMessages.html).
  factory TdlibFunction.searchCallMessages({
    int? from_message_id,
    int? limit,
    bool? only_missed,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchCallMessages",
        "from_message_id": from_message_id,
        "limit": limit,
        "only_missed": only_missed,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchCallMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchOutgoingDocumentMessages.html).
  factory TdlibFunction.searchOutgoingDocumentMessages({
    String? query,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchOutgoingDocumentMessages",
        "query": query,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchOutgoingDocumentMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteAllCallMessages.html).
  factory TdlibFunction.deleteAllCallMessages({
    bool? revoke,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteAllCallMessages",
        "revoke": revoke,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteAllCallMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchChatRecentLocationMessages.html).
  factory TdlibFunction.searchChatRecentLocationMessages({
    int? chat_id,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchChatRecentLocationMessages",
        "chat_id": chat_id,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchChatRecentLocationMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getActiveLiveLocationMessages.html).
  factory TdlibFunction.getActiveLiveLocationMessages() {
    try {
      return TdlibFunction({
        "@type": "getActiveLiveLocationMessages",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getActiveLiveLocationMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatMessageByDate.html).
  factory TdlibFunction.getChatMessageByDate({
    int? chat_id,
    int? date,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatMessageByDate",
        "chat_id": chat_id,
        "date": date,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatMessageByDate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatSparseMessagePositions.html).
  factory TdlibFunction.getChatSparseMessagePositions({
    int? chat_id,
    TdlibFunction? filter,
    int? from_message_id,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatSparseMessagePositions",
        "chat_id": chat_id,
        "filter": filter!.toJson(),
        "from_message_id": from_message_id,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatSparseMessagePositions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatMessageCalendar.html).
  factory TdlibFunction.getChatMessageCalendar({
    int? chat_id,
    TdlibFunction? filter,
    int? from_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatMessageCalendar",
        "chat_id": chat_id,
        "filter": filter!.toJson(),
        "from_message_id": from_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatMessageCalendar",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatMessageCount.html).
  factory TdlibFunction.getChatMessageCount({
    int? chat_id,
    TdlibFunction? filter,
    bool? return_local,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatMessageCount",
        "chat_id": chat_id,
        "filter": filter!.toJson(),
        "return_local": return_local,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatMessageCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatMessagePosition.html).
  factory TdlibFunction.getChatMessagePosition({
    int? chat_id,
    int? message_id,
    TdlibFunction? filter,
    int? message_thread_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatMessagePosition",
        "chat_id": chat_id,
        "message_id": message_id,
        "filter": filter!.toJson(),
        "message_thread_id": message_thread_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatMessagePosition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatScheduledMessages.html).
  factory TdlibFunction.getChatScheduledMessages({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatScheduledMessages",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatScheduledMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessagePublicForwards.html).
  factory TdlibFunction.getMessagePublicForwards({
    int? chat_id,
    int? message_id,
    String? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessagePublicForwards",
        "chat_id": chat_id,
        "message_id": message_id,
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessagePublicForwards",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatSponsoredMessage.html).
  factory TdlibFunction.getChatSponsoredMessage({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatSponsoredMessage",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatSponsoredMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeNotification.html).
  factory TdlibFunction.removeNotification({
    int? notification_group_id,
    int? notification_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeNotification",
        "notification_group_id": notification_group_id,
        "notification_id": notification_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeNotificationGroup.html).
  factory TdlibFunction.removeNotificationGroup({
    int? notification_group_id,
    int? max_notification_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeNotificationGroup",
        "notification_group_id": notification_group_id,
        "max_notification_id": max_notification_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeNotificationGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageLink.html).
  factory TdlibFunction.getMessageLink({
    int? chat_id,
    int? message_id,
    int? media_timestamp,
    bool? for_album,
    bool? for_comment,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageLink",
        "chat_id": chat_id,
        "message_id": message_id,
        "media_timestamp": media_timestamp,
        "for_album": for_album,
        "for_comment": for_comment,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageEmbeddingCode.html).
  factory TdlibFunction.getMessageEmbeddingCode({
    int? chat_id,
    int? message_id,
    bool? for_album,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageEmbeddingCode",
        "chat_id": chat_id,
        "message_id": message_id,
        "for_album": for_album,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageEmbeddingCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageLinkInfo.html).
  factory TdlibFunction.getMessageLinkInfo({
    String? url,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageLinkInfo",
        "url": url,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageLinkInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1translateText.html).
  factory TdlibFunction.translateText({
    String? text,
    String? from_language_code,
    String? to_language_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "translateText",
        "text": text,
        "from_language_code": from_language_code,
        "to_language_code": to_language_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method translateText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1recognizeSpeech.html).
  factory TdlibFunction.recognizeSpeech({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "recognizeSpeech",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method recognizeSpeech",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1rateSpeechRecognition.html).
  factory TdlibFunction.rateSpeechRecognition({
    int? chat_id,
    int? message_id,
    bool? is_good,
  }) {
    try {
      return TdlibFunction({
        "@type": "rateSpeechRecognition",
        "chat_id": chat_id,
        "message_id": message_id,
        "is_good": is_good,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method rateSpeechRecognition",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatAvailableMessageSenders.html).
  factory TdlibFunction.getChatAvailableMessageSenders({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatAvailableMessageSenders",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatAvailableMessageSenders",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatMessageSender.html).
  factory TdlibFunction.setChatMessageSender({
    int? chat_id,
    TdlibFunction? message_sender_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatMessageSender",
        "chat_id": chat_id,
        "message_sender_id": message_sender_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatMessageSender",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendMessage.html).
  factory TdlibFunction.sendMessage({
    int? chat_id,
    int? message_thread_id,
    int? reply_to_message_id,
    TdlibFunction? options,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendMessage",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "reply_to_message_id": reply_to_message_id,
        "options": options!.toJson(),
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendMessageAlbum.html).
  factory TdlibFunction.sendMessageAlbum({
    int? chat_id,
    int? message_thread_id,
    int? reply_to_message_id,
    TdlibFunction? options,
    TdlibFunction? input_message_contents,
    bool? only_preview,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendMessageAlbum",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "reply_to_message_id": reply_to_message_id,
        "options": options!.toJson(),
        "input_message_contents": input_message_contents!.toJson(),
        "only_preview": only_preview,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendMessageAlbum",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendBotStartMessage.html).
  factory TdlibFunction.sendBotStartMessage({
    int? bot_user_id,
    int? chat_id,
    String? parameter,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendBotStartMessage",
        "bot_user_id": bot_user_id,
        "chat_id": chat_id,
        "parameter": parameter,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendBotStartMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendInlineQueryResultMessage.html).
  factory TdlibFunction.sendInlineQueryResultMessage({
    int? chat_id,
    int? message_thread_id,
    int? reply_to_message_id,
    TdlibFunction? options,
    int? query_id,
    String? result_id,
    bool? hide_via_bot,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendInlineQueryResultMessage",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "reply_to_message_id": reply_to_message_id,
        "options": options!.toJson(),
        "query_id": query_id,
        "result_id": result_id,
        "hide_via_bot": hide_via_bot,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendInlineQueryResultMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1forwardMessages.html).
  factory TdlibFunction.forwardMessages({
    int? chat_id,
    int? from_chat_id,
    List<int>? message_ids,
    TdlibFunction? options,
    bool? send_copy,
    bool? remove_caption,
    bool? only_preview,
  }) {
    try {
      return TdlibFunction({
        "@type": "forwardMessages",
        "chat_id": chat_id,
        "from_chat_id": from_chat_id,
        "message_ids": message_ids,
        "options": options!.toJson(),
        "send_copy": send_copy,
        "remove_caption": remove_caption,
        "only_preview": only_preview,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method forwardMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendMessages.html).
  factory TdlibFunction.resendMessages({
    int? chat_id,
    List<int>? message_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "resendMessages",
        "chat_id": chat_id,
        "message_ids": message_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendChatScreenshotTakenNotification.html).
  factory TdlibFunction.sendChatScreenshotTakenNotification({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendChatScreenshotTakenNotification",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendChatScreenshotTakenNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addLocalMessage.html).
  factory TdlibFunction.addLocalMessage({
    int? chat_id,
    TdlibFunction? sender_id,
    int? reply_to_message_id,
    bool? disable_notification,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "addLocalMessage",
        "chat_id": chat_id,
        "sender_id": sender_id!.toJson(),
        "reply_to_message_id": reply_to_message_id,
        "disable_notification": disable_notification,
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addLocalMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteMessages.html).
  factory TdlibFunction.deleteMessages({
    int? chat_id,
    List<int>? message_ids,
    bool? revoke,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteMessages",
        "chat_id": chat_id,
        "message_ids": message_ids,
        "revoke": revoke,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteChatMessagesBySender.html).
  factory TdlibFunction.deleteChatMessagesBySender({
    int? chat_id,
    TdlibFunction? sender_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteChatMessagesBySender",
        "chat_id": chat_id,
        "sender_id": sender_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteChatMessagesBySender",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteChatMessagesByDate.html).
  factory TdlibFunction.deleteChatMessagesByDate({
    int? chat_id,
    int? min_date,
    int? max_date,
    bool? revoke,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteChatMessagesByDate",
        "chat_id": chat_id,
        "min_date": min_date,
        "max_date": max_date,
        "revoke": revoke,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteChatMessagesByDate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editMessageText.html).
  factory TdlibFunction.editMessageText({
    int? chat_id,
    int? message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "editMessageText",
        "chat_id": chat_id,
        "message_id": message_id,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editMessageText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editMessageLiveLocation.html).
  factory TdlibFunction.editMessageLiveLocation({
    int? chat_id,
    int? message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? location,
    int? heading,
    int? proximity_alert_radius,
  }) {
    try {
      return TdlibFunction({
        "@type": "editMessageLiveLocation",
        "chat_id": chat_id,
        "message_id": message_id,
        "reply_markup": reply_markup!.toJson(),
        "location": location!.toJson(),
        "heading": heading,
        "proximity_alert_radius": proximity_alert_radius,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editMessageLiveLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editMessageMedia.html).
  factory TdlibFunction.editMessageMedia({
    int? chat_id,
    int? message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "editMessageMedia",
        "chat_id": chat_id,
        "message_id": message_id,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editMessageMedia",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editMessageCaption.html).
  factory TdlibFunction.editMessageCaption({
    int? chat_id,
    int? message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "editMessageCaption",
        "chat_id": chat_id,
        "message_id": message_id,
        "reply_markup": reply_markup!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editMessageCaption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editMessageReplyMarkup.html).
  factory TdlibFunction.editMessageReplyMarkup({
    int? chat_id,
    int? message_id,
    TdlibFunction? reply_markup,
  }) {
    try {
      return TdlibFunction({
        "@type": "editMessageReplyMarkup",
        "chat_id": chat_id,
        "message_id": message_id,
        "reply_markup": reply_markup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editMessageReplyMarkup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editInlineMessageText.html).
  factory TdlibFunction.editInlineMessageText({
    String? inline_message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "editInlineMessageText",
        "inline_message_id": inline_message_id,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editInlineMessageText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editInlineMessageLiveLocation.html).
  factory TdlibFunction.editInlineMessageLiveLocation({
    String? inline_message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? location,
    int? heading,
    int? proximity_alert_radius,
  }) {
    try {
      return TdlibFunction({
        "@type": "editInlineMessageLiveLocation",
        "inline_message_id": inline_message_id,
        "reply_markup": reply_markup!.toJson(),
        "location": location!.toJson(),
        "heading": heading,
        "proximity_alert_radius": proximity_alert_radius,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editInlineMessageLiveLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editInlineMessageMedia.html).
  factory TdlibFunction.editInlineMessageMedia({
    String? inline_message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? input_message_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "editInlineMessageMedia",
        "inline_message_id": inline_message_id,
        "reply_markup": reply_markup!.toJson(),
        "input_message_content": input_message_content!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editInlineMessageMedia",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editInlineMessageCaption.html).
  factory TdlibFunction.editInlineMessageCaption({
    String? inline_message_id,
    TdlibFunction? reply_markup,
    TdlibFunction? caption,
  }) {
    try {
      return TdlibFunction({
        "@type": "editInlineMessageCaption",
        "inline_message_id": inline_message_id,
        "reply_markup": reply_markup!.toJson(),
        "caption": caption!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editInlineMessageCaption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editInlineMessageReplyMarkup.html).
  factory TdlibFunction.editInlineMessageReplyMarkup({
    String? inline_message_id,
    TdlibFunction? reply_markup,
  }) {
    try {
      return TdlibFunction({
        "@type": "editInlineMessageReplyMarkup",
        "inline_message_id": inline_message_id,
        "reply_markup": reply_markup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editInlineMessageReplyMarkup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editMessageSchedulingState.html).
  factory TdlibFunction.editMessageSchedulingState({
    int? chat_id,
    int? message_id,
    TdlibFunction? scheduling_state,
  }) {
    try {
      return TdlibFunction({
        "@type": "editMessageSchedulingState",
        "chat_id": chat_id,
        "message_id": message_id,
        "scheduling_state": scheduling_state!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editMessageSchedulingState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getEmojiReaction.html).
  factory TdlibFunction.getEmojiReaction({
    String? emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "getEmojiReaction",
        "emoji": emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getEmojiReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCustomEmojiReactionAnimations.html).
  factory TdlibFunction.getCustomEmojiReactionAnimations() {
    try {
      return TdlibFunction({
        "@type": "getCustomEmojiReactionAnimations",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCustomEmojiReactionAnimations",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageAvailableReactions.html).
  factory TdlibFunction.getMessageAvailableReactions({
    int? chat_id,
    int? message_id,
    int? row_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageAvailableReactions",
        "chat_id": chat_id,
        "message_id": message_id,
        "row_size": row_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageAvailableReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clearRecentReactions.html).
  factory TdlibFunction.clearRecentReactions() {
    try {
      return TdlibFunction({
        "@type": "clearRecentReactions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clearRecentReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addMessageReaction.html).
  factory TdlibFunction.addMessageReaction({
    int? chat_id,
    int? message_id,
    TdlibFunction? reaction_type,
    bool? is_big,
    bool? update_recent_reactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "addMessageReaction",
        "chat_id": chat_id,
        "message_id": message_id,
        "reaction_type": reaction_type!.toJson(),
        "is_big": is_big,
        "update_recent_reactions": update_recent_reactions,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addMessageReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeMessageReaction.html).
  factory TdlibFunction.removeMessageReaction({
    int? chat_id,
    int? message_id,
    TdlibFunction? reaction_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeMessageReaction",
        "chat_id": chat_id,
        "message_id": message_id,
        "reaction_type": reaction_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeMessageReaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageAddedReactions.html).
  factory TdlibFunction.getMessageAddedReactions({
    int? chat_id,
    int? message_id,
    TdlibFunction? reaction_type,
    String? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageAddedReactions",
        "chat_id": chat_id,
        "message_id": message_id,
        "reaction_type": reaction_type!.toJson(),
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageAddedReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setDefaultReactionType.html).
  factory TdlibFunction.setDefaultReactionType({
    TdlibFunction? reaction_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "setDefaultReactionType",
        "reaction_type": reaction_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setDefaultReactionType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getTextEntities.html).
  factory TdlibFunction.getTextEntities({
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "getTextEntities",
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getTextEntities",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1parseTextEntities.html).
  factory TdlibFunction.parseTextEntities({
    String? text,
    TdlibFunction? parse_mode,
  }) {
    try {
      return TdlibFunction({
        "@type": "parseTextEntities",
        "text": text,
        "parse_mode": parse_mode!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method parseTextEntities",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1parseMarkdown.html).
  factory TdlibFunction.parseMarkdown({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "parseMarkdown",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method parseMarkdown",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMarkdownText.html).
  factory TdlibFunction.getMarkdownText({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMarkdownText",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMarkdownText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getFileMimeType.html).
  factory TdlibFunction.getFileMimeType({
    String? file_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "getFileMimeType",
        "file_name": file_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getFileMimeType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getFileExtension.html).
  factory TdlibFunction.getFileExtension({
    String? mime_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "getFileExtension",
        "mime_type": mime_type,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getFileExtension",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1cleanFileName.html).
  factory TdlibFunction.cleanFileName({
    String? file_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "cleanFileName",
        "file_name": file_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method cleanFileName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLanguagePackString.html).
  factory TdlibFunction.getLanguagePackString({
    String? language_pack_database_path,
    String? localization_target,
    String? language_pack_id,
    String? key,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLanguagePackString",
        "language_pack_database_path": language_pack_database_path,
        "localization_target": localization_target,
        "language_pack_id": language_pack_id,
        "key": key,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLanguagePackString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getJsonValue.html).
  factory TdlibFunction.getJsonValue({
    String? json,
  }) {
    try {
      return TdlibFunction({
        "@type": "getJsonValue",
        "json": json,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getJsonValue",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getJsonString.html).
  factory TdlibFunction.getJsonString({
    TdlibFunction? json_value,
  }) {
    try {
      return TdlibFunction({
        "@type": "getJsonString",
        "json_value": json_value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getJsonString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getThemeParametersJsonString.html).
  factory TdlibFunction.getThemeParametersJsonString({
    TdlibFunction? theme,
  }) {
    try {
      return TdlibFunction({
        "@type": "getThemeParametersJsonString",
        "theme": theme!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getThemeParametersJsonString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setPollAnswer.html).
  factory TdlibFunction.setPollAnswer({
    int? chat_id,
    int? message_id,
    List<int>? option_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "setPollAnswer",
        "chat_id": chat_id,
        "message_id": message_id,
        "option_ids": option_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setPollAnswer",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPollVoters.html).
  factory TdlibFunction.getPollVoters({
    int? chat_id,
    int? message_id,
    int? option_id,
    int? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPollVoters",
        "chat_id": chat_id,
        "message_id": message_id,
        "option_id": option_id,
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPollVoters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1stopPoll.html).
  factory TdlibFunction.stopPoll({
    int? chat_id,
    int? message_id,
    TdlibFunction? reply_markup,
  }) {
    try {
      return TdlibFunction({
        "@type": "stopPoll",
        "chat_id": chat_id,
        "message_id": message_id,
        "reply_markup": reply_markup!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method stopPoll",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1hideSuggestedAction.html).
  factory TdlibFunction.hideSuggestedAction({
    TdlibFunction? action,
  }) {
    try {
      return TdlibFunction({
        "@type": "hideSuggestedAction",
        "action": action!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method hideSuggestedAction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLoginUrlInfo.html).
  factory TdlibFunction.getLoginUrlInfo({
    int? chat_id,
    int? message_id,
    int? button_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLoginUrlInfo",
        "chat_id": chat_id,
        "message_id": message_id,
        "button_id": button_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLoginUrlInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLoginUrl.html).
  factory TdlibFunction.getLoginUrl({
    int? chat_id,
    int? message_id,
    int? button_id,
    bool? allow_write_access,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLoginUrl",
        "chat_id": chat_id,
        "message_id": message_id,
        "button_id": button_id,
        "allow_write_access": allow_write_access,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLoginUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getInlineQueryResults.html).
  factory TdlibFunction.getInlineQueryResults({
    int? bot_user_id,
    int? chat_id,
    TdlibFunction? user_location,
    String? query,
    String? offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "getInlineQueryResults",
        "bot_user_id": bot_user_id,
        "chat_id": chat_id,
        "user_location": user_location!.toJson(),
        "query": query,
        "offset": offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getInlineQueryResults",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1answerInlineQuery.html).
  factory TdlibFunction.answerInlineQuery({
    int? inline_query_id,
    bool? is_personal,
    TdlibFunction? results,
    int? cache_time,
    String? next_offset,
    String? switch_pm_text,
    String? switch_pm_parameter,
  }) {
    try {
      return TdlibFunction({
        "@type": "answerInlineQuery",
        "inline_query_id": inline_query_id,
        "is_personal": is_personal,
        "results": results!.toJson(),
        "cache_time": cache_time,
        "next_offset": next_offset,
        "switch_pm_text": switch_pm_text,
        "switch_pm_parameter": switch_pm_parameter,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method answerInlineQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getWebAppUrl.html).
  factory TdlibFunction.getWebAppUrl({
    int? bot_user_id,
    String? url,
    TdlibFunction? theme,
    String? application_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "getWebAppUrl",
        "bot_user_id": bot_user_id,
        "url": url,
        "theme": theme!.toJson(),
        "application_name": application_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getWebAppUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendWebAppData.html).
  factory TdlibFunction.sendWebAppData({
    int? bot_user_id,
    String? button_text,
    String? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendWebAppData",
        "bot_user_id": bot_user_id,
        "button_text": button_text,
        "data": data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendWebAppData",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1openWebApp.html).
  factory TdlibFunction.openWebApp({
    int? chat_id,
    int? bot_user_id,
    String? url,
    TdlibFunction? theme,
    String? application_name,
    int? reply_to_message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "openWebApp",
        "chat_id": chat_id,
        "bot_user_id": bot_user_id,
        "url": url,
        "theme": theme!.toJson(),
        "application_name": application_name,
        "reply_to_message_id": reply_to_message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method openWebApp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1closeWebApp.html).
  factory TdlibFunction.closeWebApp({
    int? web_app_launch_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "closeWebApp",
        "web_app_launch_id": web_app_launch_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method closeWebApp",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1answerWebAppQuery.html).
  factory TdlibFunction.answerWebAppQuery({
    String? web_app_query_id,
    TdlibFunction? result,
  }) {
    try {
      return TdlibFunction({
        "@type": "answerWebAppQuery",
        "web_app_query_id": web_app_query_id,
        "result": result!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method answerWebAppQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCallbackQueryAnswer.html).
  factory TdlibFunction.getCallbackQueryAnswer({
    int? chat_id,
    int? message_id,
    TdlibFunction? payload,
  }) {
    try {
      return TdlibFunction({
        "@type": "getCallbackQueryAnswer",
        "chat_id": chat_id,
        "message_id": message_id,
        "payload": payload!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCallbackQueryAnswer",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1answerCallbackQuery.html).
  factory TdlibFunction.answerCallbackQuery({
    int? callback_query_id,
    String? text,
    bool? show_alert,
    String? url,
    int? cache_time,
  }) {
    try {
      return TdlibFunction({
        "@type": "answerCallbackQuery",
        "callback_query_id": callback_query_id,
        "text": text,
        "show_alert": show_alert,
        "url": url,
        "cache_time": cache_time,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method answerCallbackQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1answerShippingQuery.html).
  factory TdlibFunction.answerShippingQuery({
    int? shipping_query_id,
    TdlibFunction? shipping_options,
    String? error_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "answerShippingQuery",
        "shipping_query_id": shipping_query_id,
        "shipping_options": shipping_options!.toJson(),
        "error_message": error_message,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method answerShippingQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1answerPreCheckoutQuery.html).
  factory TdlibFunction.answerPreCheckoutQuery({
    int? pre_checkout_query_id,
    String? error_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "answerPreCheckoutQuery",
        "pre_checkout_query_id": pre_checkout_query_id,
        "error_message": error_message,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method answerPreCheckoutQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setGameScore.html).
  factory TdlibFunction.setGameScore({
    int? chat_id,
    int? message_id,
    bool? edit_message,
    int? user_id,
    int? score,
    bool? force,
  }) {
    try {
      return TdlibFunction({
        "@type": "setGameScore",
        "chat_id": chat_id,
        "message_id": message_id,
        "edit_message": edit_message,
        "user_id": user_id,
        "score": score,
        "force": force,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setGameScore",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setInlineGameScore.html).
  factory TdlibFunction.setInlineGameScore({
    String? inline_message_id,
    bool? edit_message,
    int? user_id,
    int? score,
    bool? force,
  }) {
    try {
      return TdlibFunction({
        "@type": "setInlineGameScore",
        "inline_message_id": inline_message_id,
        "edit_message": edit_message,
        "user_id": user_id,
        "score": score,
        "force": force,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setInlineGameScore",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getGameHighScores.html).
  factory TdlibFunction.getGameHighScores({
    int? chat_id,
    int? message_id,
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getGameHighScores",
        "chat_id": chat_id,
        "message_id": message_id,
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getGameHighScores",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getInlineGameHighScores.html).
  factory TdlibFunction.getInlineGameHighScores({
    String? inline_message_id,
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getInlineGameHighScores",
        "inline_message_id": inline_message_id,
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getInlineGameHighScores",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteChatReplyMarkup.html).
  factory TdlibFunction.deleteChatReplyMarkup({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteChatReplyMarkup",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteChatReplyMarkup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendChatAction.html).
  factory TdlibFunction.sendChatAction({
    int? chat_id,
    int? message_thread_id,
    TdlibFunction? action,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendChatAction",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "action": action!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendChatAction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1openChat.html).
  factory TdlibFunction.openChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "openChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method openChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1closeChat.html).
  factory TdlibFunction.closeChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "closeChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method closeChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1viewMessages.html).
  factory TdlibFunction.viewMessages({
    int? chat_id,
    int? message_thread_id,
    List<int>? message_ids,
    bool? force_read,
  }) {
    try {
      return TdlibFunction({
        "@type": "viewMessages",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "message_ids": message_ids,
        "force_read": force_read,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method viewMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1openMessageContent.html).
  factory TdlibFunction.openMessageContent({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "openMessageContent",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method openMessageContent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clickAnimatedEmojiMessage.html).
  factory TdlibFunction.clickAnimatedEmojiMessage({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "clickAnimatedEmojiMessage",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clickAnimatedEmojiMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getInternalLinkType.html).
  factory TdlibFunction.getInternalLinkType({
    String? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "getInternalLinkType",
        "link": link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getInternalLinkType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getExternalLinkInfo.html).
  factory TdlibFunction.getExternalLinkInfo({
    String? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "getExternalLinkInfo",
        "link": link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getExternalLinkInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getExternalLink.html).
  factory TdlibFunction.getExternalLink({
    String? link,
    bool? allow_write_access,
  }) {
    try {
      return TdlibFunction({
        "@type": "getExternalLink",
        "link": link,
        "allow_write_access": allow_write_access,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getExternalLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1readAllChatMentions.html).
  factory TdlibFunction.readAllChatMentions({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "readAllChatMentions",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method readAllChatMentions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1readAllChatReactions.html).
  factory TdlibFunction.readAllChatReactions({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "readAllChatReactions",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method readAllChatReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createPrivateChat.html).
  factory TdlibFunction.createPrivateChat({
    int? user_id,
    bool? force,
  }) {
    try {
      return TdlibFunction({
        "@type": "createPrivateChat",
        "user_id": user_id,
        "force": force,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createPrivateChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createBasicGroupChat.html).
  factory TdlibFunction.createBasicGroupChat({
    int? basic_group_id,
    bool? force,
  }) {
    try {
      return TdlibFunction({
        "@type": "createBasicGroupChat",
        "basic_group_id": basic_group_id,
        "force": force,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createBasicGroupChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createSupergroupChat.html).
  factory TdlibFunction.createSupergroupChat({
    int? supergroup_id,
    bool? force,
  }) {
    try {
      return TdlibFunction({
        "@type": "createSupergroupChat",
        "supergroup_id": supergroup_id,
        "force": force,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createSupergroupChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createSecretChat.html).
  factory TdlibFunction.createSecretChat({
    int? secret_chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "createSecretChat",
        "secret_chat_id": secret_chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createNewBasicGroupChat.html).
  factory TdlibFunction.createNewBasicGroupChat({
    List<int>? user_ids,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "createNewBasicGroupChat",
        "user_ids": user_ids,
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createNewBasicGroupChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createNewSupergroupChat.html).
  factory TdlibFunction.createNewSupergroupChat({
    String? title,
    bool? is_channel,
    String? description,
    TdlibFunction? location,
    bool? for_import,
  }) {
    try {
      return TdlibFunction({
        "@type": "createNewSupergroupChat",
        "title": title,
        "is_channel": is_channel,
        "description": description,
        "location": location!.toJson(),
        "for_import": for_import,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createNewSupergroupChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createNewSecretChat.html).
  factory TdlibFunction.createNewSecretChat({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "createNewSecretChat",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createNewSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1upgradeBasicGroupChatToSupergroupChat.html).
  factory TdlibFunction.upgradeBasicGroupChatToSupergroupChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "upgradeBasicGroupChatToSupergroupChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method upgradeBasicGroupChatToSupergroupChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatListsToAddChat.html).
  factory TdlibFunction.getChatListsToAddChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatListsToAddChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatListsToAddChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addChatToList.html).
  factory TdlibFunction.addChatToList({
    int? chat_id,
    TdlibFunction? chat_list,
  }) {
    try {
      return TdlibFunction({
        "@type": "addChatToList",
        "chat_id": chat_id,
        "chat_list": chat_list!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addChatToList",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatFilter.html).
  factory TdlibFunction.getChatFilter({
    int? chat_filter_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatFilter",
        "chat_filter_id": chat_filter_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createChatFilter.html).
  factory TdlibFunction.createChatFilter({
    TdlibFunction? filter,
  }) {
    try {
      return TdlibFunction({
        "@type": "createChatFilter",
        "filter": filter!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createChatFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editChatFilter.html).
  factory TdlibFunction.editChatFilter({
    int? chat_filter_id,
    TdlibFunction? filter,
  }) {
    try {
      return TdlibFunction({
        "@type": "editChatFilter",
        "chat_filter_id": chat_filter_id,
        "filter": filter!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editChatFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteChatFilter.html).
  factory TdlibFunction.deleteChatFilter({
    int? chat_filter_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteChatFilter",
        "chat_filter_id": chat_filter_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteChatFilter",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reorderChatFilters.html).
  factory TdlibFunction.reorderChatFilters({
    List<int>? chat_filter_ids,
    int? main_chat_list_position,
  }) {
    try {
      return TdlibFunction({
        "@type": "reorderChatFilters",
        "chat_filter_ids": chat_filter_ids,
        "main_chat_list_position": main_chat_list_position,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reorderChatFilters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecommendedChatFilters.html).
  factory TdlibFunction.getRecommendedChatFilters() {
    try {
      return TdlibFunction({
        "@type": "getRecommendedChatFilters",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecommendedChatFilters",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatFilterDefaultIconName.html).
  factory TdlibFunction.getChatFilterDefaultIconName({
    TdlibFunction? filter,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatFilterDefaultIconName",
        "filter": filter!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatFilterDefaultIconName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatTitle.html).
  factory TdlibFunction.setChatTitle({
    int? chat_id,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatTitle",
        "chat_id": chat_id,
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatTitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatPhoto.html).
  factory TdlibFunction.setChatPhoto({
    int? chat_id,
    TdlibFunction? photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatPhoto",
        "chat_id": chat_id,
        "photo": photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatMessageTtl.html).
  factory TdlibFunction.setChatMessageTtl({
    int? chat_id,
    int? ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatMessageTtl",
        "chat_id": chat_id,
        "ttl": ttl,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatMessageTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatPermissions.html).
  factory TdlibFunction.setChatPermissions({
    int? chat_id,
    TdlibFunction? permissions,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatPermissions",
        "chat_id": chat_id,
        "permissions": permissions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatPermissions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatTheme.html).
  factory TdlibFunction.setChatTheme({
    int? chat_id,
    String? theme_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatTheme",
        "chat_id": chat_id,
        "theme_name": theme_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatTheme",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatDraftMessage.html).
  factory TdlibFunction.setChatDraftMessage({
    int? chat_id,
    int? message_thread_id,
    TdlibFunction? draft_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatDraftMessage",
        "chat_id": chat_id,
        "message_thread_id": message_thread_id,
        "draft_message": draft_message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatDraftMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatNotificationSettings.html).
  factory TdlibFunction.setChatNotificationSettings({
    int? chat_id,
    TdlibFunction? notification_settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatNotificationSettings",
        "chat_id": chat_id,
        "notification_settings": notification_settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleChatHasProtectedContent.html).
  factory TdlibFunction.toggleChatHasProtectedContent({
    int? chat_id,
    bool? has_protected_content,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleChatHasProtectedContent",
        "chat_id": chat_id,
        "has_protected_content": has_protected_content,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleChatHasProtectedContent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleChatIsMarkedAsUnread.html).
  factory TdlibFunction.toggleChatIsMarkedAsUnread({
    int? chat_id,
    bool? is_marked_as_unread,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleChatIsMarkedAsUnread",
        "chat_id": chat_id,
        "is_marked_as_unread": is_marked_as_unread,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleChatIsMarkedAsUnread",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleChatDefaultDisableNotification.html).
  factory TdlibFunction.toggleChatDefaultDisableNotification({
    int? chat_id,
    bool? default_disable_notification,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleChatDefaultDisableNotification",
        "chat_id": chat_id,
        "default_disable_notification": default_disable_notification,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleChatDefaultDisableNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatAvailableReactions.html).
  factory TdlibFunction.setChatAvailableReactions({
    int? chat_id,
    TdlibFunction? available_reactions,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatAvailableReactions",
        "chat_id": chat_id,
        "available_reactions": available_reactions!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatAvailableReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatClientData.html).
  factory TdlibFunction.setChatClientData({
    int? chat_id,
    String? client_data,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatClientData",
        "chat_id": chat_id,
        "client_data": client_data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatClientData",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatDescription.html).
  factory TdlibFunction.setChatDescription({
    int? chat_id,
    String? description,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatDescription",
        "chat_id": chat_id,
        "description": description,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatDescription",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatDiscussionGroup.html).
  factory TdlibFunction.setChatDiscussionGroup({
    int? chat_id,
    int? discussion_chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatDiscussionGroup",
        "chat_id": chat_id,
        "discussion_chat_id": discussion_chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatDiscussionGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatLocation.html).
  factory TdlibFunction.setChatLocation({
    int? chat_id,
    TdlibFunction? location,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatLocation",
        "chat_id": chat_id,
        "location": location!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatSlowModeDelay.html).
  factory TdlibFunction.setChatSlowModeDelay({
    int? chat_id,
    int? slow_mode_delay,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatSlowModeDelay",
        "chat_id": chat_id,
        "slow_mode_delay": slow_mode_delay,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatSlowModeDelay",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pinChatMessage.html).
  factory TdlibFunction.pinChatMessage({
    int? chat_id,
    int? message_id,
    bool? disable_notification,
    bool? only_for_self,
  }) {
    try {
      return TdlibFunction({
        "@type": "pinChatMessage",
        "chat_id": chat_id,
        "message_id": message_id,
        "disable_notification": disable_notification,
        "only_for_self": only_for_self,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pinChatMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1unpinChatMessage.html).
  factory TdlibFunction.unpinChatMessage({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "unpinChatMessage",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method unpinChatMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1unpinAllChatMessages.html).
  factory TdlibFunction.unpinAllChatMessages({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "unpinAllChatMessages",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method unpinAllChatMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1joinChat.html).
  factory TdlibFunction.joinChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "joinChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method joinChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1leaveChat.html).
  factory TdlibFunction.leaveChat({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "leaveChat",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method leaveChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addChatMember.html).
  factory TdlibFunction.addChatMember({
    int? chat_id,
    int? user_id,
    int? forward_limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "addChatMember",
        "chat_id": chat_id,
        "user_id": user_id,
        "forward_limit": forward_limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addChatMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addChatMembers.html).
  factory TdlibFunction.addChatMembers({
    int? chat_id,
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "addChatMembers",
        "chat_id": chat_id,
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addChatMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setChatMemberStatus.html).
  factory TdlibFunction.setChatMemberStatus({
    int? chat_id,
    TdlibFunction? member_id,
    TdlibFunction? status,
  }) {
    try {
      return TdlibFunction({
        "@type": "setChatMemberStatus",
        "chat_id": chat_id,
        "member_id": member_id!.toJson(),
        "status": status!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setChatMemberStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1banChatMember.html).
  factory TdlibFunction.banChatMember({
    int? chat_id,
    TdlibFunction? member_id,
    int? banned_until_date,
    bool? revoke_messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "banChatMember",
        "chat_id": chat_id,
        "member_id": member_id!.toJson(),
        "banned_until_date": banned_until_date,
        "revoke_messages": revoke_messages,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method banChatMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1canTransferOwnership.html).
  factory TdlibFunction.canTransferOwnership() {
    try {
      return TdlibFunction({
        "@type": "canTransferOwnership",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method canTransferOwnership",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1transferChatOwnership.html).
  factory TdlibFunction.transferChatOwnership({
    int? chat_id,
    int? user_id,
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "transferChatOwnership",
        "chat_id": chat_id,
        "user_id": user_id,
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method transferChatOwnership",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatMember.html).
  factory TdlibFunction.getChatMember({
    int? chat_id,
    TdlibFunction? member_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatMember",
        "chat_id": chat_id,
        "member_id": member_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatMember",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchChatMembers.html).
  factory TdlibFunction.searchChatMembers({
    int? chat_id,
    String? query,
    int? limit,
    TdlibFunction? filter,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchChatMembers",
        "chat_id": chat_id,
        "query": query,
        "limit": limit,
        "filter": filter!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchChatMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatAdministrators.html).
  factory TdlibFunction.getChatAdministrators({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatAdministrators",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatAdministrators",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clearAllDraftMessages.html).
  factory TdlibFunction.clearAllDraftMessages({
    bool? exclude_secret_chats,
  }) {
    try {
      return TdlibFunction({
        "@type": "clearAllDraftMessages",
        "exclude_secret_chats": exclude_secret_chats,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clearAllDraftMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSavedNotificationSound.html).
  factory TdlibFunction.getSavedNotificationSound({
    int? notification_sound_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSavedNotificationSound",
        "notification_sound_id": notification_sound_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSavedNotificationSound",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSavedNotificationSounds.html).
  factory TdlibFunction.getSavedNotificationSounds() {
    try {
      return TdlibFunction({
        "@type": "getSavedNotificationSounds",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSavedNotificationSounds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addSavedNotificationSound.html).
  factory TdlibFunction.addSavedNotificationSound({
    TdlibFunction? sound,
  }) {
    try {
      return TdlibFunction({
        "@type": "addSavedNotificationSound",
        "sound": sound!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addSavedNotificationSound",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeSavedNotificationSound.html).
  factory TdlibFunction.removeSavedNotificationSound({
    int? notification_sound_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeSavedNotificationSound",
        "notification_sound_id": notification_sound_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeSavedNotificationSound",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatNotificationSettingsExceptions.html).
  factory TdlibFunction.getChatNotificationSettingsExceptions({
    TdlibFunction? scope,
    bool? compare_sound,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatNotificationSettingsExceptions",
        "scope": scope!.toJson(),
        "compare_sound": compare_sound,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatNotificationSettingsExceptions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getScopeNotificationSettings.html).
  factory TdlibFunction.getScopeNotificationSettings({
    TdlibFunction? scope,
  }) {
    try {
      return TdlibFunction({
        "@type": "getScopeNotificationSettings",
        "scope": scope!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getScopeNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setScopeNotificationSettings.html).
  factory TdlibFunction.setScopeNotificationSettings({
    TdlibFunction? scope,
    TdlibFunction? notification_settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "setScopeNotificationSettings",
        "scope": scope!.toJson(),
        "notification_settings": notification_settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setScopeNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetAllNotificationSettings.html).
  factory TdlibFunction.resetAllNotificationSettings() {
    try {
      return TdlibFunction({
        "@type": "resetAllNotificationSettings",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetAllNotificationSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleChatIsPinned.html).
  factory TdlibFunction.toggleChatIsPinned({
    TdlibFunction? chat_list,
    int? chat_id,
    bool? is_pinned,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleChatIsPinned",
        "chat_list": chat_list!.toJson(),
        "chat_id": chat_id,
        "is_pinned": is_pinned,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleChatIsPinned",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setPinnedChats.html).
  factory TdlibFunction.setPinnedChats({
    TdlibFunction? chat_list,
    List<int>? chat_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "setPinnedChats",
        "chat_list": chat_list!.toJson(),
        "chat_ids": chat_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setPinnedChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAttachmentMenuBot.html).
  factory TdlibFunction.getAttachmentMenuBot({
    int? bot_user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getAttachmentMenuBot",
        "bot_user_id": bot_user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAttachmentMenuBot",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleBotIsAddedToAttachmentMenu.html).
  factory TdlibFunction.toggleBotIsAddedToAttachmentMenu({
    int? bot_user_id,
    bool? is_added,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleBotIsAddedToAttachmentMenu",
        "bot_user_id": bot_user_id,
        "is_added": is_added,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleBotIsAddedToAttachmentMenu",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getThemedEmojiStatuses.html).
  factory TdlibFunction.getThemedEmojiStatuses() {
    try {
      return TdlibFunction({
        "@type": "getThemedEmojiStatuses",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getThemedEmojiStatuses",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecentEmojiStatuses.html).
  factory TdlibFunction.getRecentEmojiStatuses() {
    try {
      return TdlibFunction({
        "@type": "getRecentEmojiStatuses",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecentEmojiStatuses",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getDefaultEmojiStatuses.html).
  factory TdlibFunction.getDefaultEmojiStatuses() {
    try {
      return TdlibFunction({
        "@type": "getDefaultEmojiStatuses",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getDefaultEmojiStatuses",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clearRecentEmojiStatuses.html).
  factory TdlibFunction.clearRecentEmojiStatuses() {
    try {
      return TdlibFunction({
        "@type": "clearRecentEmojiStatuses",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clearRecentEmojiStatuses",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1downloadFile.html).
  factory TdlibFunction.downloadFile({
    int? file_id,
    int? priority,
    int? offset,
    int? limit,
    bool? synchronous,
  }) {
    try {
      return TdlibFunction({
        "@type": "downloadFile",
        "file_id": file_id,
        "priority": priority,
        "offset": offset,
        "limit": limit,
        "synchronous": synchronous,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method downloadFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getFileDownloadedPrefixSize.html).
  factory TdlibFunction.getFileDownloadedPrefixSize({
    int? file_id,
    int? offset,
  }) {
    try {
      return TdlibFunction({
        "@type": "getFileDownloadedPrefixSize",
        "file_id": file_id,
        "offset": offset,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getFileDownloadedPrefixSize",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1cancelDownloadFile.html).
  factory TdlibFunction.cancelDownloadFile({
    int? file_id,
    bool? only_if_pending,
  }) {
    try {
      return TdlibFunction({
        "@type": "cancelDownloadFile",
        "file_id": file_id,
        "only_if_pending": only_if_pending,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method cancelDownloadFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSuggestedFileName.html).
  factory TdlibFunction.getSuggestedFileName({
    int? file_id,
    String? directory,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSuggestedFileName",
        "file_id": file_id,
        "directory": directory,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSuggestedFileName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1preliminaryUploadFile.html).
  factory TdlibFunction.preliminaryUploadFile({
    TdlibFunction? file,
    TdlibFunction? file_type,
    int? priority,
  }) {
    try {
      return TdlibFunction({
        "@type": "preliminaryUploadFile",
        "file": file!.toJson(),
        "file_type": file_type!.toJson(),
        "priority": priority,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method preliminaryUploadFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1cancelPreliminaryUploadFile.html).
  factory TdlibFunction.cancelPreliminaryUploadFile({
    int? file_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "cancelPreliminaryUploadFile",
        "file_id": file_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method cancelPreliminaryUploadFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1writeGeneratedFilePart.html).
  factory TdlibFunction.writeGeneratedFilePart({
    int? generation_id,
    int? offset,
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "writeGeneratedFilePart",
        "generation_id": generation_id,
        "offset": offset,
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method writeGeneratedFilePart",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setFileGenerationProgress.html).
  factory TdlibFunction.setFileGenerationProgress({
    int? generation_id,
    int? expected_size,
    int? local_prefix_size,
  }) {
    try {
      return TdlibFunction({
        "@type": "setFileGenerationProgress",
        "generation_id": generation_id,
        "expected_size": expected_size,
        "local_prefix_size": local_prefix_size,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setFileGenerationProgress",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1finishFileGeneration.html).
  factory TdlibFunction.finishFileGeneration({
    int? generation_id,
    TdlibFunction? error,
  }) {
    try {
      return TdlibFunction({
        "@type": "finishFileGeneration",
        "generation_id": generation_id,
        "error": error!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method finishFileGeneration",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1readFilePart.html).
  factory TdlibFunction.readFilePart({
    int? file_id,
    int? offset,
    int? count,
  }) {
    try {
      return TdlibFunction({
        "@type": "readFilePart",
        "file_id": file_id,
        "offset": offset,
        "count": count,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method readFilePart",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteFile.html).
  factory TdlibFunction.deleteFile({
    int? file_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteFile",
        "file_id": file_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addFileToDownloads.html).
  factory TdlibFunction.addFileToDownloads({
    int? file_id,
    int? chat_id,
    int? message_id,
    int? priority,
  }) {
    try {
      return TdlibFunction({
        "@type": "addFileToDownloads",
        "file_id": file_id,
        "chat_id": chat_id,
        "message_id": message_id,
        "priority": priority,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addFileToDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleDownloadIsPaused.html).
  factory TdlibFunction.toggleDownloadIsPaused({
    int? file_id,
    bool? is_paused,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleDownloadIsPaused",
        "file_id": file_id,
        "is_paused": is_paused,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleDownloadIsPaused",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleAllDownloadsArePaused.html).
  factory TdlibFunction.toggleAllDownloadsArePaused({
    bool? are_paused,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleAllDownloadsArePaused",
        "are_paused": are_paused,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleAllDownloadsArePaused",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeFileFromDownloads.html).
  factory TdlibFunction.removeFileFromDownloads({
    int? file_id,
    bool? delete_from_cache,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeFileFromDownloads",
        "file_id": file_id,
        "delete_from_cache": delete_from_cache,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeFileFromDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeAllFilesFromDownloads.html).
  factory TdlibFunction.removeAllFilesFromDownloads({
    bool? only_active,
    bool? only_completed,
    bool? delete_from_cache,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeAllFilesFromDownloads",
        "only_active": only_active,
        "only_completed": only_completed,
        "delete_from_cache": delete_from_cache,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeAllFilesFromDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchFileDownloads.html).
  factory TdlibFunction.searchFileDownloads({
    String? query,
    bool? only_active,
    bool? only_completed,
    String? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchFileDownloads",
        "query": query,
        "only_active": only_active,
        "only_completed": only_completed,
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchFileDownloads",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageFileType.html).
  factory TdlibFunction.getMessageFileType({
    String? message_file_head,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageFileType",
        "message_file_head": message_file_head,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageFileType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageImportConfirmationText.html).
  factory TdlibFunction.getMessageImportConfirmationText({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageImportConfirmationText",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageImportConfirmationText",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1importMessages.html).
  factory TdlibFunction.importMessages({
    int? chat_id,
    TdlibFunction? message_file,
    TdlibFunction? attached_files,
  }) {
    try {
      return TdlibFunction({
        "@type": "importMessages",
        "chat_id": chat_id,
        "message_file": message_file!.toJson(),
        "attached_files": attached_files!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method importMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1replacePrimaryChatInviteLink.html).
  factory TdlibFunction.replacePrimaryChatInviteLink({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "replacePrimaryChatInviteLink",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method replacePrimaryChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createChatInviteLink.html).
  factory TdlibFunction.createChatInviteLink({
    int? chat_id,
    String? name,
    int? expiration_date,
    int? member_limit,
    bool? creates_join_request,
  }) {
    try {
      return TdlibFunction({
        "@type": "createChatInviteLink",
        "chat_id": chat_id,
        "name": name,
        "expiration_date": expiration_date,
        "member_limit": member_limit,
        "creates_join_request": creates_join_request,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editChatInviteLink.html).
  factory TdlibFunction.editChatInviteLink({
    int? chat_id,
    String? invite_link,
    String? name,
    int? expiration_date,
    int? member_limit,
    bool? creates_join_request,
  }) {
    try {
      return TdlibFunction({
        "@type": "editChatInviteLink",
        "chat_id": chat_id,
        "invite_link": invite_link,
        "name": name,
        "expiration_date": expiration_date,
        "member_limit": member_limit,
        "creates_join_request": creates_join_request,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatInviteLink.html).
  factory TdlibFunction.getChatInviteLink({
    int? chat_id,
    String? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatInviteLink",
        "chat_id": chat_id,
        "invite_link": invite_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatInviteLinkCounts.html).
  factory TdlibFunction.getChatInviteLinkCounts({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatInviteLinkCounts",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatInviteLinkCounts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatInviteLinks.html).
  factory TdlibFunction.getChatInviteLinks({
    int? chat_id,
    int? creator_user_id,
    bool? is_revoked,
    int? offset_date,
    String? offset_invite_link,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatInviteLinks",
        "chat_id": chat_id,
        "creator_user_id": creator_user_id,
        "is_revoked": is_revoked,
        "offset_date": offset_date,
        "offset_invite_link": offset_invite_link,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatInviteLinks",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatInviteLinkMembers.html).
  factory TdlibFunction.getChatInviteLinkMembers({
    int? chat_id,
    String? invite_link,
    TdlibFunction? offset_member,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatInviteLinkMembers",
        "chat_id": chat_id,
        "invite_link": invite_link,
        "offset_member": offset_member!.toJson(),
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatInviteLinkMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1revokeChatInviteLink.html).
  factory TdlibFunction.revokeChatInviteLink({
    int? chat_id,
    String? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "revokeChatInviteLink",
        "chat_id": chat_id,
        "invite_link": invite_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method revokeChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteRevokedChatInviteLink.html).
  factory TdlibFunction.deleteRevokedChatInviteLink({
    int? chat_id,
    String? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteRevokedChatInviteLink",
        "chat_id": chat_id,
        "invite_link": invite_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteRevokedChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteAllRevokedChatInviteLinks.html).
  factory TdlibFunction.deleteAllRevokedChatInviteLinks({
    int? chat_id,
    int? creator_user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteAllRevokedChatInviteLinks",
        "chat_id": chat_id,
        "creator_user_id": creator_user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteAllRevokedChatInviteLinks",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChatInviteLink.html).
  factory TdlibFunction.checkChatInviteLink({
    String? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkChatInviteLink",
        "invite_link": invite_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChatInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1joinChatByInviteLink.html).
  factory TdlibFunction.joinChatByInviteLink({
    String? invite_link,
  }) {
    try {
      return TdlibFunction({
        "@type": "joinChatByInviteLink",
        "invite_link": invite_link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method joinChatByInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatJoinRequests.html).
  factory TdlibFunction.getChatJoinRequests({
    int? chat_id,
    String? invite_link,
    String? query,
    TdlibFunction? offset_request,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatJoinRequests",
        "chat_id": chat_id,
        "invite_link": invite_link,
        "query": query,
        "offset_request": offset_request!.toJson(),
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatJoinRequests",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1processChatJoinRequest.html).
  factory TdlibFunction.processChatJoinRequest({
    int? chat_id,
    int? user_id,
    bool? approve,
  }) {
    try {
      return TdlibFunction({
        "@type": "processChatJoinRequest",
        "chat_id": chat_id,
        "user_id": user_id,
        "approve": approve,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method processChatJoinRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1processChatJoinRequests.html).
  factory TdlibFunction.processChatJoinRequests({
    int? chat_id,
    String? invite_link,
    bool? approve,
  }) {
    try {
      return TdlibFunction({
        "@type": "processChatJoinRequests",
        "chat_id": chat_id,
        "invite_link": invite_link,
        "approve": approve,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method processChatJoinRequests",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createCall.html).
  factory TdlibFunction.createCall({
    int? user_id,
    TdlibFunction? protocol,
    bool? is_video,
  }) {
    try {
      return TdlibFunction({
        "@type": "createCall",
        "user_id": user_id,
        "protocol": protocol!.toJson(),
        "is_video": is_video,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1acceptCall.html).
  factory TdlibFunction.acceptCall({
    int? call_id,
    TdlibFunction? protocol,
  }) {
    try {
      return TdlibFunction({
        "@type": "acceptCall",
        "call_id": call_id,
        "protocol": protocol!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method acceptCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendCallSignalingData.html).
  factory TdlibFunction.sendCallSignalingData({
    int? call_id,
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendCallSignalingData",
        "call_id": call_id,
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendCallSignalingData",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1discardCall.html).
  factory TdlibFunction.discardCall({
    int? call_id,
    bool? is_disconnected,
    int? duration,
    bool? is_video,
    int? connection_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "discardCall",
        "call_id": call_id,
        "is_disconnected": is_disconnected,
        "duration": duration,
        "is_video": is_video,
        "connection_id": connection_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method discardCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendCallRating.html).
  factory TdlibFunction.sendCallRating({
    int? call_id,
    int? rating,
    String? comment,
    TdlibFunction? problems,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendCallRating",
        "call_id": call_id,
        "rating": rating,
        "comment": comment,
        "problems": problems!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendCallRating",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendCallDebugInformation.html).
  factory TdlibFunction.sendCallDebugInformation({
    int? call_id,
    String? debug_information,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendCallDebugInformation",
        "call_id": call_id,
        "debug_information": debug_information,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendCallDebugInformation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendCallLog.html).
  factory TdlibFunction.sendCallLog({
    int? call_id,
    TdlibFunction? log_file,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendCallLog",
        "call_id": call_id,
        "log_file": log_file!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendCallLog",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getVideoChatAvailableParticipants.html).
  factory TdlibFunction.getVideoChatAvailableParticipants({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getVideoChatAvailableParticipants",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getVideoChatAvailableParticipants",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setVideoChatDefaultParticipant.html).
  factory TdlibFunction.setVideoChatDefaultParticipant({
    int? chat_id,
    TdlibFunction? default_participant_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "setVideoChatDefaultParticipant",
        "chat_id": chat_id,
        "default_participant_id": default_participant_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setVideoChatDefaultParticipant",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createVideoChat.html).
  factory TdlibFunction.createVideoChat({
    int? chat_id,
    String? title,
    int? start_date,
    bool? is_rtmp_stream,
  }) {
    try {
      return TdlibFunction({
        "@type": "createVideoChat",
        "chat_id": chat_id,
        "title": title,
        "start_date": start_date,
        "is_rtmp_stream": is_rtmp_stream,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createVideoChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getVideoChatRtmpUrl.html).
  factory TdlibFunction.getVideoChatRtmpUrl({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getVideoChatRtmpUrl",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getVideoChatRtmpUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1replaceVideoChatRtmpUrl.html).
  factory TdlibFunction.replaceVideoChatRtmpUrl({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "replaceVideoChatRtmpUrl",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method replaceVideoChatRtmpUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getGroupCall.html).
  factory TdlibFunction.getGroupCall({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getGroupCall",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getGroupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1startScheduledGroupCall.html).
  factory TdlibFunction.startScheduledGroupCall({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "startScheduledGroupCall",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method startScheduledGroupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallEnabledStartNotification.html).
  factory TdlibFunction.toggleGroupCallEnabledStartNotification({
    int? group_call_id,
    bool? enabled_start_notification,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallEnabledStartNotification",
        "group_call_id": group_call_id,
        "enabled_start_notification": enabled_start_notification,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallEnabledStartNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1joinGroupCall.html).
  factory TdlibFunction.joinGroupCall({
    int? group_call_id,
    TdlibFunction? participant_id,
    int? audio_source_id,
    String? payload,
    bool? is_muted,
    bool? is_my_video_enabled,
    String? invite_hash,
  }) {
    try {
      return TdlibFunction({
        "@type": "joinGroupCall",
        "group_call_id": group_call_id,
        "participant_id": participant_id!.toJson(),
        "audio_source_id": audio_source_id,
        "payload": payload,
        "is_muted": is_muted,
        "is_my_video_enabled": is_my_video_enabled,
        "invite_hash": invite_hash,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method joinGroupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1startGroupCallScreenSharing.html).
  factory TdlibFunction.startGroupCallScreenSharing({
    int? group_call_id,
    int? audio_source_id,
    String? payload,
  }) {
    try {
      return TdlibFunction({
        "@type": "startGroupCallScreenSharing",
        "group_call_id": group_call_id,
        "audio_source_id": audio_source_id,
        "payload": payload,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method startGroupCallScreenSharing",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallScreenSharingIsPaused.html).
  factory TdlibFunction.toggleGroupCallScreenSharingIsPaused({
    int? group_call_id,
    bool? is_paused,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallScreenSharingIsPaused",
        "group_call_id": group_call_id,
        "is_paused": is_paused,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallScreenSharingIsPaused",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1endGroupCallScreenSharing.html).
  factory TdlibFunction.endGroupCallScreenSharing({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "endGroupCallScreenSharing",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method endGroupCallScreenSharing",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setGroupCallTitle.html).
  factory TdlibFunction.setGroupCallTitle({
    int? group_call_id,
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "setGroupCallTitle",
        "group_call_id": group_call_id,
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setGroupCallTitle",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallMuteNewParticipants.html).
  factory TdlibFunction.toggleGroupCallMuteNewParticipants({
    int? group_call_id,
    bool? mute_new_participants,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallMuteNewParticipants",
        "group_call_id": group_call_id,
        "mute_new_participants": mute_new_participants,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallMuteNewParticipants",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1inviteGroupCallParticipants.html).
  factory TdlibFunction.inviteGroupCallParticipants({
    int? group_call_id,
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "inviteGroupCallParticipants",
        "group_call_id": group_call_id,
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method inviteGroupCallParticipants",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getGroupCallInviteLink.html).
  factory TdlibFunction.getGroupCallInviteLink({
    int? group_call_id,
    bool? can_self_unmute,
  }) {
    try {
      return TdlibFunction({
        "@type": "getGroupCallInviteLink",
        "group_call_id": group_call_id,
        "can_self_unmute": can_self_unmute,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getGroupCallInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1revokeGroupCallInviteLink.html).
  factory TdlibFunction.revokeGroupCallInviteLink({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "revokeGroupCallInviteLink",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method revokeGroupCallInviteLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1startGroupCallRecording.html).
  factory TdlibFunction.startGroupCallRecording({
    int? group_call_id,
    String? title,
    bool? record_video,
    bool? use_portrait_orientation,
  }) {
    try {
      return TdlibFunction({
        "@type": "startGroupCallRecording",
        "group_call_id": group_call_id,
        "title": title,
        "record_video": record_video,
        "use_portrait_orientation": use_portrait_orientation,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method startGroupCallRecording",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1endGroupCallRecording.html).
  factory TdlibFunction.endGroupCallRecording({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "endGroupCallRecording",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method endGroupCallRecording",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallIsMyVideoPaused.html).
  factory TdlibFunction.toggleGroupCallIsMyVideoPaused({
    int? group_call_id,
    bool? is_my_video_paused,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallIsMyVideoPaused",
        "group_call_id": group_call_id,
        "is_my_video_paused": is_my_video_paused,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallIsMyVideoPaused",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallIsMyVideoEnabled.html).
  factory TdlibFunction.toggleGroupCallIsMyVideoEnabled({
    int? group_call_id,
    bool? is_my_video_enabled,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallIsMyVideoEnabled",
        "group_call_id": group_call_id,
        "is_my_video_enabled": is_my_video_enabled,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallIsMyVideoEnabled",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setGroupCallParticipantIsSpeaking.html).
  factory TdlibFunction.setGroupCallParticipantIsSpeaking({
    int? group_call_id,
    int? audio_source,
    bool? is_speaking,
  }) {
    try {
      return TdlibFunction({
        "@type": "setGroupCallParticipantIsSpeaking",
        "group_call_id": group_call_id,
        "audio_source": audio_source,
        "is_speaking": is_speaking,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setGroupCallParticipantIsSpeaking",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallParticipantIsMuted.html).
  factory TdlibFunction.toggleGroupCallParticipantIsMuted({
    int? group_call_id,
    TdlibFunction? participant_id,
    bool? is_muted,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallParticipantIsMuted",
        "group_call_id": group_call_id,
        "participant_id": participant_id!.toJson(),
        "is_muted": is_muted,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallParticipantIsMuted",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setGroupCallParticipantVolumeLevel.html).
  factory TdlibFunction.setGroupCallParticipantVolumeLevel({
    int? group_call_id,
    TdlibFunction? participant_id,
    int? volume_level,
  }) {
    try {
      return TdlibFunction({
        "@type": "setGroupCallParticipantVolumeLevel",
        "group_call_id": group_call_id,
        "participant_id": participant_id!.toJson(),
        "volume_level": volume_level,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setGroupCallParticipantVolumeLevel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleGroupCallParticipantIsHandRaised.html).
  factory TdlibFunction.toggleGroupCallParticipantIsHandRaised({
    int? group_call_id,
    TdlibFunction? participant_id,
    bool? is_hand_raised,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleGroupCallParticipantIsHandRaised",
        "group_call_id": group_call_id,
        "participant_id": participant_id!.toJson(),
        "is_hand_raised": is_hand_raised,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleGroupCallParticipantIsHandRaised",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1loadGroupCallParticipants.html).
  factory TdlibFunction.loadGroupCallParticipants({
    int? group_call_id,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "loadGroupCallParticipants",
        "group_call_id": group_call_id,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method loadGroupCallParticipants",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1leaveGroupCall.html).
  factory TdlibFunction.leaveGroupCall({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "leaveGroupCall",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method leaveGroupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1endGroupCall.html).
  factory TdlibFunction.endGroupCall({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "endGroupCall",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method endGroupCall",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getGroupCallStreams.html).
  factory TdlibFunction.getGroupCallStreams({
    int? group_call_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getGroupCallStreams",
        "group_call_id": group_call_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getGroupCallStreams",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getGroupCallStreamSegment.html).
  factory TdlibFunction.getGroupCallStreamSegment({
    int? group_call_id,
    int? time_offset,
    int? scale,
    int? channel_id,
    TdlibFunction? video_quality,
  }) {
    try {
      return TdlibFunction({
        "@type": "getGroupCallStreamSegment",
        "group_call_id": group_call_id,
        "time_offset": time_offset,
        "scale": scale,
        "channel_id": channel_id,
        "video_quality": video_quality!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getGroupCallStreamSegment",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleMessageSenderIsBlocked.html).
  factory TdlibFunction.toggleMessageSenderIsBlocked({
    TdlibFunction? sender_id,
    bool? is_blocked,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleMessageSenderIsBlocked",
        "sender_id": sender_id!.toJson(),
        "is_blocked": is_blocked,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleMessageSenderIsBlocked",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1blockMessageSenderFromReplies.html).
  factory TdlibFunction.blockMessageSenderFromReplies({
    int? message_id,
    bool? delete_message,
    bool? delete_all_messages,
    bool? report_spam,
  }) {
    try {
      return TdlibFunction({
        "@type": "blockMessageSenderFromReplies",
        "message_id": message_id,
        "delete_message": delete_message,
        "delete_all_messages": delete_all_messages,
        "report_spam": report_spam,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method blockMessageSenderFromReplies",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getBlockedMessageSenders.html).
  factory TdlibFunction.getBlockedMessageSenders({
    int? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getBlockedMessageSenders",
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getBlockedMessageSenders",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addContact.html).
  factory TdlibFunction.addContact({
    TdlibFunction? contact,
    bool? share_phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "addContact",
        "contact": contact!.toJson(),
        "share_phone_number": share_phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addContact",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1importContacts.html).
  factory TdlibFunction.importContacts({
    TdlibFunction? contacts,
  }) {
    try {
      return TdlibFunction({
        "@type": "importContacts",
        "contacts": contacts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method importContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getContacts.html).
  factory TdlibFunction.getContacts() {
    try {
      return TdlibFunction({
        "@type": "getContacts",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchContacts.html).
  factory TdlibFunction.searchContacts({
    String? query,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchContacts",
        "query": query,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeContacts.html).
  factory TdlibFunction.removeContacts({
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeContacts",
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getImportedContactCount.html).
  factory TdlibFunction.getImportedContactCount() {
    try {
      return TdlibFunction({
        "@type": "getImportedContactCount",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getImportedContactCount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1changeImportedContacts.html).
  factory TdlibFunction.changeImportedContacts({
    TdlibFunction? contacts,
  }) {
    try {
      return TdlibFunction({
        "@type": "changeImportedContacts",
        "contacts": contacts!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method changeImportedContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clearImportedContacts.html).
  factory TdlibFunction.clearImportedContacts() {
    try {
      return TdlibFunction({
        "@type": "clearImportedContacts",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clearImportedContacts",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchUserByPhoneNumber.html).
  factory TdlibFunction.searchUserByPhoneNumber({
    String? phone_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchUserByPhoneNumber",
        "phone_number": phone_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchUserByPhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sharePhoneNumber.html).
  factory TdlibFunction.sharePhoneNumber({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "sharePhoneNumber",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sharePhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getUserProfilePhotos.html).
  factory TdlibFunction.getUserProfilePhotos({
    int? user_id,
    int? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getUserProfilePhotos",
        "user_id": user_id,
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getUserProfilePhotos",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getStickers.html).
  factory TdlibFunction.getStickers({
    TdlibFunction? sticker_type,
    String? query,
    int? limit,
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getStickers",
        "sticker_type": sticker_type!.toJson(),
        "query": query,
        "limit": limit,
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchStickers.html).
  factory TdlibFunction.searchStickers({
    String? emoji,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchStickers",
        "emoji": emoji,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPremiumStickers.html).
  factory TdlibFunction.getPremiumStickers({
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPremiumStickers",
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPremiumStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getInstalledStickerSets.html).
  factory TdlibFunction.getInstalledStickerSets({
    TdlibFunction? sticker_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "getInstalledStickerSets",
        "sticker_type": sticker_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getInstalledStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getArchivedStickerSets.html).
  factory TdlibFunction.getArchivedStickerSets({
    TdlibFunction? sticker_type,
    int? offset_sticker_set_id,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getArchivedStickerSets",
        "sticker_type": sticker_type!.toJson(),
        "offset_sticker_set_id": offset_sticker_set_id,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getArchivedStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getTrendingStickerSets.html).
  factory TdlibFunction.getTrendingStickerSets({
    TdlibFunction? sticker_type,
    int? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getTrendingStickerSets",
        "sticker_type": sticker_type!.toJson(),
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getTrendingStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAttachedStickerSets.html).
  factory TdlibFunction.getAttachedStickerSets({
    int? file_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getAttachedStickerSets",
        "file_id": file_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAttachedStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getStickerSet.html).
  factory TdlibFunction.getStickerSet({
    int? set_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getStickerSet",
        "set_id": set_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchStickerSet.html).
  factory TdlibFunction.searchStickerSet({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchStickerSet",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchInstalledStickerSets.html).
  factory TdlibFunction.searchInstalledStickerSets({
    TdlibFunction? sticker_type,
    String? query,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchInstalledStickerSets",
        "sticker_type": sticker_type!.toJson(),
        "query": query,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchInstalledStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchStickerSets.html).
  factory TdlibFunction.searchStickerSets({
    String? query,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchStickerSets",
        "query": query,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1changeStickerSet.html).
  factory TdlibFunction.changeStickerSet({
    int? set_id,
    bool? is_installed,
    bool? is_archived,
  }) {
    try {
      return TdlibFunction({
        "@type": "changeStickerSet",
        "set_id": set_id,
        "is_installed": is_installed,
        "is_archived": is_archived,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method changeStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1viewTrendingStickerSets.html).
  factory TdlibFunction.viewTrendingStickerSets({
    List<int>? sticker_set_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "viewTrendingStickerSets",
        "sticker_set_ids": sticker_set_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method viewTrendingStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reorderInstalledStickerSets.html).
  factory TdlibFunction.reorderInstalledStickerSets({
    TdlibFunction? sticker_type,
    List<int>? sticker_set_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "reorderInstalledStickerSets",
        "sticker_type": sticker_type!.toJson(),
        "sticker_set_ids": sticker_set_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reorderInstalledStickerSets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecentStickers.html).
  factory TdlibFunction.getRecentStickers({
    bool? is_attached,
  }) {
    try {
      return TdlibFunction({
        "@type": "getRecentStickers",
        "is_attached": is_attached,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecentStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addRecentSticker.html).
  factory TdlibFunction.addRecentSticker({
    bool? is_attached,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "addRecentSticker",
        "is_attached": is_attached,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addRecentSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeRecentSticker.html).
  factory TdlibFunction.removeRecentSticker({
    bool? is_attached,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeRecentSticker",
        "is_attached": is_attached,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeRecentSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clearRecentStickers.html).
  factory TdlibFunction.clearRecentStickers({
    bool? is_attached,
  }) {
    try {
      return TdlibFunction({
        "@type": "clearRecentStickers",
        "is_attached": is_attached,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clearRecentStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getFavoriteStickers.html).
  factory TdlibFunction.getFavoriteStickers() {
    try {
      return TdlibFunction({
        "@type": "getFavoriteStickers",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getFavoriteStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addFavoriteSticker.html).
  factory TdlibFunction.addFavoriteSticker({
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "addFavoriteSticker",
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addFavoriteSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeFavoriteSticker.html).
  factory TdlibFunction.removeFavoriteSticker({
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeFavoriteSticker",
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeFavoriteSticker",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getStickerEmojis.html).
  factory TdlibFunction.getStickerEmojis({
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "getStickerEmojis",
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getStickerEmojis",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchEmojis.html).
  factory TdlibFunction.searchEmojis({
    String? text,
    bool? exact_match,
    List<String>? input_language_codes,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchEmojis",
        "text": text,
        "exact_match": exact_match,
        "input_language_codes": input_language_codes,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchEmojis",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAnimatedEmoji.html).
  factory TdlibFunction.getAnimatedEmoji({
    String? emoji,
  }) {
    try {
      return TdlibFunction({
        "@type": "getAnimatedEmoji",
        "emoji": emoji,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAnimatedEmoji",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getEmojiSuggestionsUrl.html).
  factory TdlibFunction.getEmojiSuggestionsUrl({
    String? language_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "getEmojiSuggestionsUrl",
        "language_code": language_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getEmojiSuggestionsUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCustomEmojiStickers.html).
  factory TdlibFunction.getCustomEmojiStickers({
    List<int>? custom_emoji_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "getCustomEmojiStickers",
        "custom_emoji_ids": custom_emoji_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCustomEmojiStickers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSavedAnimations.html).
  factory TdlibFunction.getSavedAnimations() {
    try {
      return TdlibFunction({
        "@type": "getSavedAnimations",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSavedAnimations",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addSavedAnimation.html).
  factory TdlibFunction.addSavedAnimation({
    TdlibFunction? animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "addSavedAnimation",
        "animation": animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addSavedAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeSavedAnimation.html).
  factory TdlibFunction.removeSavedAnimation({
    TdlibFunction? animation,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeSavedAnimation",
        "animation": animation!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeSavedAnimation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecentInlineBots.html).
  factory TdlibFunction.getRecentInlineBots() {
    try {
      return TdlibFunction({
        "@type": "getRecentInlineBots",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecentInlineBots",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchHashtags.html).
  factory TdlibFunction.searchHashtags({
    String? prefix,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchHashtags",
        "prefix": prefix,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchHashtags",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeRecentHashtag.html).
  factory TdlibFunction.removeRecentHashtag({
    String? hashtag,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeRecentHashtag",
        "hashtag": hashtag,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeRecentHashtag",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getWebPagePreview.html).
  factory TdlibFunction.getWebPagePreview({
    TdlibFunction? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "getWebPagePreview",
        "text": text!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getWebPagePreview",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getWebPageInstantView.html).
  factory TdlibFunction.getWebPageInstantView({
    String? url,
    bool? force_full,
  }) {
    try {
      return TdlibFunction({
        "@type": "getWebPageInstantView",
        "url": url,
        "force_full": force_full,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getWebPageInstantView",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setProfilePhoto.html).
  factory TdlibFunction.setProfilePhoto({
    TdlibFunction? photo,
  }) {
    try {
      return TdlibFunction({
        "@type": "setProfilePhoto",
        "photo": photo!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setProfilePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteProfilePhoto.html).
  factory TdlibFunction.deleteProfilePhoto({
    int? profile_photo_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteProfilePhoto",
        "profile_photo_id": profile_photo_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteProfilePhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setName.html).
  factory TdlibFunction.setName({
    String? first_name,
    String? last_name,
  }) {
    try {
      return TdlibFunction({
        "@type": "setName",
        "first_name": first_name,
        "last_name": last_name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setBio.html).
  factory TdlibFunction.setBio({
    String? bio,
  }) {
    try {
      return TdlibFunction({
        "@type": "setBio",
        "bio": bio,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setBio",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setUsername.html).
  factory TdlibFunction.setUsername({
    String? username,
  }) {
    try {
      return TdlibFunction({
        "@type": "setUsername",
        "username": username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setUsername",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setEmojiStatus.html).
  factory TdlibFunction.setEmojiStatus({
    TdlibFunction? emoji_status,
    int? duration,
  }) {
    try {
      return TdlibFunction({
        "@type": "setEmojiStatus",
        "emoji_status": emoji_status!.toJson(),
        "duration": duration,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setEmojiStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setLocation.html).
  factory TdlibFunction.setLocation({
    TdlibFunction? location,
  }) {
    try {
      return TdlibFunction({
        "@type": "setLocation",
        "location": location!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setLocation",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1changePhoneNumber.html).
  factory TdlibFunction.changePhoneNumber({
    String? phone_number,
    TdlibFunction? settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "changePhoneNumber",
        "phone_number": phone_number,
        "settings": settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method changePhoneNumber",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendChangePhoneNumberCode.html).
  factory TdlibFunction.resendChangePhoneNumberCode() {
    try {
      return TdlibFunction({
        "@type": "resendChangePhoneNumberCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendChangePhoneNumberCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkChangePhoneNumberCode.html).
  factory TdlibFunction.checkChangePhoneNumberCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkChangePhoneNumberCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkChangePhoneNumberCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setCommands.html).
  factory TdlibFunction.setCommands({
    TdlibFunction? scope,
    String? language_code,
    TdlibFunction? commands,
  }) {
    try {
      return TdlibFunction({
        "@type": "setCommands",
        "scope": scope!.toJson(),
        "language_code": language_code,
        "commands": commands!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setCommands",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteCommands.html).
  factory TdlibFunction.deleteCommands({
    TdlibFunction? scope,
    String? language_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteCommands",
        "scope": scope!.toJson(),
        "language_code": language_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteCommands",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCommands.html).
  factory TdlibFunction.getCommands({
    TdlibFunction? scope,
    String? language_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "getCommands",
        "scope": scope!.toJson(),
        "language_code": language_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCommands",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setMenuButton.html).
  factory TdlibFunction.setMenuButton({
    int? user_id,
    TdlibFunction? menu_button,
  }) {
    try {
      return TdlibFunction({
        "@type": "setMenuButton",
        "user_id": user_id,
        "menu_button": menu_button!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setMenuButton",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMenuButton.html).
  factory TdlibFunction.getMenuButton({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMenuButton",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMenuButton",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setDefaultGroupAdministratorRights.html).
  factory TdlibFunction.setDefaultGroupAdministratorRights({
    TdlibFunction? default_group_administrator_rights,
  }) {
    try {
      return TdlibFunction({
        "@type": "setDefaultGroupAdministratorRights",
        "default_group_administrator_rights": default_group_administrator_rights!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setDefaultGroupAdministratorRights",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setDefaultChannelAdministratorRights.html).
  factory TdlibFunction.setDefaultChannelAdministratorRights({
    TdlibFunction? default_channel_administrator_rights,
  }) {
    try {
      return TdlibFunction({
        "@type": "setDefaultChannelAdministratorRights",
        "default_channel_administrator_rights": default_channel_administrator_rights!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setDefaultChannelAdministratorRights",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getActiveSessions.html).
  factory TdlibFunction.getActiveSessions() {
    try {
      return TdlibFunction({
        "@type": "getActiveSessions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getActiveSessions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1terminateSession.html).
  factory TdlibFunction.terminateSession({
    int? session_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "terminateSession",
        "session_id": session_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method terminateSession",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1terminateAllOtherSessions.html).
  factory TdlibFunction.terminateAllOtherSessions() {
    try {
      return TdlibFunction({
        "@type": "terminateAllOtherSessions",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method terminateAllOtherSessions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSessionCanAcceptCalls.html).
  factory TdlibFunction.toggleSessionCanAcceptCalls({
    int? session_id,
    bool? can_accept_calls,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSessionCanAcceptCalls",
        "session_id": session_id,
        "can_accept_calls": can_accept_calls,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSessionCanAcceptCalls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSessionCanAcceptSecretChats.html).
  factory TdlibFunction.toggleSessionCanAcceptSecretChats({
    int? session_id,
    bool? can_accept_secret_chats,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSessionCanAcceptSecretChats",
        "session_id": session_id,
        "can_accept_secret_chats": can_accept_secret_chats,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSessionCanAcceptSecretChats",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setInactiveSessionTtl.html).
  factory TdlibFunction.setInactiveSessionTtl({
    int? inactive_session_ttl_days,
  }) {
    try {
      return TdlibFunction({
        "@type": "setInactiveSessionTtl",
        "inactive_session_ttl_days": inactive_session_ttl_days,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setInactiveSessionTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getConnectedWebsites.html).
  factory TdlibFunction.getConnectedWebsites() {
    try {
      return TdlibFunction({
        "@type": "getConnectedWebsites",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getConnectedWebsites",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1disconnectWebsite.html).
  factory TdlibFunction.disconnectWebsite({
    int? website_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "disconnectWebsite",
        "website_id": website_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method disconnectWebsite",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1disconnectAllWebsites.html).
  factory TdlibFunction.disconnectAllWebsites() {
    try {
      return TdlibFunction({
        "@type": "disconnectAllWebsites",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method disconnectAllWebsites",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setSupergroupUsername.html).
  factory TdlibFunction.setSupergroupUsername({
    int? supergroup_id,
    String? username,
  }) {
    try {
      return TdlibFunction({
        "@type": "setSupergroupUsername",
        "supergroup_id": supergroup_id,
        "username": username,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setSupergroupUsername",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setSupergroupStickerSet.html).
  factory TdlibFunction.setSupergroupStickerSet({
    int? supergroup_id,
    int? sticker_set_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "setSupergroupStickerSet",
        "supergroup_id": supergroup_id,
        "sticker_set_id": sticker_set_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setSupergroupStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSupergroupSignMessages.html).
  factory TdlibFunction.toggleSupergroupSignMessages({
    int? supergroup_id,
    bool? sign_messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSupergroupSignMessages",
        "supergroup_id": supergroup_id,
        "sign_messages": sign_messages,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSupergroupSignMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSupergroupJoinToSendMessages.html).
  factory TdlibFunction.toggleSupergroupJoinToSendMessages({
    int? supergroup_id,
    bool? join_to_send_messages,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSupergroupJoinToSendMessages",
        "supergroup_id": supergroup_id,
        "join_to_send_messages": join_to_send_messages,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSupergroupJoinToSendMessages",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSupergroupJoinByRequest.html).
  factory TdlibFunction.toggleSupergroupJoinByRequest({
    int? supergroup_id,
    bool? join_by_request,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSupergroupJoinByRequest",
        "supergroup_id": supergroup_id,
        "join_by_request": join_by_request,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSupergroupJoinByRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSupergroupIsAllHistoryAvailable.html).
  factory TdlibFunction.toggleSupergroupIsAllHistoryAvailable({
    int? supergroup_id,
    bool? is_all_history_available,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSupergroupIsAllHistoryAvailable",
        "supergroup_id": supergroup_id,
        "is_all_history_available": is_all_history_available,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSupergroupIsAllHistoryAvailable",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1toggleSupergroupIsBroadcastGroup.html).
  factory TdlibFunction.toggleSupergroupIsBroadcastGroup({
    int? supergroup_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "toggleSupergroupIsBroadcastGroup",
        "supergroup_id": supergroup_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method toggleSupergroupIsBroadcastGroup",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reportSupergroupSpam.html).
  factory TdlibFunction.reportSupergroupSpam({
    int? supergroup_id,
    List<int>? message_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "reportSupergroupSpam",
        "supergroup_id": supergroup_id,
        "message_ids": message_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reportSupergroupSpam",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSupergroupMembers.html).
  factory TdlibFunction.getSupergroupMembers({
    int? supergroup_id,
    TdlibFunction? filter,
    int? offset,
    int? limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSupergroupMembers",
        "supergroup_id": supergroup_id,
        "filter": filter!.toJson(),
        "offset": offset,
        "limit": limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSupergroupMembers",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1closeSecretChat.html).
  factory TdlibFunction.closeSecretChat({
    int? secret_chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "closeSecretChat",
        "secret_chat_id": secret_chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method closeSecretChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatEventLog.html).
  factory TdlibFunction.getChatEventLog({
    int? chat_id,
    String? query,
    int? from_event_id,
    int? limit,
    TdlibFunction? filters,
    List<int>? user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatEventLog",
        "chat_id": chat_id,
        "query": query,
        "from_event_id": from_event_id,
        "limit": limit,
        "filters": filters!.toJson(),
        "user_ids": user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatEventLog",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPaymentForm.html).
  factory TdlibFunction.getPaymentForm({
    TdlibFunction? input_invoice,
    TdlibFunction? theme,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPaymentForm",
        "input_invoice": input_invoice!.toJson(),
        "theme": theme!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPaymentForm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1validateOrderInfo.html).
  factory TdlibFunction.validateOrderInfo({
    TdlibFunction? input_invoice,
    TdlibFunction? order_info,
    bool? allow_save,
  }) {
    try {
      return TdlibFunction({
        "@type": "validateOrderInfo",
        "input_invoice": input_invoice!.toJson(),
        "order_info": order_info!.toJson(),
        "allow_save": allow_save,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method validateOrderInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendPaymentForm.html).
  factory TdlibFunction.sendPaymentForm({
    TdlibFunction? input_invoice,
    int? payment_form_id,
    String? order_info_id,
    String? shipping_option_id,
    TdlibFunction? credentials,
    int? tip_amount,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendPaymentForm",
        "input_invoice": input_invoice!.toJson(),
        "payment_form_id": payment_form_id,
        "order_info_id": order_info_id,
        "shipping_option_id": shipping_option_id,
        "credentials": credentials!.toJson(),
        "tip_amount": tip_amount,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendPaymentForm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPaymentReceipt.html).
  factory TdlibFunction.getPaymentReceipt({
    int? chat_id,
    int? message_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPaymentReceipt",
        "chat_id": chat_id,
        "message_id": message_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPaymentReceipt",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSavedOrderInfo.html).
  factory TdlibFunction.getSavedOrderInfo() {
    try {
      return TdlibFunction({
        "@type": "getSavedOrderInfo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSavedOrderInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteSavedOrderInfo.html).
  factory TdlibFunction.deleteSavedOrderInfo() {
    try {
      return TdlibFunction({
        "@type": "deleteSavedOrderInfo",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteSavedOrderInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteSavedCredentials.html).
  factory TdlibFunction.deleteSavedCredentials() {
    try {
      return TdlibFunction({
        "@type": "deleteSavedCredentials",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteSavedCredentials",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createInvoiceLink.html).
  factory TdlibFunction.createInvoiceLink({
    TdlibFunction? invoice,
  }) {
    try {
      return TdlibFunction({
        "@type": "createInvoiceLink",
        "invoice": invoice!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createInvoiceLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSupportUser.html).
  factory TdlibFunction.getSupportUser() {
    try {
      return TdlibFunction({
        "@type": "getSupportUser",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSupportUser",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getBackgrounds.html).
  factory TdlibFunction.getBackgrounds({
    bool? for_dark_theme,
  }) {
    try {
      return TdlibFunction({
        "@type": "getBackgrounds",
        "for_dark_theme": for_dark_theme,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getBackgrounds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getBackgroundUrl.html).
  factory TdlibFunction.getBackgroundUrl({
    String? name,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "getBackgroundUrl",
        "name": name,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getBackgroundUrl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1searchBackground.html).
  factory TdlibFunction.searchBackground({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "searchBackground",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method searchBackground",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setBackground.html).
  factory TdlibFunction.setBackground({
    TdlibFunction? background,
    TdlibFunction? type,
    bool? for_dark_theme,
  }) {
    try {
      return TdlibFunction({
        "@type": "setBackground",
        "background": background!.toJson(),
        "type": type!.toJson(),
        "for_dark_theme": for_dark_theme,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setBackground",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeBackground.html).
  factory TdlibFunction.removeBackground({
    int? background_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeBackground",
        "background_id": background_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeBackground",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetBackgrounds.html).
  factory TdlibFunction.resetBackgrounds() {
    try {
      return TdlibFunction({
        "@type": "resetBackgrounds",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetBackgrounds",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLocalizationTargetInfo.html).
  factory TdlibFunction.getLocalizationTargetInfo({
    bool? only_local,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLocalizationTargetInfo",
        "only_local": only_local,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLocalizationTargetInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLanguagePackInfo.html).
  factory TdlibFunction.getLanguagePackInfo({
    String? language_pack_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLanguagePackInfo",
        "language_pack_id": language_pack_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLanguagePackInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLanguagePackStrings.html).
  factory TdlibFunction.getLanguagePackStrings({
    String? language_pack_id,
    List<String>? keys,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLanguagePackStrings",
        "language_pack_id": language_pack_id,
        "keys": keys,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLanguagePackStrings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1synchronizeLanguagePack.html).
  factory TdlibFunction.synchronizeLanguagePack({
    String? language_pack_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "synchronizeLanguagePack",
        "language_pack_id": language_pack_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method synchronizeLanguagePack",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addCustomServerLanguagePack.html).
  factory TdlibFunction.addCustomServerLanguagePack({
    String? language_pack_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "addCustomServerLanguagePack",
        "language_pack_id": language_pack_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addCustomServerLanguagePack",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setCustomLanguagePack.html).
  factory TdlibFunction.setCustomLanguagePack({
    TdlibFunction? info,
    TdlibFunction? strings,
  }) {
    try {
      return TdlibFunction({
        "@type": "setCustomLanguagePack",
        "info": info!.toJson(),
        "strings": strings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setCustomLanguagePack",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editCustomLanguagePackInfo.html).
  factory TdlibFunction.editCustomLanguagePackInfo({
    TdlibFunction? info,
  }) {
    try {
      return TdlibFunction({
        "@type": "editCustomLanguagePackInfo",
        "info": info!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editCustomLanguagePackInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setCustomLanguagePackString.html).
  factory TdlibFunction.setCustomLanguagePackString({
    String? language_pack_id,
    TdlibFunction? new_string,
  }) {
    try {
      return TdlibFunction({
        "@type": "setCustomLanguagePackString",
        "language_pack_id": language_pack_id,
        "new_string": new_string!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setCustomLanguagePackString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteLanguagePack.html).
  factory TdlibFunction.deleteLanguagePack({
    String? language_pack_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteLanguagePack",
        "language_pack_id": language_pack_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteLanguagePack",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1registerDevice.html).
  factory TdlibFunction.registerDevice({
    TdlibFunction? device_token,
    List<int>? other_user_ids,
  }) {
    try {
      return TdlibFunction({
        "@type": "registerDevice",
        "device_token": device_token!.toJson(),
        "other_user_ids": other_user_ids,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method registerDevice",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1processPushNotification.html).
  factory TdlibFunction.processPushNotification({
    String? payload,
  }) {
    try {
      return TdlibFunction({
        "@type": "processPushNotification",
        "payload": payload,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method processPushNotification",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPushReceiverId.html).
  factory TdlibFunction.getPushReceiverId({
    String? payload,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPushReceiverId",
        "payload": payload,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPushReceiverId",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getRecentlyVisitedTMeUrls.html).
  factory TdlibFunction.getRecentlyVisitedTMeUrls({
    String? referrer,
  }) {
    try {
      return TdlibFunction({
        "@type": "getRecentlyVisitedTMeUrls",
        "referrer": referrer,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getRecentlyVisitedTMeUrls",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setUserPrivacySettingRules.html).
  factory TdlibFunction.setUserPrivacySettingRules({
    TdlibFunction? setting,
    TdlibFunction? rules,
  }) {
    try {
      return TdlibFunction({
        "@type": "setUserPrivacySettingRules",
        "setting": setting!.toJson(),
        "rules": rules!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setUserPrivacySettingRules",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getUserPrivacySettingRules.html).
  factory TdlibFunction.getUserPrivacySettingRules({
    TdlibFunction? setting,
  }) {
    try {
      return TdlibFunction({
        "@type": "getUserPrivacySettingRules",
        "setting": setting!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getUserPrivacySettingRules",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getOption.html).
  factory TdlibFunction.getOption({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "getOption",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setOption.html).
  factory TdlibFunction.setOption({
    String? name,
    TdlibFunction? value,
  }) {
    try {
      return TdlibFunction({
        "@type": "setOption",
        "name": name,
        "value": value!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setOption",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setAccountTtl.html).
  factory TdlibFunction.setAccountTtl({
    TdlibFunction? ttl,
  }) {
    try {
      return TdlibFunction({
        "@type": "setAccountTtl",
        "ttl": ttl!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setAccountTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAccountTtl.html).
  factory TdlibFunction.getAccountTtl() {
    try {
      return TdlibFunction({
        "@type": "getAccountTtl",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAccountTtl",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deleteAccount.html).
  factory TdlibFunction.deleteAccount({
    String? reason,
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "deleteAccount",
        "reason": reason,
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deleteAccount",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeChatActionBar.html).
  factory TdlibFunction.removeChatActionBar({
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeChatActionBar",
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeChatActionBar",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reportChat.html).
  factory TdlibFunction.reportChat({
    int? chat_id,
    List<int>? message_ids,
    TdlibFunction? reason,
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "reportChat",
        "chat_id": chat_id,
        "message_ids": message_ids,
        "reason": reason!.toJson(),
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reportChat",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reportChatPhoto.html).
  factory TdlibFunction.reportChatPhoto({
    int? chat_id,
    int? file_id,
    TdlibFunction? reason,
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "reportChatPhoto",
        "chat_id": chat_id,
        "file_id": file_id,
        "reason": reason!.toJson(),
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reportChatPhoto",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1reportMessageReactions.html).
  factory TdlibFunction.reportMessageReactions({
    int? chat_id,
    int? message_id,
    TdlibFunction? sender_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "reportMessageReactions",
        "chat_id": chat_id,
        "message_id": message_id,
        "sender_id": sender_id!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method reportMessageReactions",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getChatStatistics.html).
  factory TdlibFunction.getChatStatistics({
    int? chat_id,
    bool? is_dark,
  }) {
    try {
      return TdlibFunction({
        "@type": "getChatStatistics",
        "chat_id": chat_id,
        "is_dark": is_dark,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getChatStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMessageStatistics.html).
  factory TdlibFunction.getMessageStatistics({
    int? chat_id,
    int? message_id,
    bool? is_dark,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMessageStatistics",
        "chat_id": chat_id,
        "message_id": message_id,
        "is_dark": is_dark,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMessageStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getStatisticalGraph.html).
  factory TdlibFunction.getStatisticalGraph({
    int? chat_id,
    String? token,
    int? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "getStatisticalGraph",
        "chat_id": chat_id,
        "token": token,
        "x": x,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getStatisticalGraph",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getStorageStatistics.html).
  factory TdlibFunction.getStorageStatistics({
    int? chat_limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "getStorageStatistics",
        "chat_limit": chat_limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getStorageStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getStorageStatisticsFast.html).
  factory TdlibFunction.getStorageStatisticsFast() {
    try {
      return TdlibFunction({
        "@type": "getStorageStatisticsFast",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getStorageStatisticsFast",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getDatabaseStatistics.html).
  factory TdlibFunction.getDatabaseStatistics() {
    try {
      return TdlibFunction({
        "@type": "getDatabaseStatistics",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getDatabaseStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1optimizeStorage.html).
  factory TdlibFunction.optimizeStorage({
    int? size,
    int? ttl,
    int? count,
    int? immunity_delay,
    TdlibFunction? file_types,
    List<int>? chat_ids,
    List<int>? exclude_chat_ids,
    bool? return_deleted_file_statistics,
    int? chat_limit,
  }) {
    try {
      return TdlibFunction({
        "@type": "optimizeStorage",
        "size": size,
        "ttl": ttl,
        "count": count,
        "immunity_delay": immunity_delay,
        "file_types": file_types!.toJson(),
        "chat_ids": chat_ids,
        "exclude_chat_ids": exclude_chat_ids,
        "return_deleted_file_statistics": return_deleted_file_statistics,
        "chat_limit": chat_limit,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method optimizeStorage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setNetworkType.html).
  factory TdlibFunction.setNetworkType({
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "setNetworkType",
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setNetworkType",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getNetworkStatistics.html).
  factory TdlibFunction.getNetworkStatistics({
    bool? only_current,
  }) {
    try {
      return TdlibFunction({
        "@type": "getNetworkStatistics",
        "only_current": only_current,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getNetworkStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addNetworkStatistics.html).
  factory TdlibFunction.addNetworkStatistics({
    TdlibFunction? entry,
  }) {
    try {
      return TdlibFunction({
        "@type": "addNetworkStatistics",
        "entry": entry!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addNetworkStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resetNetworkStatistics.html).
  factory TdlibFunction.resetNetworkStatistics() {
    try {
      return TdlibFunction({
        "@type": "resetNetworkStatistics",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resetNetworkStatistics",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAutoDownloadSettingsPresets.html).
  factory TdlibFunction.getAutoDownloadSettingsPresets() {
    try {
      return TdlibFunction({
        "@type": "getAutoDownloadSettingsPresets",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAutoDownloadSettingsPresets",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setAutoDownloadSettings.html).
  factory TdlibFunction.setAutoDownloadSettings({
    TdlibFunction? settings,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "setAutoDownloadSettings",
        "settings": settings!.toJson(),
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setAutoDownloadSettings",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getBankCardInfo.html).
  factory TdlibFunction.getBankCardInfo({
    String? bank_card_number,
  }) {
    try {
      return TdlibFunction({
        "@type": "getBankCardInfo",
        "bank_card_number": bank_card_number,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getBankCardInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPassportElement.html).
  factory TdlibFunction.getPassportElement({
    TdlibFunction? type,
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPassportElement",
        "type": type!.toJson(),
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPassportElement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getAllPassportElements.html).
  factory TdlibFunction.getAllPassportElements({
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "getAllPassportElements",
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getAllPassportElements",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setPassportElement.html).
  factory TdlibFunction.setPassportElement({
    TdlibFunction? element,
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "setPassportElement",
        "element": element!.toJson(),
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setPassportElement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1deletePassportElement.html).
  factory TdlibFunction.deletePassportElement({
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "deletePassportElement",
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method deletePassportElement",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setPassportElementErrors.html).
  factory TdlibFunction.setPassportElementErrors({
    int? user_id,
    TdlibFunction? errors,
  }) {
    try {
      return TdlibFunction({
        "@type": "setPassportElementErrors",
        "user_id": user_id,
        "errors": errors!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setPassportElementErrors",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPreferredCountryLanguage.html).
  factory TdlibFunction.getPreferredCountryLanguage({
    String? country_code,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPreferredCountryLanguage",
        "country_code": country_code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPreferredCountryLanguage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendPhoneNumberVerificationCode.html).
  factory TdlibFunction.sendPhoneNumberVerificationCode({
    String? phone_number,
    TdlibFunction? settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendPhoneNumberVerificationCode",
        "phone_number": phone_number,
        "settings": settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendPhoneNumberVerificationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendPhoneNumberVerificationCode.html).
  factory TdlibFunction.resendPhoneNumberVerificationCode() {
    try {
      return TdlibFunction({
        "@type": "resendPhoneNumberVerificationCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendPhoneNumberVerificationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkPhoneNumberVerificationCode.html).
  factory TdlibFunction.checkPhoneNumberVerificationCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkPhoneNumberVerificationCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkPhoneNumberVerificationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendEmailAddressVerificationCode.html).
  factory TdlibFunction.sendEmailAddressVerificationCode({
    String? email_address,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendEmailAddressVerificationCode",
        "email_address": email_address,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendEmailAddressVerificationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendEmailAddressVerificationCode.html).
  factory TdlibFunction.resendEmailAddressVerificationCode() {
    try {
      return TdlibFunction({
        "@type": "resendEmailAddressVerificationCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendEmailAddressVerificationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkEmailAddressVerificationCode.html).
  factory TdlibFunction.checkEmailAddressVerificationCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkEmailAddressVerificationCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkEmailAddressVerificationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPassportAuthorizationForm.html).
  factory TdlibFunction.getPassportAuthorizationForm({
    int? bot_user_id,
    String? scope,
    String? public_key,
    String? nonce,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPassportAuthorizationForm",
        "bot_user_id": bot_user_id,
        "scope": scope,
        "public_key": public_key,
        "nonce": nonce,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPassportAuthorizationForm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPassportAuthorizationFormAvailableElements.html).
  factory TdlibFunction.getPassportAuthorizationFormAvailableElements({
    int? autorization_form_id,
    String? password,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPassportAuthorizationFormAvailableElements",
        "autorization_form_id": autorization_form_id,
        "password": password,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPassportAuthorizationFormAvailableElements",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendPassportAuthorizationForm.html).
  factory TdlibFunction.sendPassportAuthorizationForm({
    int? autorization_form_id,
    TdlibFunction? types,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendPassportAuthorizationForm",
        "autorization_form_id": autorization_form_id,
        "types": types!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendPassportAuthorizationForm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendPhoneNumberConfirmationCode.html).
  factory TdlibFunction.sendPhoneNumberConfirmationCode({
    String? hash,
    String? phone_number,
    TdlibFunction? settings,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendPhoneNumberConfirmationCode",
        "hash": hash,
        "phone_number": phone_number,
        "settings": settings!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendPhoneNumberConfirmationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1resendPhoneNumberConfirmationCode.html).
  factory TdlibFunction.resendPhoneNumberConfirmationCode() {
    try {
      return TdlibFunction({
        "@type": "resendPhoneNumberConfirmationCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method resendPhoneNumberConfirmationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkPhoneNumberConfirmationCode.html).
  factory TdlibFunction.checkPhoneNumberConfirmationCode({
    String? code,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkPhoneNumberConfirmationCode",
        "code": code,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkPhoneNumberConfirmationCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setBotUpdatesStatus.html).
  factory TdlibFunction.setBotUpdatesStatus({
    int? pending_update_count,
    String? error_message,
  }) {
    try {
      return TdlibFunction({
        "@type": "setBotUpdatesStatus",
        "pending_update_count": pending_update_count,
        "error_message": error_message,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setBotUpdatesStatus",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1uploadStickerFile.html).
  factory TdlibFunction.uploadStickerFile({
    int? user_id,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "uploadStickerFile",
        "user_id": user_id,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method uploadStickerFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getSuggestedStickerSetName.html).
  factory TdlibFunction.getSuggestedStickerSetName({
    String? title,
  }) {
    try {
      return TdlibFunction({
        "@type": "getSuggestedStickerSetName",
        "title": title,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getSuggestedStickerSetName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1checkStickerSetName.html).
  factory TdlibFunction.checkStickerSetName({
    String? name,
  }) {
    try {
      return TdlibFunction({
        "@type": "checkStickerSetName",
        "name": name,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method checkStickerSetName",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1createNewStickerSet.html).
  factory TdlibFunction.createNewStickerSet({
    int? user_id,
    String? title,
    String? name,
    TdlibFunction? sticker_type,
    TdlibFunction? stickers,
    String? source,
  }) {
    try {
      return TdlibFunction({
        "@type": "createNewStickerSet",
        "user_id": user_id,
        "title": title,
        "name": name,
        "sticker_type": sticker_type!.toJson(),
        "stickers": stickers!.toJson(),
        "source": source,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method createNewStickerSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addStickerToSet.html).
  factory TdlibFunction.addStickerToSet({
    int? user_id,
    String? name,
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "addStickerToSet",
        "user_id": user_id,
        "name": name,
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addStickerToSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setStickerSetThumbnail.html).
  factory TdlibFunction.setStickerSetThumbnail({
    int? user_id,
    String? name,
    TdlibFunction? thumbnail,
  }) {
    try {
      return TdlibFunction({
        "@type": "setStickerSetThumbnail",
        "user_id": user_id,
        "name": name,
        "thumbnail": thumbnail!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setStickerSetThumbnail",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setStickerPositionInSet.html).
  factory TdlibFunction.setStickerPositionInSet({
    TdlibFunction? sticker,
    int? position,
  }) {
    try {
      return TdlibFunction({
        "@type": "setStickerPositionInSet",
        "sticker": sticker!.toJson(),
        "position": position,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setStickerPositionInSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeStickerFromSet.html).
  factory TdlibFunction.removeStickerFromSet({
    TdlibFunction? sticker,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeStickerFromSet",
        "sticker": sticker!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeStickerFromSet",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getMapThumbnailFile.html).
  factory TdlibFunction.getMapThumbnailFile({
    TdlibFunction? location,
    int? zoom,
    int? width,
    int? height,
    int? scale,
    int? chat_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getMapThumbnailFile",
        "location": location!.toJson(),
        "zoom": zoom,
        "width": width,
        "height": height,
        "scale": scale,
        "chat_id": chat_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getMapThumbnailFile",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPremiumLimit.html).
  factory TdlibFunction.getPremiumLimit({
    TdlibFunction? limit_type,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPremiumLimit",
        "limit_type": limit_type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPremiumLimit",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPremiumFeatures.html).
  factory TdlibFunction.getPremiumFeatures({
    TdlibFunction? source,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPremiumFeatures",
        "source": source!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPremiumFeatures",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPremiumStickerExamples.html).
  factory TdlibFunction.getPremiumStickerExamples() {
    try {
      return TdlibFunction({
        "@type": "getPremiumStickerExamples",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPremiumStickerExamples",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1viewPremiumFeature.html).
  factory TdlibFunction.viewPremiumFeature({
    TdlibFunction? feature,
  }) {
    try {
      return TdlibFunction({
        "@type": "viewPremiumFeature",
        "feature": feature!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method viewPremiumFeature",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1clickPremiumSubscriptionButton.html).
  factory TdlibFunction.clickPremiumSubscriptionButton() {
    try {
      return TdlibFunction({
        "@type": "clickPremiumSubscriptionButton",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method clickPremiumSubscriptionButton",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPremiumState.html).
  factory TdlibFunction.getPremiumState() {
    try {
      return TdlibFunction({
        "@type": "getPremiumState",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPremiumState",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1canPurchasePremium.html).
  factory TdlibFunction.canPurchasePremium({
    TdlibFunction? purpose,
  }) {
    try {
      return TdlibFunction({
        "@type": "canPurchasePremium",
        "purpose": purpose!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method canPurchasePremium",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1assignAppStoreTransaction.html).
  factory TdlibFunction.assignAppStoreTransaction({
    TdlibFunction? receipt,
    TdlibFunction? purpose,
  }) {
    try {
      return TdlibFunction({
        "@type": "assignAppStoreTransaction",
        "receipt": receipt!.toJson(),
        "purpose": purpose!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method assignAppStoreTransaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1assignGooglePlayTransaction.html).
  factory TdlibFunction.assignGooglePlayTransaction({
    String? package_name,
    String? store_product_id,
    String? purchase_token,
    TdlibFunction? purpose,
  }) {
    try {
      return TdlibFunction({
        "@type": "assignGooglePlayTransaction",
        "package_name": package_name,
        "store_product_id": store_product_id,
        "purchase_token": purchase_token,
        "purpose": purpose!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method assignGooglePlayTransaction",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1acceptTermsOfService.html).
  factory TdlibFunction.acceptTermsOfService({
    String? terms_of_service_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "acceptTermsOfService",
        "terms_of_service_id": terms_of_service_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method acceptTermsOfService",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1sendCustomRequest.html).
  factory TdlibFunction.sendCustomRequest({
    String? method,
    String? parameters,
  }) {
    try {
      return TdlibFunction({
        "@type": "sendCustomRequest",
        "method": method,
        "parameters": parameters,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method sendCustomRequest",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1answerCustomQuery.html).
  factory TdlibFunction.answerCustomQuery({
    int? custom_query_id,
    String? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "answerCustomQuery",
        "custom_query_id": custom_query_id,
        "data": data,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method answerCustomQuery",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setAlarm.html).
  factory TdlibFunction.setAlarm({
    double? seconds,
  }) {
    try {
      return TdlibFunction({
        "@type": "setAlarm",
        "seconds": seconds,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setAlarm",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCountries.html).
  factory TdlibFunction.getCountries() {
    try {
      return TdlibFunction({
        "@type": "getCountries",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCountries",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getCountryCode.html).
  factory TdlibFunction.getCountryCode() {
    try {
      return TdlibFunction({
        "@type": "getCountryCode",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getCountryCode",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPhoneNumberInfo.html).
  factory TdlibFunction.getPhoneNumberInfo({
    String? phone_number_prefix,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPhoneNumberInfo",
        "phone_number_prefix": phone_number_prefix,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPhoneNumberInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getPhoneNumberInfoSync.html).
  factory TdlibFunction.getPhoneNumberInfoSync({
    String? language_code,
    String? phone_number_prefix,
  }) {
    try {
      return TdlibFunction({
        "@type": "getPhoneNumberInfoSync",
        "language_code": language_code,
        "phone_number_prefix": phone_number_prefix,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getPhoneNumberInfoSync",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getApplicationDownloadLink.html).
  factory TdlibFunction.getApplicationDownloadLink() {
    try {
      return TdlibFunction({
        "@type": "getApplicationDownloadLink",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getApplicationDownloadLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getDeepLinkInfo.html).
  factory TdlibFunction.getDeepLinkInfo({
    String? link,
  }) {
    try {
      return TdlibFunction({
        "@type": "getDeepLinkInfo",
        "link": link,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getDeepLinkInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getApplicationConfig.html).
  factory TdlibFunction.getApplicationConfig() {
    try {
      return TdlibFunction({
        "@type": "getApplicationConfig",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getApplicationConfig",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1saveApplicationLogEvent.html).
  factory TdlibFunction.saveApplicationLogEvent({
    String? type,
    int? chat_id,
    TdlibFunction? data,
  }) {
    try {
      return TdlibFunction({
        "@type": "saveApplicationLogEvent",
        "type": type,
        "chat_id": chat_id,
        "data": data!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method saveApplicationLogEvent",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addProxy.html).
  factory TdlibFunction.addProxy({
    String? server,
    int? port,
    bool? enable,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "addProxy",
        "server": server,
        "port": port,
        "enable": enable,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1editProxy.html).
  factory TdlibFunction.editProxy({
    int? proxy_id,
    String? server,
    int? port,
    bool? enable,
    TdlibFunction? type,
  }) {
    try {
      return TdlibFunction({
        "@type": "editProxy",
        "proxy_id": proxy_id,
        "server": server,
        "port": port,
        "enable": enable,
        "type": type!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method editProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1enableProxy.html).
  factory TdlibFunction.enableProxy({
    int? proxy_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "enableProxy",
        "proxy_id": proxy_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method enableProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1disableProxy.html).
  factory TdlibFunction.disableProxy() {
    try {
      return TdlibFunction({
        "@type": "disableProxy",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method disableProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1removeProxy.html).
  factory TdlibFunction.removeProxy({
    int? proxy_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "removeProxy",
        "proxy_id": proxy_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method removeProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getProxies.html).
  factory TdlibFunction.getProxies() {
    try {
      return TdlibFunction({
        "@type": "getProxies",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getProxies",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getProxyLink.html).
  factory TdlibFunction.getProxyLink({
    int? proxy_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getProxyLink",
        "proxy_id": proxy_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getProxyLink",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1pingProxy.html).
  factory TdlibFunction.pingProxy({
    int? proxy_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "pingProxy",
        "proxy_id": proxy_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method pingProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setLogStream.html).
  factory TdlibFunction.setLogStream({
    TdlibFunction? log_stream,
  }) {
    try {
      return TdlibFunction({
        "@type": "setLogStream",
        "log_stream": log_stream!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setLogStream",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLogStream.html).
  factory TdlibFunction.getLogStream() {
    try {
      return TdlibFunction({
        "@type": "getLogStream",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLogStream",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setLogVerbosityLevel.html).
  factory TdlibFunction.setLogVerbosityLevel({
    int? new_verbosity_level,
  }) {
    try {
      return TdlibFunction({
        "@type": "setLogVerbosityLevel",
        "new_verbosity_level": new_verbosity_level,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setLogVerbosityLevel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLogVerbosityLevel.html).
  factory TdlibFunction.getLogVerbosityLevel() {
    try {
      return TdlibFunction({
        "@type": "getLogVerbosityLevel",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLogVerbosityLevel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLogTags.html).
  factory TdlibFunction.getLogTags() {
    try {
      return TdlibFunction({
        "@type": "getLogTags",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLogTags",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setLogTagVerbosityLevel.html).
  factory TdlibFunction.setLogTagVerbosityLevel({
    String? tag,
    int? new_verbosity_level,
  }) {
    try {
      return TdlibFunction({
        "@type": "setLogTagVerbosityLevel",
        "tag": tag,
        "new_verbosity_level": new_verbosity_level,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setLogTagVerbosityLevel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getLogTagVerbosityLevel.html).
  factory TdlibFunction.getLogTagVerbosityLevel({
    String? tag,
  }) {
    try {
      return TdlibFunction({
        "@type": "getLogTagVerbosityLevel",
        "tag": tag,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getLogTagVerbosityLevel",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1addLogMessage.html).
  factory TdlibFunction.addLogMessage({
    int? verbosity_level,
    String? text,
  }) {
    try {
      return TdlibFunction({
        "@type": "addLogMessage",
        "verbosity_level": verbosity_level,
        "text": text,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method addLogMessage",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1getUserSupportInfo.html).
  factory TdlibFunction.getUserSupportInfo({
    int? user_id,
  }) {
    try {
      return TdlibFunction({
        "@type": "getUserSupportInfo",
        "user_id": user_id,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method getUserSupportInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1setUserSupportInfo.html).
  factory TdlibFunction.setUserSupportInfo({
    int? user_id,
    TdlibFunction? message,
  }) {
    try {
      return TdlibFunction({
        "@type": "setUserSupportInfo",
        "user_id": user_id,
        "message": message!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method setUserSupportInfo",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallEmpty.html).
  factory TdlibFunction.testCallEmpty() {
    try {
      return TdlibFunction({
        "@type": "testCallEmpty",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallEmpty",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallString.html).
  factory TdlibFunction.testCallString({
    String? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testCallString",
        "x": x,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallBytes.html).
  factory TdlibFunction.testCallBytes({
    TdlibFunction? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testCallBytes",
        "x": x!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallBytes",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallVectorInt.html).
  factory TdlibFunction.testCallVectorInt({
    List<int>? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testCallVectorInt",
        "x": x,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallVectorInt",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallVectorIntObject.html).
  factory TdlibFunction.testCallVectorIntObject({
    TdlibFunction? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testCallVectorIntObject",
        "x": x!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallVectorIntObject",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallVectorString.html).
  factory TdlibFunction.testCallVectorString({
    List<String>? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testCallVectorString",
        "x": x,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallVectorString",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testCallVectorStringObject.html).
  factory TdlibFunction.testCallVectorStringObject({
    TdlibFunction? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testCallVectorStringObject",
        "x": x!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testCallVectorStringObject",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testSquareInt.html).
  factory TdlibFunction.testSquareInt({
    int? x,
  }) {
    try {
      return TdlibFunction({
        "@type": "testSquareInt",
        "x": x,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testSquareInt",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testNetwork.html).
  factory TdlibFunction.testNetwork() {
    try {
      return TdlibFunction({
        "@type": "testNetwork",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testNetwork",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testProxy.html).
  factory TdlibFunction.testProxy({
    String? server,
    int? port,
    TdlibFunction? type,
    int? dc_id,
    double? timeout,
  }) {
    try {
      return TdlibFunction({
        "@type": "testProxy",
        "server": server,
        "port": port,
        "type": type!.toJson(),
        "dc_id": dc_id,
        "timeout": timeout,
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testProxy",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testGetDifference.html).
  factory TdlibFunction.testGetDifference() {
    try {
      return TdlibFunction({
        "@type": "testGetDifference",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testGetDifference",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testUseUpdate.html).
  factory TdlibFunction.testUseUpdate() {
    try {
      return TdlibFunction({
        "@type": "testUseUpdate",
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testUseUpdate",
      });
    }
  }

  /// Tdlib Api methods full check [Tdlib-Functions](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1testReturnError.html).
  factory TdlibFunction.testReturnError({
    TdlibFunction? error,
  }) {
    try {
      return TdlibFunction({
        "@type": "testReturnError",
        "error": error!.toJson(),
      });
    } catch (e) {
      return TdlibFunction({
        "@type": "error",
        "error": "${e}",
        "message": "error method testReturnError",
      });
    }
  }

  Map toMap() {
    return rawData;
  }

  Map toJson() {
    return rawData;
  }
   
}
