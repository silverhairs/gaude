part of 'notification_permission_cubit.dart';

@freezed
class NotificationPermissionState with _$NotificationPermissionState {
  const factory NotificationPermissionState.initial() = _Initial;
  const factory NotificationPermissionState.pending() = _Pending;
  const factory NotificationPermissionState.granted() = _Granted;
  const factory NotificationPermissionState.denied() = _Denied;
  const factory NotificationPermissionState.failed(Failure failure) = _Failed;
}
