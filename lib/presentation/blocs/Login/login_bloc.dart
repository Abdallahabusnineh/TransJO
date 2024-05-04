
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/domain/entites/login_succes_entities.dart';
import 'package:transjo/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AbstractLoginEvent, LoginState> {
  bool showPassword = true;
  IconButton iconData = IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined));
  TextEditingController userNameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginEventSuccess>((event, emit) async{
emit(LoginLoadingState());
final result= await loginUseCase(LoginParameter(event.userName, event.password));
result.fold((l) => emit(LoginServerFailure(l.message)), (r) {
  if(r.status)
    emit(LoginSuccessState(r));
  else
    emit(LoginErrorState(r.message));
});
on<ShowPasswordEvent>((event, emit) {
  showPassword = !showPassword;
  if (showPassword) {
    iconData = IconButton(onPressed: (){

    }, icon: Icon(Icons.remove_red_eye));

  } else {
    iconData = IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined));
  }
  emit(IconDataChanged());
});


    });
  }

}
