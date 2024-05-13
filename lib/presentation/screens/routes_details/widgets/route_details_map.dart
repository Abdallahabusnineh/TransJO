import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/presentation/blocs/maps/maps_bloc.dart';

class RouteDetailsMap extends StatefulWidget {
  const RouteDetailsMap({super.key});

  @override
  State<RouteDetailsMap> createState() => _RouteDetailsMapState();
}

class _RouteDetailsMapState extends State<RouteDetailsMap> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
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
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            bloc.setterNewGoogleController = controller;
          },
          polylines: {
            const Polyline(
                polylineId: PolylineId("Firstone"),
                // points: polylineCoordinates,
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
            ),
            Marker(
              markerId: MarkerId("carlos"),
              position: LatLng(bloc.currentPosition!.latitude,
                  bloc.currentPosition!.longitude),
            ),
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
