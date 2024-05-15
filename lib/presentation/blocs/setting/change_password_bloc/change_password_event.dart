part of 'change_password_bloc.dart';

@immutable
abstract class AbstractChangePasswordEvent {}

class ChangePasswordSendCodeProcessEvent extends AbstractChangePasswordEvent {
  ChangePasswordSendCodeProcessEvent();
}
