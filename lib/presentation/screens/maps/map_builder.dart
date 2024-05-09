import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:transjo/presentation/blocs/maps/maps_bloc.dart';

class MapBuilder extends StatefulWidget {
  MapBuilder({super.key, required this.onMapCreated});

  void Function(GoogleMapController)? onMapCreated;

  @override
  State<MapBuilder> createState() => _MapBuilderState();
}

class _MapBuilderState extends State<MapBuilder> {
  List<LatLng> polylineCoordinates = [];

  ///TODO [Carlos]:::: handel it in weekend
  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyD8TtKOU4l9Ys5hhclOg9w70pO1uWzi5BU",
  //     const PointLatLng(31.9570, 35.9549),
  //     const PointLatLng(31.9635, 35.9085),
  //   );
  //   print('the result is ${result}');
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (element) {
  //         polylineCoordinates.add(LatLng(element.latitude, element.longitude));
  //       },
  //     );
  //     setState(
  //       () {},
  //     );
  //   }
  // }

  @override
  void initState() {
    // getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MapsBloc bloc = context.read<MapsBloc>();
    return BlocConsumer<MapsBloc, MapsState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('the statae sisisiis ${state} ||| ${bloc.currentPosition}');
        if (bloc.currentPosition == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GoogleMap(
          onMapCreated: widget.onMapCreated,
          polylines: {
            Polyline(
                polylineId: PolylineId("Firstone"),
                points: polylineCoordinates,
                color: Colors.red,
                width: 10)
          },
          markers: {
            const Marker(
              markerId: MarkerId("start"),
              position: LatLng(31.9570, 35.9549),
            ),
            const Marker(
              markerId: MarkerId("end"),
              position: LatLng(31.9635, 35.9085),
            )
          },
          compassEnabled: true,
          myLocationButtonEnabled: true,
          buildingsEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              bloc.currentPosition!.latitude,
              bloc.currentPosition!.longitude,
            ),
            zoom: 15.0,
          ),
        );
      },
    );
  }
}
