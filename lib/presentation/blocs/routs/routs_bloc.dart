import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/usecases/routes/get_all_routes_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_routes_by_id_usecase.dart';

part 'routs_event.dart';
part 'routs_state.dart';

class RoutsBloc extends Bloc<RoutsEvent, RoutsState> {
  RoutsBloc(this.getAllRoutesUsecase,this.getRouteById) : super(RoutsInitial()) {
    on<RoutsGetAllEvent>(_onRoutsGetAllEvent);
    on<RoutsGetByIdEvent>(_onRoutsGetByIdEvent);
  }

  GetAllRoutesUsecase getAllRoutesUsecase;
  GetRouteByIdUsecase getRouteById;

  List<Routs> routes = [];

  Routs? route;

  void _onRoutsGetAllEvent(
    RoutsGetAllEvent event,
    Emitter emit,
  ) async {
    emit(RoutsGetAllLoadingState());
    final result = await getAllRoutesUsecase.call();
    result.fold((l) {
      emit(RoutsGetAllSuccessState());
    }, (r) {
      routes = r;
      emit(RoutsGetAllFailState());
    });
  }

  void _onRoutsGetByIdEvent(
      RoutsGetByIdEvent event,
    Emitter emit,
  ) async {
    emit(RoutsGetAllLoadingState());
    final result = await getRouteById.call(event.id);
    result.fold((l) {
      emit(RoutsGetAllSuccessState());
    }, (r) {
      route = r;
      emit(RoutsGetAllFailState());
    });
  }
}
