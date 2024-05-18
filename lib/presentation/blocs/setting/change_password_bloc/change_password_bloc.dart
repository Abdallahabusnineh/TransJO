import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_password_updated_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_password_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_passwprd_verification_code_usecase.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<AbstractChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this.changePasswordSendCodeUseCase,this.changePasswordVerificationCodeUseCase,this.changePasswordUpdatedUseCase) : super(ChangePasswordSendCodeInitialState()) {
    on<ChangePasswordSendCodeProcessEvent>(_onChangePasswordSendCodeProcessEvent);
    on<ChangePasswordVerificationCodeProcessEvent>(_onChangePasswordVerificationCodeProcessEvent);
    on<ChangePasswordUpdatedProcessEvent>(_onChangePasswordUpdatedProcessEvent);

  }
  ChangePasswordSendCodeUseCase changePasswordSendCodeUseCase;
  ChangePasswordVerificationCodeUseCase changePasswordVerificationCodeUseCase;
  ChangePasswordUpdatedUseCase changePasswordUpdatedUseCase;
  TextEditingController codeController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
   final GlobalKey<FormState> formKeyVerificationCode = GlobalKey<FormState>();
   final GlobalKey<FormState> formKeyUpdatedPassword = GlobalKey<FormState>();

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
      print( 'yousef balawi ${e.toString()}');
      emit(ChangePasswordSendCodeServerFailureState(e.toString()));
    }
  }

  Future<FutureOr<void>> _onChangePasswordVerificationCodeProcessEvent(ChangePasswordVerificationCodeProcessEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordVerificationCodeLoadingState());
    try {
      final result =
          await changePasswordVerificationCodeUseCase.call(ChangePasswordVerificationParameter(event.code));
      result.fold((l) {
        print('vervication code is done ${l.message}');
        emit(ChangePasswordVerificationCodeServerFailureState(l.message));
      }, (r) {
        emit(ChangePasswordVerificationCodeSuccessState("Send Code  Successfully"));
      });
    } catch (e) {
      print( 'yousef balawi ${e.toString()}');
      emit(ChangePasswordVerificationCodeServerFailureState(e.toString()));
    }
  }

  Future<FutureOr<void>> _onChangePasswordUpdatedProcessEvent(ChangePasswordUpdatedProcessEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordUpdatedLoadingState());
    try {
      final result =
          await changePasswordUpdatedUseCase.call(ChangePasswordUpdatedParameter(event.oldPassword,event.newPassword));
      result.fold((l) {
        print(l.message);
        emit(ChangePasswordUpdatedServerFailureState(l.message));
      }, (r) {
        emit(ChangePasswordUpdatedSuccessState("Updated Password  Successfully"));
      });
    } catch (e) {
      print( 'updtaed password bloc catch ${e.toString()}');
      emit(ChangePasswordUpdatedServerFailureState(e.toString()));
    }
  }
}
