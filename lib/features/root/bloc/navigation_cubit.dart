import 'package:bloc/bloc.dart';
import 'package:brush_strokes/features/root/bloc/nav_bar_items.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.HOME, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.HOME:
        emit(NavigationState(NavbarItem.HOME, 0));
        break;
      case NavbarItem.SEARCH:
        emit(NavigationState(NavbarItem.SEARCH, 1,
            isNotificationBadgeVisible: false));
        break;
      case NavbarItem.NOTIFICATION:
        emit(NavigationState(NavbarItem.NOTIFICATION, 2));
        break;
      case NavbarItem.CART:
        emit(NavigationState(NavbarItem.CART, 3));
        break;
    }
  }
}
