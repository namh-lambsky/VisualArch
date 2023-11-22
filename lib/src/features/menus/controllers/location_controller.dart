import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:visualarch_v1/src/constants/other_constants.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.put(LocationController());

  @override
  void onInit() {
    super.onInit();
    init();
  }

  late Position currentLocation;
  late CameraPosition cameraPosition;

  RxBool isLoading = true.obs;
  RxBool isGPSEnabled = false.obs;
  RxBool isGPSPermsionGranted = false.obs;

  Rx<LatLng> center = LatLng(0, 0).obs;

  LatLng origin = LatLng(0, 0);
  LatLng destination = LatLng(0, 0);
  RxString message = "".obs;

  RxMap<PolylineId,Polyline> polylines= <PolylineId,Polyline>{}.obs;

  Future<void> init() async {
    final gpsInitStatus =
        await Future.wait([_checkGpsStatus(), _isPermissionGranted()]);

    isGPSEnabled.value = gpsInitStatus[0];
    isGPSPermsionGranted.value = gpsInitStatus[1];
    if (isGPSEnabled.value && !isGPSPermsionGranted.value) {
      message.value =
          "Conceda permisos de ubicación a la app poder acceder al servicio";
    } else {
      message.value = "Activa el GPS de celular para acceder al servicio";
    }

    if (isGPSEnabled.value && isGPSPermsionGranted.value) {
      setCameraToUserCurrentLocation();
      _userLocation().then((value) {
        origin = value;
      });
    }
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _checkGpsStatus() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index) == 1 ? true : false;
      isGPSEnabled.value = isEnabled;
      if (isGPSEnabled.value && !isGPSPermsionGranted.value) {
        message.value =
            "Conceda permisos de ubicación a la app poder acceder al servicio";
      } else {
        message.value = "Activa el GPS de celular para acceder al servicio";
      }
    });

    return isEnabled;
  }

  Future<void> requestGPSAccess() async {
    final status = await Permission.locationWhenInUse.request();

    switch (status) {
      case PermissionStatus.granted:
        isGPSPermsionGranted.value = true;
        break;

      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        isGPSPermsionGranted.value = false;
        openAppSettings();
        break;
    }
  }

  Future<Position> locateUser() {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<LatLng> _userLocation() async {
    final snapshot = await locateUser();
    return LatLng(snapshot.latitude, snapshot.longitude);
  }

  setCameraToUserCurrentLocation() async {
    currentLocation = await locateUser();
    center.value = LatLng(currentLocation.latitude, currentLocation.longitude);
    cameraPosition = CameraPosition(target: center.value, zoom: 14.4746);
    isLoading.value = false;
  }

  Future<void> getLocationGivenAddress(String address) async {
    List<Location> locations = await locationFromAddress(address);
    final place = locations[0];

    destination = LatLng(place.latitude, place.longitude);
  }

  Future<List<LatLng>> getPolylinesPoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    print (origin);
    print(destination);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      });
    } else {
      print(result.errorMessage);
    }
    print(polylineCoordinates);
    return polylineCoordinates;
  }

  void generatePolylinesFromPoints(List<LatLng> polylineCoordinates) async{
    PolylineId id = const PolylineId("route");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.green,
        points: polylineCoordinates,
        width: 8);
    polylines.addAll({id:polyline});
  }
}
