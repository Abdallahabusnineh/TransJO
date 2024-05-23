import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:transjo/core/common_widgets/show_toast.dart';
import 'package:transjo/domain/entites/bus_location.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/usecases/routes/add_route_to_fav.dart';
import 'package:transjo/domain/usecases/routes/bus_location_usecase.dart';
import 'package:transjo/domain/usecases/routes/delete_route_from_fav_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_all_fav_routes_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_all_routes_usecase.dart';
import 'package:transjo/domain/usecases/routes/get_routes_by_id_usecase.dart';

part 'routs_event.dart';

part 'routs_state.dart';

class RoutsBloc extends Bloc<RoutsEvent, RoutsState> {
  RoutsBloc(
      this.getAllRoutesUsecase,
      this.getRouteById,
      this.getAllFavRoutesUsecase,
      this.addRouteToFavUsecase,
      this.busLocationUsecase,
      this.deleteRouteFromFav)
      : super(RoutsInitial()) {
    on<RoutsGetAllEvent>(_onRoutsGetAllEvent);
    on<RoutsGetByIdEvent>(_onRoutsGetByIdEvent);
    on<RoutsSearchEvent>(_onRoutsSearchEvent);
    on<RoutesAddNewRouteToFavoritesEvent>(_onRoutesAddNewRouteToFavoritesEvent);
    on<RoutesDeleteNewRouteToFavoritesEvent>(
        _onRoutesDeleteNewRouteToFavoritesEvent);
    on<RoutesGetAllRouteToFavoritesEvent>(_onRoutesGetAllRouteToFavoritesEvent);
    on<RoutesGetBusLocationEvent>(_onRoutesGetBusLocationEvent);
  }

  GetAllRoutesUsecase getAllRoutesUsecase;
  GetRouteByIdUsecase getRouteById;
  GetAllFavRoutesUsecase getAllFavRoutesUsecase;
  AddRouteToFavUsecase addRouteToFavUsecase;
  DeleteRouteFromFav deleteRouteFromFav;
  BusLocationUsecase busLocationUsecase;

  List<Routs> routes = [];
  List<Routs> searchRoutes = [];
  List<bool> isFav = [];
  List<Routs> favoriteRoutes = [];
  Routs? route;
  BusLocation? busLocation;

  TextEditingController searchRouteController = TextEditingController();

  void _onRoutsGetAllEvent(
    RoutsGetAllEvent event,
    Emitter emit,
  ) async {
    print('the ddddddd ');
    emit(RoutsGetAllLoadingState());
    final result = await getAllRoutesUsecase.call();
    result.fold((l) {
      print('carlos ${l.message}');
      emit(RoutsGetAllFailState());
    }, (r) {
      log('all routes${r}');
      routes = r;
      isFav = List.generate(r.length, (index) => false);
      favoriteRoutes = routes.where((element) => element.fav == true).toList();
      emit(RoutsGetAllSuccessState());
    });
  }

  void _onRoutsGetByIdEvent(
    RoutsGetByIdEvent event,
    Emitter emit,
  ) async {
    emit(RoutsGetByIdLoadingState());
    final result = await getRouteById.call(event.id);
    result.fold((l) {
      print('the eerrrroorrr ${l.message}');
      emit(RoutsGetByIdFailState());
    }, (r) {
      print('the rrrrrrrrr idididid ${r}');
      route = r;

      Timer.periodic(const Duration(seconds: 10), (timer) {
        log('Timerrrrrrrr $timer');
        add(RoutesGetBusLocationEvent(r.buses.first.id));
      });
      emit(RoutsGetByIdSuccessState(route!));
    });
  }

  void _onRoutsSearchEvent(
    RoutsSearchEvent event,
    Emitter emit,
  ) async {
    emit(RoutsSearchPointsLoadingState());
    searchRoutes = routes
        .where((element) =>
            element.startName.toLowerCase().contains(event.val.toLowerCase()) ||
            element.endName.toLowerCase().contains(event.val.toLowerCase()))
        .toList();
    log('the search Routes is $searchRoutes');
    emit(RoutsSearchPointsSuccessState());
  }

  void _onRoutesGetBusLocationEvent(
    RoutesGetBusLocationEvent event,
    Emitter emit,
  ) async {
    emit(RoutsGetBusLocationLoadingState());
    final result = await busLocationUsecase.call(event.busId);
    result.fold((l) {
      print('BUS LOCATION GOT FAIL ${l.message}');
      emit(RoutsGetBusLocationFailState());
    }, (r) {
      print('BUS LOCATION GOT SUCCESSFULLY');
      busLocation = r;
      emit(RoutsGetBusLocationSuccessState());
    });
  }

  void _onRoutesAddNewRouteToFavoritesEvent(
    RoutesAddNewRouteToFavoritesEvent event,
    Emitter emit,
  ) async {
    emit(RoutsAddNewRouteToFavLoadingState());
    routes[event.index].fav = !routes[event.index].fav;
    final result = await addRouteToFavUsecase.call(event.routeId);
    result.fold((l) {
      routes[event.index].fav = !routes[event.index].fav;
      emit(RoutsAddNewRouteToFavFailState());
    }, (r) {
      showToast(text: "Add Successfully", state: ToastState.SUCCESS);
      emit(RoutsAddNewRouteToFavSuccessState());
    });
  }

  void _onRoutesDeleteNewRouteToFavoritesEvent(
    RoutesDeleteNewRouteToFavoritesEvent event,
    Emitter emit,
  ) async {
    emit(RoutsDeleteRouteFromFavLoadingState());
    routes[event.index].fav = !routes[event.index].fav;
    final result = await deleteRouteFromFav.call(event.routeId);
    result.fold((l) {
      routes[event.index].fav = !routes[event.index].fav;
      emit(RoutsDeleteRouteFromFavFailState());
    }, (r) {
      showToast(text: "Remove Successfully", state: ToastState.SUCCESS);
      emit(RoutsDeleteRouteFromFavSuccessState());
    });
  }

  void _onRoutesGetAllRouteToFavoritesEvent(
    RoutesGetAllRouteToFavoritesEvent event,
    Emitter emit,
  ) async {
    emit(RoutsGetAllFavoritesRouteLoadingState());
    final result = await getAllFavRoutesUsecase.call();
    result.fold((l) {
      print('the llll is ${routes}');
      print('the llll is ${l.message}');
      favoriteRoutes = routes.where((element) => element.fav == true).toList();
      emit(RoutsGetAllFavoritesRouteFailState());
    }, (r) {
      favoriteRoutes = r;
      print('the rout in fav is ${favoriteRoutes}');
      emit(RoutsGetAllFavoritesRouteSuccessState());
    });
  }
}
