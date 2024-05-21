import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/core/utils/cash_helper.dart';
import 'package:transjo/domain/usecases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<AbstractLoginEvent, LoginState> {
  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginStartProcessEvent>(_onLoginStartProcessEvent);
    on<ShowPasswordEvent>(_onShowPasswordEvent);
  }

  bool showPassword = true;
  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;

  void _onLoginStartProcessEvent(
      LoginStartProcessEvent event, Emitter emit) async {
    emit(LoginLoadingState());
    try {
      final result =
          await loginUseCase.call(LoginParameter(event.email, event.password));
      result.fold((l) {
        print('carlossss ${l.message}');
        emit(LoginServerFailure(l.message));
      }, (r) {
        //  if (r.)
        CashHelper.saveData(key: "token", value: r.accessToken);
        token = r.accessToken!;
        emit(LoginSuccessState("Login Successfully"));
        print('the token kdkdkd ${token}');
        // else
        //emit(LoginErrorState(r));
      });
    } catch (e) {
      emit(LoginServerFailure(e.toString()));
    }
  }

  FutureOr<void> _onShowPasswordEvent(
      ShowPasswordEvent event, Emitter<LoginState> emit) {
    showPassword = !showPassword;
    emit(IconDataChanged());
  }
}
