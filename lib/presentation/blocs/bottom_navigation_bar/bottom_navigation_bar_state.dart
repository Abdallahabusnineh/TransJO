part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarState {}

class BottomNavigationBarOnChange extends BottomNavigationBarState {
final int index;

  BottomNavigationBarOnChange({required this.index});
}
