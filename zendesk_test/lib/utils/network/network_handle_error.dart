import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:zendesk_test/app/data/model/error_model.dart';
import 'package:zendesk_test/app/presintation/alert_dialog.dart';
import 'package:zendesk_test/utils/extention.dart';
import 'package:zendesk_test/utils/network/data_state.dart';

class NetworkHandler<T> {
  static DataState<T> getDataFailed<T>(
    DioError dioError,
  ) {
    if (dioError.type == DioErrorType.other &&
        dioError.error is SocketException &&
        (dioError.error as SocketException).osError?.message ==
            "Network is unreachable") {
      return DataFailed<T>(InternetConnectionError());
    }

    if (dioError.type == DioErrorType.other &&
        dioError.error is SocketException &&
        (dioError.error as SocketException).osError?.message ==
            "Connection refused") {
      return DataFailed<T>(ServerError());
    }
    if (dioError.type == DioErrorType.other ||
        dioError.type == DioErrorType.connectTimeout ||
        dioError.type == DioErrorType.receiveTimeout ||
        dioError.type == DioErrorType.sendTimeout) {
      return DataFailed<T>(InternetConnectionError());
    }

    errorLog(dioError);
    final error = dioError.response?.data == null
        ? null
        : ErrorResponseModel.fromJson(dioError.response?.data);
    return DataFailed(error!);
  }

  static handdleRequestExceptionMessages(DataFailed result,
      {String? cridentialError}) {
    if (result.error is CredentialsInvalidError && cridentialError != null) {
      showTMDialog(
        title: "fail",
        msg: cridentialError,
        icon: const Icon(
          FeatherIcons.alertTriangle,
          color: Colors.red,
        ),
      );
      return;
    }
    showTMDialog(
      title: "fail",
      msg: result.error?.message ?? "unknown_error",
      icon: const Icon(
        FeatherIcons.alertTriangle,
        color: Colors.red,
      ),
    );
  }
}

void errorLog(DioError dioError, {String? T}) {
  Map<String, dynamic> req = {};

  try {
    req = (dioError.requestOptions.data as Map<String, dynamic>);
  } catch (_) {}
  try {
    req["frontSide"] = (req["frontSide"] as String).length.toString();
    req["backSide"] = req["backSide"].length.toString();
    req["embeddedFace"] = req["embeddedFace"].length.toString();
  } catch (_) {}

  Map<String, dynamic> response = {};
  try {
    response = (dioError.response?.data as Map<String, dynamic>);
  } catch (_) {}
  try {
    response["frontSide"] = (response["frontSide"] as String).length;
    response["backSide"] = response["backSide"].length;
    response["embeddedFace"] = response["embeddedFace"].length;
  } catch (_) {}

  kdp(
      name: "dioError",
      msg: 'endpoint:${dioError.requestOptions.path}',
      c: 'r');
  kdp(name: " ", msg: 'error: $response', c: 'r');
  kdp(name: "", msg: ' datatype: $T bodyrequest: $req', c: 'cy');
}
