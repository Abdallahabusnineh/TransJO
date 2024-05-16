import 'package:equatable/equatable.dart';

class StopPoints extends Equatable {
  final int id;
  final String stopName;
  final double lat;
  final double lng;

  const StopPoints(
      {required this.id,
      required this.stopName,
      required this.lat,
      required this.lng});

  @override
  List<Object?> get props => [
        id,
        stopName,
        lat,
        lng,
      ];
}
