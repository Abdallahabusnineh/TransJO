import 'package:transjo/domain/entites/buses.dart';

class BusesModel extends Buses {
  const BusesModel(
      {required super.id,
      required super.ownerName,
      required super.routeNeme,
      required super.capacity,
      required super.lat,
      required super.lng,
      required super.working, required super.price});

  factory BusesModel.fromJson(Map<String, dynamic> json) {
    return BusesModel(
      id: json['id'],
      ownerName: json['ownerName'],
      routeNeme: json['routeName'],
      capacity: json['capacity'],
      price: json['currentCapacity'],
      lat: json['lat'],
      lng: json['lng'],
      working: json['working'],
    );
  }
}
