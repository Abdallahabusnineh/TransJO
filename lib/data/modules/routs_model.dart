import 'dart:developer';

import 'package:transjo/data/modules/stop_points_model.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/entites/stop_points.dart';

import 'buses_model.dart';

class RoutsModel extends Routs {
   RoutsModel({
    required super.id,
    required super.startName,
    required super.endName,
    required super.fare,
    required super.stopPoints,
    required super.buses,
    required super.fav,
  });

  factory RoutsModel.fromJson(Map<String, dynamic> json) {
    log('the ssssss dddd json ${json}');
    return RoutsModel(
      id: json['id'],
      startName: json['startName'],
      endName: json['endName'],
      fare: json['fare'],
      fav: json['fav'],
      stopPoints: json['stopPoints'] == null
          ? []
          : List<StopPoints>.from(
              (json['stopPoints'] as List).map(
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
