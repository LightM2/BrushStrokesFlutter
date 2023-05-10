part of 'notification_bloc.dart';

@immutable
abstract class NotificationState extends Equatable {}

class NotificationsLoadingState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationsSuccessState extends NotificationState {
  final List<NotificationInformation> notifications;

  NotificationsSuccessState(this.notifications);

  @override
  List<Object?> get props => [notifications];

  Map<String, dynamic> toJson() {
    return {'notifications': notifications};
  }
}
