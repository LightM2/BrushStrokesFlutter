import 'package:brush_strokes/common.dart';
import 'package:brush_strokes/features/cart/bloc/cart_bloc.dart';
import 'package:brush_strokes/features/notification/bloc/notification_bloc.dart';
import 'package:brush_strokes/models/notification.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartSuccessState) {
        List<Photo> paintings = state.paintings;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Cart 🛍",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: paintings.length,
                (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: _cartItem(
                    paintings[index],
                    Theme.of(context).textTheme,
                    Theme.of(context).colorScheme,
                    () {
                      context
                          .read<CartBloc>()
                          .add(RemovePainting(paintings[index].id));
                      NotificationInformation notification =
                          NotificationInformation(
                        paintings[index].id,
                        paintings[index].photographer,
                        paintings[index].alt,
                        currentTime(),
                        true,
                        false,
                      );
                      context
                          .read<NotificationBloc>()
                          .add(AddNotification(notification));
                    },
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

  Widget _cartItem(
    Photo painting,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback onDismissed,
  ) {
    return Dismissible(
      key: Key(painting.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: Text(
          'Delete',
          style: textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              painting.src.medium,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(width: 12),
          _cartItemDescription(painting, textTheme, colorScheme),
        ],
      ),
    );
  }

  Widget _cartItemDescription(
    Photo painting,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          painting.photographer,
          style: textTheme.bodyMedium
              ?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        SizedBox(height: 4),
        if (painting.alt.isNotEmpty)
          SizedBox(
            width: 260,
            child: Text(
              painting.alt,
              style: textTheme.bodyMedium,
            ),
          ),
        RichText(
          text: TextSpan(
            text: 'Price: ',
            style: textTheme.titleMedium,
            children: [
              TextSpan(
                text: '${(painting.id / 3000).round()}\$',
                style: textTheme.titleMedium?.copyWith(color: goldColor),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
