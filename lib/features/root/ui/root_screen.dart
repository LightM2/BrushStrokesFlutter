import 'package:brush_strokes/features/home/home_route.dart';
import 'package:brush_strokes/features/notification/bloc/notification_bloc.dart';
import 'package:brush_strokes/features/root/bloc/nav_bar_items.dart';
import 'package:brush_strokes/features/root/bloc/navigation_cubit.dart';
import 'package:brush_strokes/features/cart/ui/cart_screen.dart';
import 'package:brush_strokes/features/notification/ui/notification_screen.dart';
import 'package:brush_strokes/features/search/ui/search_screen.dart';
import 'package:brush_strokes/repositories/collection_media_repository.dart';
import 'package:brush_strokes/repositories/curated_photos_repository.dart';
import 'package:brush_strokes/repositories/featured_collections_repository.dart';
import 'package:brush_strokes/repositories/photo_repository.dart';
import 'package:brush_strokes/repositories/popular_videos_repository.dart';
import 'package:brush_strokes/repositories/video_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CollectionMediaRepository(),
        ),
        RepositoryProvider(
          create: (context) => CuratedPhotosRepository(),
        ),
        RepositoryProvider(
          create: (context) => FeaturedCollectionsRepository(),
        ),
        RepositoryProvider(
          create: (context) => PhotoRepository(),
        ),
        RepositoryProvider(
          create: (context) => PopularVideosRepository(),
        ),
        RepositoryProvider(
          create: (context) => VideoRepository(),
        ),
      ],
      child: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: state.systemBackButtonPressed,
          child: Scaffold(
            bottomNavigationBar: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              onDestinationSelected: (int index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.HOME);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.SEARCH);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.NOTIFICATION);
                } else if (index == 3) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.CART);
                }
              },
              selectedIndex: state.index,
              destinations: <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.notifications),
                  icon: Badge(
                    isLabelVisible:
                        !context.read<NotificationBloc>().isAllRead(),
                    child: Icon(Icons.notifications_none),
                  ),
                  label: 'Notification',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.shopping_bag),
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Cart',
                ),
              ],
            ),
            body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                if (state.navbarItem == NavbarItem.HOME) {
                  return HomeRoute();
                } else if (state.navbarItem == NavbarItem.SEARCH) {
                  return SearchScreen();
                } else if (state.navbarItem == NavbarItem.NOTIFICATION) {
                  context.read<NotificationBloc>().add(ReadAllNotifications());
                  return NotificationScreen();
                } else if (state.navbarItem == NavbarItem.CART) {
                  return CartScreen();
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
