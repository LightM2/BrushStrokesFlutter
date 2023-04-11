import 'package:brush_strokes/models/notification.dart';

class NotificationsRepository {
  List<NotificationInformation> notifications = [];

  List<NotificationInformation> addNotification(
    NotificationInformation notification,
  ) {
    if (!notifications.contains(notification)) {
      notifications.add(notification);
    }
    return notifications;
  }

  List<NotificationInformation> removeAllNotifications() {
    return notifications = [];
  }

  List<NotificationInformation> readAllNotifications() {
    List<NotificationInformation> readNotifications =
        notifications.map((element) => element.readNotification()).toList();
    return readNotifications;
  }
}
