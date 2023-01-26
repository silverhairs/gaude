import 'package:gaude/src/features/notifications/data/models/notification_model.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class NotificationsRepository {
  Future<Result<void>> saveNotification(NotificationModel notification);
  Future<Result<List<NotificationModel>>> getNotifications();
}
