import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:zendesk_test/app/data/model/error_model.dart';
import 'package:zendesk_test/utils/extention.dart';
import 'package:zendesk_test/utils/network/data_state.dart';
import 'package:zendesk_test/utils/network/network_handle_error.dart';

@lazySingleton
class DioClient {
  Dio instance(String? url) {
    var dio = Dio();

    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['app-platform-type'] = Platform.isAndroid
        ? "ANDROID"
        : Platform.isIOS
            ? "IOS"
            : "OTHER";

    return dio;
  }
}

extension ApiCallHandler<T> on Future<Response<dynamic>> {
  Future<DataState<T>> result<T>(
      T Function(Map<String, dynamic> json) dataType) async {
    try {
      final data = await this;
      // L.error(name: "s", msg: data.data.toString());
      return DataSuccess(dataType(data.data["data"]));
    } on DioError catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      kdp(name: "Exaption: ", msg: error, c: "r");
      await Sentry.captureException(
        error,
        stackTrace: error,
      );
      return DataFailed(InternetConnectionError());
    }
  }

  Future<DataState<T>> resultWithList<T>(
      T Function(List<dynamic> json) dataType) async {
    try {
      final data = await this;
      //   kdp(name: "datafadf", msg: jsonEncode(data.data), c: "gr");

      return DataSuccess(dataType(data.data["data"]));
    } on DioError catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      return DataFailed(InternetConnectionError());
    }
  }

  Future<DataState<T>> resultWithoutData<T>(
      T Function(Map<String, dynamic> json) dataType) async {
    try {
      final data = await this;
      // kdp(name: "resultWithoutData", msg: jsonEncode(data.data), c: "m");

      return DataSuccess(dataType(data.data));
    } on DioError catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      return DataFailed(InternetConnectionError());
    }
  }

  Future<DataState<T>> resultWithTypeResponse<T, RT>(
      Function(RT json) dataType) async {
    try {
      final data = await this;
      // L.success(name: "s", msg: data.data.toString());
      return DataSuccess(dataType(data.data["data"] as RT));
    } on DioError catch (dioError) {
      return NetworkHandler.getDataFailed<T>(dioError);
    } catch (error) {
      kdp(name: "Exaption: ", msg: error, c: "r");
      await Sentry.captureException(
        error,
        stackTrace: error,
      );
      return DataFailed(InternetConnectionError());
    }
  }
}
