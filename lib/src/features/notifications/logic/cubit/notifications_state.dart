part of 'notifications_cubit.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _NotificationsInitial;
  const factory NotificationsState.loaded(
    List<NotificationModel> notifications,
  ) = _NotificationsLoaded;
  const factory NotificationsState.failed(Failure failure) =
      _NotificationsFailed;

  const factory NotificationsState.loading() = _NotificationsLoading;
}
