import 'package:equatable/equatable.dart';

import 'stop_points.dart';

class Routs extends Equatable {
  final int id;
  final String startName;
  final String endName;
  final double fare;
  final List<StopPoints> stopPoints;

  const Routs({
    required this.id,
    required this.startName,
    required this.endName,
    required this.fare,
    required this.stopPoints,
  });

  @override
  List<Object?> get props => [
        id,
        startName,
        fare,
        stopPoints,
      ];
}
