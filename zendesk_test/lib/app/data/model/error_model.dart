class ErrorResponseModel {
  final String? resource;
  final String? action;

  final String? type;
  final String? subject;
  final int statusCode;
  final String reason;
  final String? message;
  final String? fullErrorText;

  ErrorResponseModel({
    this.resource,
    this.action,
    this.type,
    this.subject,
    required this.statusCode,
    required this.reason,
    required this.message,
    this.fullErrorText,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      resource: json['resource'] ?? '',
      action: json['action'] ?? '',
      type: json['type'] ?? '',
      subject: json['subject'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      reason: json['reason'] ?? '',
      message: json['message'] ?? '',
    );
  }
  String getErrorKey() {
    return '${resource}_${action}_${subject}_$reason';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resource'] = resource;
    data['action'] = action;
    data['type'] = type;
    data['subject'] = subject;
    data['statusCode'] = statusCode;
    data['reason'] = reason;
    data['message'] = message;
    return data;
  }
}

class InvalidToken extends ErrorResponseModel {
  InvalidToken({required super.message})
      : super(
            statusCode: 401,
            reason: "error_unauthorize",
            fullErrorText: "JWT_VALIDATE_TOKEN_INVALID");
}

class ExpireToken extends ErrorResponseModel {
  ExpireToken({required super.message})
      : super(
            statusCode: 401,
            reason: "JWT_VALIDATE_TOKEN_EXPIRE",
            fullErrorText: "JWT_VALIDATE_TOKEN_EXPIRE");
}

class InternetConnectionError extends ErrorResponseModel {
  InternetConnectionError()
      : super(
            statusCode: 404,
            reason: "internet_error_msg",
            message: "internet_error_msg",
            fullErrorText: "internet_error_msg");
}

class TooManyRequests extends ErrorResponseModel {
  TooManyRequests({required super.message})
      : super(
            statusCode: 429,
            reason: "TOO_MANY_REQUESTS",
            fullErrorText: "*_*_*_TOO_MANY_REQUESTS");
}

class AppMustUpdateError extends ErrorResponseModel {
  AppMustUpdateError({required super.message})
      : super(
            statusCode: 429,
            reason: "APP_UPDATER_UPDATE_APP_REQUIRED",
            fullErrorText: "APP_UPDATER_UPDATE_APP_REQUIRED");
}

class RequestBodyTooLargError extends ErrorResponseModel {
  RequestBodyTooLargError({required super.message})
      : super(
            statusCode: 429,
            reason: "*_*_*_PAYLOAD_TOO_LARGE",
            fullErrorText: "*_*_*_PAYLOAD_TOO_LARGE");
}

class OtpInvalidError extends ErrorResponseModel {
  OtpInvalidError({required super.message})
      : super(
            statusCode: 429,
            reason: "OTP_*_*_INVALID",
            fullErrorText: "OTP_*_*_INVALID");
}

class OtpAleradySent extends ErrorResponseModel {
  OtpAleradySent({required super.message})
      : super(
            statusCode: 429,
            reason: "OTP_*_*_CONFLICT",
            fullErrorText: "OTP_*_*_CONFLICT");
}

class CredentialsInvalidError extends ErrorResponseModel {
  CredentialsInvalidError({required super.message})
      : super(
            statusCode: 429,
            reason: "CREDENTIALS_*_*_INVALID",
            fullErrorText: "CREDENTIALS_*_*_INVALID");
}

class PhoneExistError extends ErrorResponseModel {
  PhoneExistError({required super.message})
      : super(
            statusCode: 429,
            reason: "PHONE_*_*_EXISTS",
            fullErrorText: "PHONE_*_*_EXISTS");
}

class UserInactiveError extends ErrorResponseModel {
  UserInactiveError({required super.message})
      : super(
            statusCode: 429,
            reason: "USER_*_*_INACTIVE ",
            fullErrorText: "USER_*_*_INACTIVE ");
}

class ServerError extends ErrorResponseModel {
  ServerError()
      : super(statusCode: 500, reason: "server_error", message: "server_error");
}

class InvalidInput extends ErrorResponseModel {
  InvalidInput({super.subject, required super.message})
      : super(statusCode: 400, reason: "invalidInput");
}

class UnAuthorizeError extends ErrorResponseModel {
  UnAuthorizeError({required super.message})
      : super(
          statusCode: 401,
          reason: "error_unauthorize",
        );
}

class NotFoundResponse extends ErrorResponseModel {
  NotFoundResponse({required super.message})
      : super(
          statusCode: 404,
          reason: "endpoit_notfound",
        );
}









// USER_*_*_INACTIVE                   // user is inactive
// FORENSICS_FACE_DETECTION_*_FAILED   // face detection failed
// FORENSICS_FACE_MATCHING_*_FAILED    // face matching failed
// FORENSICS_LIVENESS_CHECK_*_FAILED   // liveness check failed
// CARD_*_*_CONFLICT                   // card already claimed


