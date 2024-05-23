import 'package:transjo/domain/entites/bus_location.dart';

class BusLocationModel extends BusLocation {
  BusLocationModel({
    required super.capacity,
    required super.lat,
    required super.lng,
    required super.currentCapacity,
  });

  factory BusLocationModel.fromJson(Map<String, dynamic> json) {
    print('hte json is ${json}');
    return BusLocationModel(
      capacity: json['capacity'],
      lat: json['latitude'],
      lng: json['longitude'],
      currentCapacity: json['current_capacity'],
    );
  }
}
