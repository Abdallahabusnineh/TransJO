part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordSendCodeInitialState extends ChangePasswordState {}
class ChangePasswordSendCodeLoadingState extends ChangePasswordState {}
class ChangePasswordSendCodeSuccessState extends ChangePasswordState {
  final String success;
  ChangePasswordSendCodeSuccessState(this.success);

}
class ChangePasswordSendCodeServerFailureState extends ChangePasswordState {
  final String error;
  ChangePasswordSendCodeServerFailureState(this.error);
}
class ChangePasswordSendCodeErrorState extends ChangePasswordState {
  final String error;
  ChangePasswordSendCodeErrorState(this.error);
}
