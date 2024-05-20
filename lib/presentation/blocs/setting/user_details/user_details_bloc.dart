import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:transjo/core/base_usecase/base_usecase.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/domain/entites/user_details.dart';

import '../../../../domain/usecases/setting/user_details_usecase.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsUseCase userDetailsUseCase;
  UserDetailsBloc(this.userDetailsUseCase) : super(UserDetailsInitial()) {
    on<GetUserDetails>((event, emit) async{
      emit(LoadingUserDetailsState());
      try
          {
            final result=await userDetailsUseCase.call(NoParameters());
            result.fold(
                    (l)=>emit(ServerErrorUserState(error: l.message)),
                    (r){
                  userDetailsEmail=r.email;
                  userDetailsName=r.name;
                  emit(SuccessUserDetailsState(userDetails: r));
                });
          }catch(e)
      {
        print("${e.toString()}youuuuseeeeeddddsfs");
      }
    });
  }
}
