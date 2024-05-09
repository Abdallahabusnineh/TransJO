import 'package:get_it/get_it.dart';
import 'package:transjo/data/datasource/forgot_password_datasource.dart';
import 'package:transjo/data/datasource/remote_datasource.dart';
import 'package:transjo/data/datasource/routes_datasource.dart';
import 'package:transjo/data/repository/forgot_password_repository.dart';
import 'package:transjo/data/repository/routes_repository.dart';
import 'package:transjo/data/repository/transjo_repository.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';
import 'package:transjo/domain/repository/forgot_password_repo.dart';
import 'package:transjo/domain/repository/rout_repo.dart';
import 'package:transjo/domain/usecases/forgot_password/forgot_password_usecase.dart';
import 'package:transjo/domain/usecases/login_usecase.dart';
import 'package:transjo/domain/usecases/register_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_all_routes_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_routes_by_id_usecase.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';
import 'package:transjo/presentation/blocs/forgotpassword/forgot_password_bloc.dart';
import 'package:transjo/presentation/blocs/register/register_bloc.dart';

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
    sl.registerLazySingleton(() => SendCodeUseCase(sl()));
    sl.registerLazySingleton<BaseForgotPasswordRepository>(() => ForgotPasswordRepository(
        sl()));
    sl.registerLazySingleton<BaseForgotPasswordDataSource>(() => ForgotPasswordDataSource());


  }
}
