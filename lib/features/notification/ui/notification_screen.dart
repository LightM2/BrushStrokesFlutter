import 'package:brush_strokes/features/notification/bloc/notification_bloc.dart';
import 'package:brush_strokes/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      if (state is NotificationsSuccessState) {
        List<NotificationInformation> notifications = state.notifications;
        return Container(
          alignment: Alignment.center,
          child: Text(
              'Notifications list - ${notifications.map((e) => e.photographer)}, ${notifications.map((e) => e.date)}'),
        );
      }
      return Container();
    });
  }
}
