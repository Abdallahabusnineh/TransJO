part of 'login_bloc.dart';

@immutable
abstract class AbstractLoginEvent {}
class LoginEventSuccess extends AbstractLoginEvent{
  final String userName;
  final String password;

  LoginEventSuccess({required this.userName, required this.password});

}
class ShowPasswordEvent  extends AbstractLoginEvent{

}