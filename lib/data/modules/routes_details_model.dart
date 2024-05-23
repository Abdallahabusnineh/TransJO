import 'dart:developer';

import 'package:transjo/data/modules/buses_model.dart';
import 'package:transjo/data/modules/stop_points_model.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/entites/stop_points.dart';

class RoutesDetailModel extends Routs {
  RoutesDetailModel(
      {required super.id,
      required super.startName,
      required super.endName,
      required super.fare,
      required super.stopPoints,
      required super.buses,
      required super.fav});

  factory RoutesDetailModel.fromJson(Map<String, dynamic> json) {
    log('the ssssss dddd json ${json['route']}');
    log('the ssssss dddd json ${json['route']['stopPoints']}');
    log('the ssssss dddd json ${json['route']['id'].runtimeType}');

    return RoutesDetailModel(
      id: json['route']['id'],
      startName: json['route']['startName'],
      endName: json['route']['endName'],
      fare: json['route']['fare'],
      fav: json['route']['fav']??false,
      stopPoints: json['route']['stopPoints'] == null
          ? []
          : List<StopPoints>.from(
              (json['route']['stopPoints'] as List).map(
                (e) => StopPointsModel.fromJson(e),
              ),
            ),
      buses: json['buses'] == null
          ? []
          : List<BusesModel>.from(
              (json['buses'] as List).map(
                (e) => BusesModel.fromJson(e),
              ),
            ),
    );
  }
}
