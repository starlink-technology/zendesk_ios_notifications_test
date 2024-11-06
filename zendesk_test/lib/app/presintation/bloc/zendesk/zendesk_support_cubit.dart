import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:zendesk_test/app/data/data_source/zendesk_data_sorce.dart';
import 'package:zendesk_test/utils/enum/enum.dart';
import 'package:zendesk_test/utils/extention.dart';
import 'package:zendesk_test/utils/network/data_state.dart';

part 'zendesk_support_cubit.freezed.dart';
part 'zendesk_support_state.dart';

class ZendeskSupportCubit extends Cubit<ZendeskSupportState> {
  final BaseZendeskDataSource baseZendeskDataSource;
  ZendeskSupportCubit({required this.baseZendeskDataSource})
      : super(const ZendeskSupportState.initial());

  initZendeskEvent(bool isuserGuest) async {
    emit(state.copyWith(zendeskState: DataStatus.loading));

    // DataState dataState = await baseZendeskDataSource.isInitialized();
    // if (dataState is DataSuccess) {
    //   registerUser();
    //   return;
    // }

    baseZendeskDataSource.initZendeskMessaging(onComplete: (p0) {
      kdp(name: "zendesck_track", msg: " on complete $p0", c: 'cy');
      if (p0 is DataSuccess) {
        registerUser(isuserGuest);
        return;
      }
      emit(state.copyWith(
          zendeskState: DataStatus.error, error: p0.error?.message ?? ""));
    });
  }

  showChat() async {
    DataState dataState = await baseZendeskDataSource.showChat();
    if (dataState is DataSuccess) {
      emit(state.copyWith(zendeskState: DataStatus.loaded));
      return;
    }
    emit(state.copyWith(
        zendeskState: DataStatus.error, error: dataState.error?.message ?? ""));
  }

  loginUser() async {
    final isUserLogin = await baseZendeskDataSource.isUserLogin();

    if (isUserLogin) {
      emit(state.copyWith(zendeskState: DataStatus.loaded));

      return;
    }

    baseZendeskDataSource.login(
        zendeskToken:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImFwcF82NTcxYTdkY2Y0NzRkODIxYzdlMzAwZjQifQ.eyJzY29wZSI6InVzZXIiLCJleHRlcm5hbF9pZCI6IjcyNDNiOThiLTBhZTctNDNiYS04NWMyLTg1ZWFlMzczMDFhNCIsIm5hbWUiOiLZgdin2LHYsyDYudio2K_Yp9mE2LHYrdmF2YYg2K3Ys9mK2YYg2YXYrdmF2K8iLCJpYXQiOjE3MzA4ODYwODIsImV4cCI6MTczMDk3MjQ4Mn0.iKY0yOXYV-O7spPZcCHQV5spZedjDAyYPQmL45iqQ0k",
        onEvent: (DataState dataState) {
          if (dataState is DataSuccess) {
            emit(state.copyWith(zendeskState: DataStatus.loaded));
            return;
          }
          emit(state.copyWith(
              zendeskState: DataStatus.error,
              error: dataState.error?.message ?? ""));
        });
  }

  registerUser(bool isuserGuest) {
    if (isuserGuest) {
      emit(state.copyWith(zendeskState: DataStatus.loaded));
      return;
    }
    loginUser();
  }

  Future<(String, String, String)> getDeviceInfo() async {
    String brand = "unknow";
    String osVer = "unknow";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return (brand, osVer, packageInfo.version);
  }

  Future<void> logout() async {
    // DataState dataState = await baseZendeskDataSource.isInitialized();

    // if (dataState is DataSuccess) {
    //   if (dataState.data!) {
    baseZendeskDataSource.closeOldTicket();
    //   }
    // }
  }
}
