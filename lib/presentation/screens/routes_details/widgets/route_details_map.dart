import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:transjo/core/utils/app_constanse.dart';
import 'package:transjo/core/utils/tools.dart';
import 'package:transjo/domain/entites/routs.dart';
import 'package:transjo/presentation/blocs/maps/maps_bloc.dart';

class RouteDetailsMap extends StatefulWidget {
  const RouteDetailsMap({super.key, required this.route});

  final Routs route;

  @override
  State<RouteDetailsMap> createState() => _RouteDetailsMapState();
}

class _RouteDetailsMapState extends State<RouteDetailsMap> {
  final Location _locationController = Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static LatLng _pGooglePlex = LatLng(0, 0);
  static LatLng _applePark = LatLng(0, 0);
  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    _pGooglePlex = LatLng(widget.route.startLat, widget.route.startLng);
    _applePark = LatLng(widget.route.endLat, widget.route.endlng);
    getLocationUpdates().then((_) => (
          getPolyLinePoints().then((polylineCoordinates) =>
              (generatePolyLineFromPoints(polylineCoordinates))),
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MapsBloc bloc = context.read<MapsBloc>();
    return SizedBox(
      height: 40.h,
      child: BlocConsumer<MapsBloc, MapsState>(
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
              _mapController.complete(controller);
              bloc.setterNewGoogleController = controller;
            },
            polylines: Set<Polyline>.of(polylines.values),
            markers: {
               Marker(
                markerId: MarkerId("_55"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pGooglePlex,
              ),
               Marker(
                markerId: MarkerId("_44"),
                icon: BitmapDescriptor.defaultMarker,
                position: _applePark,
              ),
              // Marker(
              //   markerId: MarkerId("carlos"),
              //   position: LatLng(bloc.currentPosition!.latitude,
              //       bloc.currentPosition!.longitude),
              // ),
            },
            compassEnabled: true,
            myLocationButtonEnabled: true,
            buildingsEnabled: true,
            myLocationEnabled: true,

            initialCameraPosition: CameraPosition(
              target: LatLng(
                _pGooglePlex.latitude,
                _pGooglePlex.longitude,
              ),
              zoom: 15.0,
            ),

          );
        },
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPotion = CameraPosition(target: pos, zoom: 11);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPotion));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          // _currentP =
          //     LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_pGooglePlex);
        });
      }
    });
  }

  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAP_API_KEY,
        PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
        PointLatLng(_applePark.latitude, _applePark.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print("ERROR POLYLINE : ${result.errorMessage}");
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
