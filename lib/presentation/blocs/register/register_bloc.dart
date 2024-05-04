import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/usecases/register_usecase.dart';
import 'package:transjo/presentation/blocs/register/register_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<AbstractRegisterEvent, RegisterState> {
  bool showPassword = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegisterUseCase registerUseCase;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterBloc(this.registerUseCase) : super(RegisterInitialState()) {
    on<RegisterStartProcessEvent>(_onRegisterStartProcessEvent);
    on<RegisterShowPasswordEvent>(_onRegisterShowPasswordEvent);
  }

  Future<FutureOr<void>> _onRegisterStartProcessEvent(RegisterStartProcessEvent event, Emitter<RegisterState> emit) async {
  emit(RegisterLoadingState());
  try{
    final result=await registerUseCase(RegisterParameter(userName: event.userName, name: event.name, email: event.email, password: event.password));
 result.fold((l) {
   print('register failure ${l.message}');
   emit(RegisterServerFailure(l.message));
 } , (r) {
   emit(RegisterSuccessState(r));
 });
  }catch(e){
    emit(RegisterServerFailure(e.toString()));
  }
  }

  FutureOr<void> _onRegisterShowPasswordEvent(RegisterShowPasswordEvent event, Emitter<RegisterState> emit) {
    showPassword = !showPassword;
    emit(RegisterIconDataChangedState());
  }
}
