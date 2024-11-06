part of 'zendesk_support_cubit.dart';

@freezed
class ZendeskSupportState with _$ZendeskSupportState {
  const factory ZendeskSupportState.initial({
    DataStatus? zendeskState,
    String? error,
  }) = _Initial;
}
