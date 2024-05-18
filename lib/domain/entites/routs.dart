import 'package:equatable/equatable.dart';

import 'buses.dart';
import 'stop_points.dart';

class Routs extends Equatable {
  final int id;
  final String startName;
  final String endName;
  final double fare;
  final List<StopPoints> stopPoints;
  final List<Buses> buses;

  const Routs({
    required this.id,
    required this.startName,
    required this.endName,
    required this.fare,
    required this.stopPoints,
    required this.buses,
  });

  @override
  List<Object?> get props => [
        id,
        startName,
        fare,
        stopPoints,
        buses,
      ];
}
