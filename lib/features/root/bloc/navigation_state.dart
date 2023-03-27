part of 'navigation_cubit.dart';

@immutable
class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  final bool isNotificationBadgeVisible;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    NavigatorKeys.bottomNavigationBarHomeItem,
    NavigatorKeys.bottomNavigationBarSearchItem,
    NavigatorKeys.bottomNavigationBarNotificationItem,
    NavigatorKeys.bottomNavigationBarCartItem,
  ];

  Future<bool> systemBackButtonPressed() async {
    if (_navigatorKeys[index].currentState?.canPop() == true) {
      _navigatorKeys[index]
          .currentState!
          .pop(_navigatorKeys[index].currentContext);
      return false;
    } else {
      return true;
    }
  }

  NavigationState(this.navbarItem, this.index,
      {this.isNotificationBadgeVisible = true});

  @override
  List<Object> get props =>
      [this.navbarItem, this.index, this.isNotificationBadgeVisible];
}
