part of 'login_bloc.dart';

@immutable
abstract class AbstractLoginEvent {}
class LoginStartProcessEvent extends AbstractLoginEvent{
  final String userName;
  final String password;

  LoginStartProcessEvent({required this.userName, required this.password});

}
class ShowPasswordEvent  extends AbstractLoginEvent{

}