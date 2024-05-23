import 'package:equatable/equatable.dart';

import 'buses.dart';
import 'stop_points.dart';

class Routs {
  final int id;
  final String startName;
  final String endName;
  final num fare;
  final List<StopPoints> stopPoints;
  final List<Buses> buses;
  bool fav;

   Routs({
    required this.id,
    required this.startName,
    required this.endName,
    required this.fare,
    required this.stopPoints,
    required this.buses,
    required this.fav,
  });

}
