import 'package:gaude/src/features/notifications/logic/repositories/notifications_permission_repository.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsPermissionRepositoryImpl
    implements NotificationsPermissionRepository {
  const NotificationsPermissionRepositoryImpl(OpenAppSettings openSettings)
      : _openAppSettings = openSettings;

  final OpenAppSettings _openAppSettings;

  @override
  Future<Result<PermissionStatus>> getNotificationsPermissionStatus() async {
    try {
      return Result(await Permission.notification.status);
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<void>> requestNotificationsPermission() async {
    try {
      final status = await Permission.notification.request();
      if (!status.isGranted) {
        return Result(await _openAppSettings());
      }
      return const Result(null);
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }
}
