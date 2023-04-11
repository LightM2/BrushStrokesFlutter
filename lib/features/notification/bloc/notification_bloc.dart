import 'package:brush_strokes/models/notification.dart';
import 'package:brush_strokes/repositories/notification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc
    extends HydratedBloc<NotificationEvent, NotificationState> {
  final NotificationsRepository notificationsRepository;

  NotificationBloc(this.notificationsRepository)
      : super(
            NotificationsSuccessState(notificationsRepository.notifications)) {
    on<AddNotification>((event, emit) async {
      emit(NotificationsLoadingState());
      final updatedNotificationsList =
          notificationsRepository.addNotification(event.notification);
      emit(NotificationsSuccessState(updatedNotificationsList));
    });
    on<RemoveAllNotifications>((event, emit) {
      emit(NotificationsLoadingState());
      final updatedNotificationsList = notificationsRepository.notifications;
      emit(NotificationsSuccessState(updatedNotificationsList));
    });
  }

  @override
  NotificationState? fromJson(Map<String, dynamic> json) {
    try {
      final listOfNotification = (json['notifications'] as List)
          .map((e) =>
              NotificationInformation.fromJson(e as Map<String, dynamic>))
          .toList();

      notificationsRepository.notifications = listOfNotification;
      return NotificationsSuccessState(listOfNotification);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(NotificationState state) {
    if (state is NotificationsSuccessState) {
      return state.toJson();
    } else {
      return null;
    }
  }

  bool isAllRead() {
    List<NotificationInformation> notifications =
        notificationsRepository.notifications;
    return notifications.every((element) => !element.isUnread);
  }
}
