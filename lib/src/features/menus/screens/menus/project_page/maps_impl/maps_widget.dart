import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/menus/controllers/location_controller.dart';
import 'package:visualarch_v1/src/features/menus/screens/menus/project_page/maps_impl/enable_gps_page.dart';

class MapsWidget extends StatelessWidget {
  final String projectAddress;

  const MapsWidget({
    required this.projectAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> googleMapController =
        Completer<GoogleMapController>();

    final controller = Get.put(LocationController());

    return Obx(() {
      if (controller.isGPSEnabled.value &&
          controller.isGPSPermsionGranted.value) {
        return showMap(controller, googleMapController);
      } else {
        return const EnableGpsPage();
      }
    });
  }

  Widget showMap(LocationController controller,
      Completer<GoogleMapController> googleMapController) {

    controller.userLocation().then((value) {
      controller.origin=value;
      controller.getLocationGivenAddress(projectAddress).then((_) {
        controller.getPolylinesPoints().then((coordinates) {
          controller.generatePolylinesFromPoints(coordinates);
        });
      });
    });

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: Column(
            children: [
              Text("Cargando Google Maps...", style: titleStyleLight),
              SizedBox(
                height: 15,
              ),
              CircularProgressIndicator(),
            ],
          ),
        );
      } else {
        final originLocation = controller.origin;
        final destination = controller.destination;

        return SizedBox(
            height: 600,
            child: GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  googleMapController.complete(controller)),
              initialCameraPosition: controller.cameraPosition,
              markers: {
                Marker(
                    markerId: const MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: originLocation),
                Marker(
                    markerId: const MarkerId("_destination"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: destination),
              },
              polylines: Set<Polyline>.of(controller.polylines.values),
            ));
      }
    });
  }
}
