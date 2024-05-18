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

class ChangePasswordVerificationCodeLoadingState extends ChangePasswordState {}

class ChangePasswordVerificationCodeSuccessState extends ChangePasswordState {
  final String success;

  ChangePasswordVerificationCodeSuccessState(this.success);
}

class ChangePasswordVerificationCodeServerFailureState
    extends ChangePasswordState {
  final String error;

  ChangePasswordVerificationCodeServerFailureState(this.error);
}

class ChangePasswordUpdatedLoadingState extends ChangePasswordState {}

class ChangePasswordUpdatedSuccessState extends ChangePasswordState {
  final String success;

  ChangePasswordUpdatedSuccessState(this.success);
}

class ChangePasswordUpdatedServerFailureState extends ChangePasswordState {
  final String error;

  ChangePasswordUpdatedServerFailureState(this.error);
}
