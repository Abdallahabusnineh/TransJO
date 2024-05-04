import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/usecases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<AbstractLoginEvent, LoginState> {
  bool showPassword = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginStartProcessEvent>(_onLoginStartProcessEvent);
    on<ShowPasswordEvent>(_onShowPasswordEvent);
  }

  void _onLoginStartProcessEvent(
      LoginStartProcessEvent event, Emitter emit) async {
    emit(LoginLoadingState());
    try {
      final result =
          await loginUseCase(LoginParameter(event.userName, event.password));
      result.fold((l) {
        print('carlossss ${l.message}');
        emit(LoginServerFailure(l.message));
      }, (r) {
        //if (r.status)
        emit(LoginSuccessState(r));
        //   emit(LoginErrorState(r));

        // else
        //emit(LoginErrorState(r));
      });
    } catch (e) {
      emit(LoginServerFailure(e.toString()));
    }
  }

  FutureOr<void> _onShowPasswordEvent(ShowPasswordEvent event, Emitter<LoginState> emit) {
    showPassword = !showPassword;
    emit(IconDataChanged());
  }
}
