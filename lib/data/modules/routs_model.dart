import 'package:transjo/data/modules/stop_points_model.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/domain/entites/stop_points.dart';

class RoutsModel extends Routs {
  const RoutsModel({
    required super.id,
    required super.startName,
    required super.endName,
    required super.fare,
    required super.stopPoints,
  });

  factory RoutsModel.fromJson(Map<String, dynamic> json) {
    return RoutsModel(
      id: json['id'],
      startName: json['startName'],
      endName: json['endName'],
      fare: json['fare'],
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
