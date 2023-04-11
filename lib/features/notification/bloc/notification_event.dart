part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class AddNotification extends NotificationEvent {
  final NotificationInformation notification;

  const AddNotification(this.notification);

  @override
  List<Object> get props => [notification];
}

class RemoveAllNotifications extends NotificationEvent {
  const RemoveAllNotifications();

  @override
  List<Object> get props => [];
}
