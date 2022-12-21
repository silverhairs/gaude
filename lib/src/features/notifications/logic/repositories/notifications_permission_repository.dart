import 'package:gaude/src/shared/models/result.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class NotificationsPermissionRepository {
  Future<Result<PermissionStatus>> getNotificationsPermissionStatus();
  Future<Result<void>> requestNotificationsPermission();
}
