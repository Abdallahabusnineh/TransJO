part of 'routs_bloc.dart';

@immutable
sealed class RoutsState {}

final class RoutsInitial extends RoutsState {}

///-------------------------------------------------------
final class RoutsGetAllLoadingState extends RoutsState {}

final class RoutsGetAllSuccessState extends RoutsState {}

final class RoutsGetAllFailState extends RoutsState {}
