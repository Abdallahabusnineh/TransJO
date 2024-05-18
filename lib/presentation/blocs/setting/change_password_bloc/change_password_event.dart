part of 'change_password_bloc.dart';

@immutable
abstract class AbstractChangePasswordEvent {}

class ChangePasswordSendCodeProcessEvent extends AbstractChangePasswordEvent {
  ChangePasswordSendCodeProcessEvent();
}
class ChangePasswordVerificationCodeProcessEvent extends AbstractChangePasswordEvent{
  final String code;
  ChangePasswordVerificationCodeProcessEvent({required this.code});

}
class ChangePasswordUpdatedProcessEvent extends AbstractChangePasswordEvent{
  final String oldPassword;
  final String newPassword;

  ChangePasswordUpdatedProcessEvent({required this.oldPassword, required this.newPassword});


}

