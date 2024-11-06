import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zendesk_messaging/zendesk_messaging.dart';
import 'package:zendesk_test/app/data/model/error_model.dart';
import 'package:zendesk_test/utils/extention.dart';
import 'package:zendesk_test/utils/network/data_state.dart';

abstract class BaseZendeskDataSource {
  // Future<DataState> isInitialized();
  void initZendeskMessaging({required Function(DataState) onComplete});
  Future<void> login(
      {required String zendeskToken, required Function(DataState) onEvent});

  Future<DataState> showChat();
  Future<void> closeOldTicket();
  Future<bool> isUserLogin();
  // void initOnDone({required Function(DataState<bool>) onEvent});
}

@LazySingleton(as: BaseZendeskDataSource)
class ZendeskDataSource extends BaseZendeskDataSource {
  static Dio instans = Dio();

  @override
  Future<void> closeOldTicket() async {
    kdp(name: "closeOldTicket ", msg: "closeOldTicket==", c: 'r');
    try {
      await ZendeskMessaging.logoutUserCallbacks(
        onSuccess: () {
          kdp(name: "closeOldTicket ", msg: "onSuccess", c: 'gr');
        },
        onFailure: () {
          kdp(name: "closeOldTicket ", msg: "onFailure", c: 'r');
        },
      );
    } catch (e) {
      kdp(name: "closeOldTicket ", msg: "onFailure==$e", c: 'r');
    }
  }

  @override
  Future<void> login(
      {required String zendeskToken,
      required Function(DataState) onEvent}) async {
    try {
      kdp(name: "zendesck_track", msg: " login begin", c: 'cy');
      await ZendeskMessaging.loginUserCallbacks(
        jwt: zendeskToken,
        onSuccess: (id, externalId) {
          kdp(name: "ChatZendeskStateMessageing ", msg: "onSuccess ", c: 'r');
          onEvent(
            const DataSuccess(true),
          );
        },
        onFailure: () {
          kdp(name: "ChatZendeskStateMessageing ", msg: "onFailure", c: 'r');
          onEvent(
            DataFailed(ErrorResponseModel(
                statusCode: 400,
                reason: "zendesk_error",
                message: "zendesk_error")),
          );
        },
      );
      // await Future.delayed(const Duration(seconds: 2));
      // onEvent(
      //   const DataSuccess(true),
      // );
    } catch (e) {
      kdp(name: "zendesck_track", msg: "error login end $e", c: 'cy');
      onEvent(
        DataFailed(ErrorResponseModel(
            statusCode: 400,
            reason: "zendesk_error",
            message: "zendesk_error")),
      );
    }
    return;
  }

  @override
  Future<DataState> showChat() async {
    try {
      ZendeskMessaging.show();
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(ErrorResponseModel(
          statusCode: 400, reason: "zendesk_error", message: "zendesk_error"));
    }
  }

  @override
  void initZendeskMessaging({required Function(DataState) onComplete}) async {
    try {
      bool isInitialized = await ZendeskMessaging.isInitialized();
      kdp(name: "zendesck_track", msg: "inivalue=$isInitialized", c: 'cy');
      if (isInitialized) {
        onComplete(const DataSuccess(true));
        return;
      }
      kdp(name: "zendesck_track", msg: "begin ini", c: 'cy');
      await ZendeskMessaging.initialize(
        androidChannelKey:
            "eyJzZXR0aW5nc191cmwiOiJodHRwczovL3N0YXJzcGhlcmUuemVuZGVzay5jb20vbW9iaWxlX3Nka19hcGkvc2V0dGluZ3MvMDFKQzBNNTQzMTFORkNWVEU0RVlRV0Y4MDguanNvbiJ9",
        iosChannelKey:
            "eyJzZXR0aW5nc191cmwiOiJodHRwczovL3N0YXJzcGhlcmUuemVuZGVzay5jb20vbW9iaWxlX3Nka19hcGkvc2V0dGluZ3MvMDFKQkVRWURGWFpRNFNaMDhEWDVUNU1YOFMuanNvbiJ9",
      );
      kdp(name: "zendesck_track", msg: "finish ini func", c: 'cy');
      ZendeskMessaging.setMessageHandler((type, arguments) {
        kdp(name: "zendesck_track", msg: " handler  ${type.name}", c: 'r');
        if (type == ZendeskMessagingMessageType.initializeSuccess) {
          onComplete(const DataSuccess(true));

          return;
        }
        if (type == ZendeskMessagingMessageType.initializeFailure) {
          onComplete(
            DataFailed(
              ErrorResponseModel(
                statusCode: 400,
                reason: "zendesk_error",
                message: "zendesk_error",
              ),
            ),
          );
          return;
        }
      });
    } catch (e) {
      onComplete(
        DataFailed(
          ErrorResponseModel(
            statusCode: 400,
            reason: "zendesk_error",
            message: "zendesk_error",
          ),
        ),
      );
    }
  }

  @override
  Future<bool> isUserLogin() async {
    try {
      bool isLoggedIn = await ZendeskMessaging.isLoggedIn();
      return isLoggedIn;
    } catch (e) {
      return false;
    }
  }

  // @override
  // void initOnDone(
  //     {required Function(DataState<bool> dataState) onEvent}) async {
  //   ZendeskMessaging.setMessageHandler((type, arguments) {
  //     if (type == ZendeskMessagingMessageType.initializeSuccess) {
  //       onEvent(const DataSuccess(true));
  //       return;
  //     }
  //     if (type == ZendeskMessagingMessageType.initializeFailure) {
  //       onEvent(DataFailed(ErrorResponseModel(
  //           httpStatus: 400,
  //           message: "zendesk_error",
  //           locale: "zendesk_error")));
  //       return;
  //     }
  //   });
  //   return;
  // }

  // @override
  // Future<DataState> isInitialized() async {
  //   try {
  //     bool isInitialized = await ZendeskMessaging.isInitialized();

  //     return DataSuccess(isInitialized);
  //   } catch (e) {
  //     return DataFailed(ErrorResponseModel(
  //         httpStatus: 400,
  //         reason: "zendesk_error",
  //         locale: "zendesk_error"));
  //   }
  // }
}
