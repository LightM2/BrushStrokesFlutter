// ignore_for_file: must_be_immutable

part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  bool isNotificationBadgeVisible;

  NavigationState(this.navbarItem, this.index,
      {this.isNotificationBadgeVisible = true});

  @override
  List<Object> get props =>
      [this.navbarItem, this.index, this.isNotificationBadgeVisible];
}
