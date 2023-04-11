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
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 100.0,
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<NotificationBloc>()
                        .add(RemoveAllNotifications());
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerRight,
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Notifications 🗂",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: notifications.length,
                (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: _notificationItem(
                    notifications[index],
                    Theme.of(context).textTheme,
                    Theme.of(context).colorScheme,
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return Container();
    });
  }

  Widget _notificationItem(
    NotificationInformation notification,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return RichText(
      text: TextSpan(
        text: 'Painting ',
        style: textTheme.titleMedium,
        children: [
          TextSpan(
            text: '\"${notification.photographer}',
            style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
          ),
          if (notification.alt.isNotEmpty)
            TextSpan(
              text: ' ${notification.alt}\"',
              style:
                  textTheme.titleMedium?.copyWith(color: colorScheme.primary),
            ),
          TextSpan(
            text: '\"',
            style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
          ),
          TextSpan(
              text: ' was'
                  ' ${notification.isAddToCart ? 'added to' : 'deleted from'} '
                  'the cart at '),
          TextSpan(
            text: notification.date,
            style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
          ),
          TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
