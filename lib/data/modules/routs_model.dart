import 'package:transjo/data/modules/buses_model.dart';
import 'package:transjo/data/modules/stop_points_model.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/entites/stop_points.dart';

class RoutsModel extends Routs {
  const RoutsModel({
    required super.id,
    required super.startName,
    required super.end,
    required super.startLat,
    required super.startLng,
    required super.endLat,
    required super.endlng,
    required super.fare,
    required super.stopPoints,
    required super.buses,
  });

  factory RoutsModel.fromJson(Map<String, dynamic> json) {
    print('hte dkdkdkdkdkxxxxxxx ${json}');
    return RoutsModel(
      id: json['id'],
      startName: json['startname'],
      end: json['end'],
      startLat: json['startLat'],
      startLng: json['startlng'],
      endLat: json['endlat'],
      endlng: json['endlng'],
      fare: json['fare'],
      buses: json['buses'] == null
          ? []
          : List<BusesModel>.from(
        (json['buses'] as List).map(
              (e) => BusesModel.fromJson(e),
        ),
      ),
      stopPoints: json['stopPoints'] == null
          ? []
          : List<StopPoints>.from(
              (json['stopPoints'] as List).map(
                (e) => StopPointsModel.fromJson(e),
              ),
            ),
    );
  }
}
