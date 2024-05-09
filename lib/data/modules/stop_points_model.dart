import 'package:transjo/domain/entites/stop_points.dart';

class StopPointsModel extends StopPoints {
  const StopPointsModel(
      {required super.id,
      required super.stopName,
      required super.lat,
      required super.lng});

  factory StopPointsModel.fromJson(Map<String, dynamic> json) {
    return StopPointsModel(
        id: json['id'], stopName: json['stopName'], lat: json['latitude'], lng: json['longitude']);
  }
}
