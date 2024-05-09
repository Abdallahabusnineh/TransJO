part of 'register_bloc.dart';

@immutable
abstract class AbstractRegisterEvent {}
class RegisterStartProcessEvent extends AbstractRegisterEvent{
  final String name;
  final String email;
  final String password;

  RegisterStartProcessEvent({required this.name, required this.email, required this.password});

}
class RegisterShowPasswordEvent  extends AbstractRegisterEvent{

}