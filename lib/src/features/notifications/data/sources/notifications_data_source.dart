import 'package:gaude/src/features/notifications/data/models/notification_model.dart';

abstract class NotificationsDataSource {
  Future<void> saveNotification(NotificationModel notification);
  Future<List<NotificationModel>> getNotifications();
}
