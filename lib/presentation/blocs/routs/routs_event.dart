part of 'routs_bloc.dart';

@immutable
sealed class RoutsEvent {}

class RoutsGetAllEvent extends RoutsEvent {}
class RoutsGetByIdEvent extends RoutsEvent {
  final int id;

  RoutsGetByIdEvent(this.id);

}
