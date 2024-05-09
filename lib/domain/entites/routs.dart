import 'package:equatable/equatable.dart';
import 'buses.dart';
import 'stop_points.dart';
class Routs extends Equatable {
  final int id;
  final String startName;
  final String end;
  final double startLat;
  final double startLng;
  final double endLat;
  final double endlng;
  final double fare;
  final List<StopPoints> stopPoints;
  final List<Buses> buses;
  const Routs({
    required this.id,
    required this.startName,
    required this.end,
    required this.startLat,
    required this.startLng,
    required this.endLat,
    required this.endlng,
    required this.fare,
    required this.stopPoints,
    required this.buses,
  });

  @override
  List<Object?> get props => [
        id,
        startName,
        end,
        startLat,
        startLng,
        endLat,
        endlng,
        fare,
        stopPoints,
        buses,
      ];
}
