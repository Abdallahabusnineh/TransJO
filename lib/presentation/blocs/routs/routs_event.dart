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
