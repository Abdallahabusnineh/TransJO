import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/usecases/forgot_password/verification_usecase.dart';
import 'package:transjo/presentation/blocs/forgotpassword/forgot_password_bloc.dart';
import 'package:transjo/presentation/blocs/verification_bloc.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<AbstractVerificationEvent, VerificationState> {
  VerificationBloc(this.verificationUseCase) : super(VerificationInitialState()) {
    on<VerificationStartProcessEvent>(_onVerificationStartProcessEvent);
  }
  TextEditingController codeNameController = TextEditingController();
  TextEditingController newPasswordNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  VerificationUseCase verificationUseCase;
  Future<FutureOr<void>> _onVerificationStartProcessEvent(VerificationStartProcessEvent event, Emitter<VerificationState> emit) async {
    emit(VerificationLoadingState());
    try {
      final result =
      await verificationUseCase.call(VerificationParameter(event.code, event.newPassword));
      result.fold((l) {
        print('send code is done ${l.message}');
        emit(VerificationServerFailureState(l.message));
      }, (r) {
        emit(VerificationSuccessState("Login Successfully"));
      });
    } catch (e) {
      print(e.toString());
      emit(VerificationErrorState(e.toString()));
    }
  }
}