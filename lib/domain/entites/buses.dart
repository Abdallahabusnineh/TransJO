import 'package:equatable/equatable.dart';

class Buses extends Equatable {
  final int id;
  final String ownerName;
  final String routeNeme;
  final int capacity;
  final double price;
  final double lat;
  final double lng;
  final bool working;

  const Buses(
      {required this.id,
      required this.ownerName,
      required this.routeNeme,
      required this.capacity,
      required this.price,
      required this.lat,
      required this.lng,
      required this.working});

  @override
  List<Object?> get props =>
      [id, ownerName, routeNeme, capacity, lat, lng, working];
}
