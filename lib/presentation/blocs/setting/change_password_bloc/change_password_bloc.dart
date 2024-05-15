import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_password_usecase.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<AbstractChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this.changePasswordSendCodeUseCase) : super(ChangePasswordSendCodeInitialState()) {
    on<ChangePasswordSendCodeProcessEvent>(_onChangePasswordSendCodeProcessEvent);
  }
  ChangePasswordSendCodeUseCase changePasswordSendCodeUseCase;
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<FutureOr<void>> _onChangePasswordSendCodeProcessEvent(ChangePasswordSendCodeProcessEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordSendCodeLoadingState());
    try {
      final result =
          await changePasswordSendCodeUseCase.call(NoParameters());
      result.fold((l) {
        print('send code is done ${l.message}');
        emit(ChangePasswordSendCodeServerFailureState(l.message));
      }, (r) {
        emit(ChangePasswordSendCodeSuccessState("Send Code  Successfully"));
      });
    } catch (e) {
      print(e.toString());
      emit(ChangePasswordSendCodeErrorState(e.toString()));
    }
  }
}
