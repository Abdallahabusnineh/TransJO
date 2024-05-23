part of 'routs_bloc.dart';

@immutable
sealed class RoutsEvent {}

class RoutsGetAllEvent extends RoutsEvent {}
class RoutsSearchEvent extends RoutsEvent {
  final String val;

  RoutsSearchEvent(this.val);
}

class RoutsGetByIdEvent extends RoutsEvent {
  final int id;

  RoutsGetByIdEvent(this.id);
}

class RoutesAddNewRouteToFavoritesEvent extends RoutsEvent {
  final int index;
  final int routeId;

  RoutesAddNewRouteToFavoritesEvent(this.index, this.routeId);
}

class RoutesDeleteNewRouteToFavoritesEvent extends RoutsEvent {
  final int index;
  final int routeId;

  RoutesDeleteNewRouteToFavoritesEvent(this.index, this.routeId);
}

class RoutesGetAllRouteToFavoritesEvent extends RoutsEvent {

}
class RoutesGetBusLocationEvent extends RoutsEvent {
final int busId;

  RoutesGetBusLocationEvent(this.busId);

}
