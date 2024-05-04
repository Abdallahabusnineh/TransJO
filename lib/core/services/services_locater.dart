import 'package:get_it/get_it.dart';
import 'package:transjo/data/datasource/remote_datasource.dart';
import 'package:transjo/data/repository/transjo_repository.dart';
import 'package:transjo/domain/repository/base_trasnsjo_repository.dart';
import 'package:transjo/domain/usecases/login_usecase.dart';
import 'package:transjo/presentation/blocs/Login/login_bloc.dart';

final sl = GetIt.instance;
class ServicesLocater {

  void init() {
    //Bloc register
    sl.registerFactory(() => LoginBloc(sl()));
 //UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));

//Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));//sl() معناها انو انتا لما تنادي عل سيرفيس لوكيتر رح تلاقي الاوبجيكت فيها

    sl.registerLazySingleton<BaseRemoteDataSource>(
            () => RemoteDataSource());
  }
}