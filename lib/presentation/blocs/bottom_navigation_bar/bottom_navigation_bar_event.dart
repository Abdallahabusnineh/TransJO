part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {
  final int index;

  BottomNavigationBarEvent({required this.index});

}
