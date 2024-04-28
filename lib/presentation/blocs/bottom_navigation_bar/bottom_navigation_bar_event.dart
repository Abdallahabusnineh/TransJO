part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {
}
class FavoriteRoutesNavigationBarEvent extends BottomNavigationBarEvent{}
class HomeNavigationBarEvent extends BottomNavigationBarEvent{}
class SettingNavigationBarEvent extends BottomNavigationBarEvent{}
