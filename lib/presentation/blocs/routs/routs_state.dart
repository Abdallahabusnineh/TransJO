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

///-------------------------------------------------------
final class RoutsSearchPointsLoadingState extends RoutsState {}

final class RoutsSearchPointsSuccessState extends RoutsState {}

final class RoutsSearchPointsFailState extends RoutsState {}
///-------------------------------------------------------
final class RoutsGetAllFavoritesRouteLoadingState extends RoutsState {}
final class RoutsGetAllFavoritesRouteSuccessState extends RoutsState {}
final class RoutsGetAllFavoritesRouteFailState extends RoutsState {}
///-------------------------------------------------------
final class RoutsAddNewRouteToFavLoadingState extends RoutsState {}
final class RoutsAddNewRouteToFavSuccessState extends RoutsState {}
final class RoutsAddNewRouteToFavFailState extends RoutsState {}
///-------------------------------------------------------
final class RoutsDeleteRouteFromFavLoadingState extends RoutsState {}
final class RoutsDeleteRouteFromFavSuccessState extends RoutsState {}
final class RoutsDeleteRouteFromFavFailState extends RoutsState {}
///-------------------------------------------------------
final class RoutsGetBusLocationLoadingState extends RoutsState {}
final class RoutsGetBusLocationSuccessState extends RoutsState {}
final class RoutsGetBusLocationFailState extends RoutsState {}


