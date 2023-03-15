import 'package:brush_strokes/base/nav_bar_items.dart';
import 'package:brush_strokes/blocs/navigation/navigation_cubit.dart';
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
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
            destinations: const <Widget>[
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
                icon: Icon(Icons.notifications_none),
                label: 'Notification',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.shopping_bag),
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Cart',
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.HOME) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.navbarItem.name),
            );
          } else if (state.navbarItem == NavbarItem.SEARCH) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.navbarItem.name),
            );
          } else if (state.navbarItem == NavbarItem.NOTIFICATION) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.navbarItem.name),
            );
          } else if (state.navbarItem == NavbarItem.CART) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.navbarItem.name),
            );
          }
          return Container();
        },
      ),
    );
  }
}
