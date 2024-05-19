import 'package:get_it/get_it.dart';
import 'package:transjo/data/datasource/change_password_datasource.dart';
import 'package:transjo/data/datasource/feedback_datasource.dart';
import 'package:transjo/data/datasource/forgot_password_datasource.dart';
import 'package:transjo/data/datasource/logout_datasource.dart';
import 'package:transjo/data/datasource/remote_datasource.dart';
import 'package:transjo/data/datasource/routes_datasource.dart';
import 'package:transjo/data/repository/forgot_password_repository.dart';
import 'package:transjo/data/repository/routes_repository.dart';
import 'package:transjo/data/repository/setting/change_password_repository.dart';
import 'package:transjo/data/repository/setting/feedback_repository.dart';
import 'package:transjo/data/repository/setting/logout_repository.dart';
import 'package:transjo/data/repository/transjo_repository.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';
import 'package:transjo/domain/repository/forgot_password_repo.dart';
import 'package:transjo/domain/repository/rout_repo.dart';
import 'package:transjo/domain/repository/setting_base_repository/change_password_repository.dart';
import 'package:transjo/domain/repository/setting_base_repository/feedback_base_repository.dart';
import 'package:transjo/domain/repository/setting_base_repository/logout_base_repository.dart';
import 'package:transjo/domain/usecases/forgot_password/forgot_password_usecase.dart';
import 'package:transjo/domain/usecases/forgot_password/verification_usecase.dart';
import 'package:transjo/domain/usecases/login_usecase.dart';
import 'package:transjo/domain/usecases/register_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_all_routes_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_routes_by_id_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_password_updated_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_password_usecase.dart';
import 'package:transjo/domain/usecases/setting/change_passwprd_verification_code_usecase.dart';
import 'package:transjo/domain/usecases/setting/feed_back_usecase.dart';
import 'package:transjo/domain/usecases/setting/logout_usecase.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';
import 'package:transjo/presentation/blocs/forgotpassword/forgot_password_bloc.dart';
import 'package:transjo/presentation/blocs/forgotpassword/verification_bloc.dart';
import 'package:transjo/presentation/blocs/register/register_bloc.dart';
import 'package:transjo/presentation/blocs/setting/change_password_bloc/change_password_bloc.dart';
import 'package:transjo/presentation/blocs/setting/feedback/feed_back_bloc.dart';
import 'package:transjo/presentation/blocs/setting/logout/logout_bloc.dart';

final sl = GetIt.instance;

class ServicesLocater {
  void init() {
    //Bloc register
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    //UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));

//Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(
        sl())); //sl() معناها انو انتا لما تنادي عل سيرفيس لوكيتر رح تلاقي الاوبجيكت فيها

    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    ///----------------------------------------------------------
    sl
      ..registerLazySingleton(() => GetAllRoutesUsecase(sl()))
      ..registerLazySingleton(() => GetRouteByIdUsecase(sl()))
      ..registerLazySingleton<BaseRoutsRepositories>(
          () => RoutesRepository(sl()))
      ..registerLazySingleton<BaseRoutesDatasource>(() => RoutesDatasource());


    //forgot password
    sl.registerFactory(() => ForgotPasswordBloc(sl()));
    sl.registerFactory(() => VerificationBloc(sl()));
    sl.registerLazySingleton(() => SendCodeUseCase(sl()));
    sl.registerLazySingleton(() => VerificationUseCase(sl()));
    sl.registerLazySingleton<BaseForgotPasswordRepository>(() => ForgotPasswordRepository(
        sl()));
    sl.registerLazySingleton<BaseForgotPasswordDataSource>(() => ForgotPasswordDataSource());

    //change password

    sl.registerLazySingleton(() => ChangePasswordSendCodeUseCase(sl()));
    sl.registerLazySingleton(() => ChangePasswordVerificationCodeUseCase(sl()));
    sl.registerLazySingleton(() => ChangePasswordUpdatedUseCase(sl()));
    sl.registerLazySingleton<ChangePasswordBaseRepository>(() => ChangePasswordRepository(
        sl()));
    sl.registerLazySingleton<ChangePasswordBaseDataSource>(() => ChangePasswordDataSource());

    //feed back
    sl.registerFactory(() => FeedBackBloc(sl()));
    sl.registerLazySingleton(() => FeedBackUseCase(sl()));
    sl.registerLazySingleton<FeedBackBaseRepository>(() => FeedBackRepository(
        sl()));
    sl.registerLazySingleton<FeedBackBaseDataSource>(() => FeedBackDataSource());

    //logout
   // sl.registerFactory(() => LogoutBloc(sl()));

    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton<LogOutBaseRepository>(() => LogOutRepository(
        sl()));
    sl.registerLazySingleton<LogOutBaseDataSource>(() => LogOutDataSource());





  }
}
