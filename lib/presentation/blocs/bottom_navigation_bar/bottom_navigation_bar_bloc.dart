import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(InitialBottomNavigationBarState()) {
    on<HomeNavigationBarEvent>((event, emit) {
emit(HomeBottomNavigationBarState());
    });
    on<FavoriteRoutesNavigationBarEvent>((event, emit) {
      emit(FavoriteRoutesBottomNavigationBarState());
    });
    on<SettingNavigationBarEvent>((event, emit) {
      emit(SettingBottomNavigationBarState());
    });
  }
}
