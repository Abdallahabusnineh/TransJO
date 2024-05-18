part of 'routs_bloc.dart';

@immutable
sealed class RoutsState {}

final class RoutsInitial extends RoutsState {}

///-------------------------------------------------------
final class RoutsGetAllLoadingState extends RoutsState {}

final class RoutsGetAllSuccessState extends RoutsState {}

final class RoutsGetAllFailState extends RoutsState {}

///-------------------------------------------------------
final class RoutsGetByIdLoadingState extends RoutsState {}

final class RoutsGetByIdSuccessState extends RoutsState {
  final Routs routs;

  RoutsGetByIdSuccessState(this.routs);
}

final class RoutsGetByIdFailState extends RoutsState {}
