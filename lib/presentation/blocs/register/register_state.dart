part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {
  // final LoginSuccess loginSuccess;
  final String r;
  RegisterSuccessState(this.r);
}
class RegisterServerFailure extends RegisterState{
  final String errorMessage;

  RegisterServerFailure(this.errorMessage);
}
class RegisterErrorState extends RegisterState{
  final String error;
  RegisterErrorState(this.error);

}
class RegisterIconDataChangedState extends RegisterState{}
