import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/menus/controllers/location_controller.dart';

class EnableGpsPage extends StatelessWidget {
  const EnableGpsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationController());

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return Text(
            controller.message.value,
            style: titleStyleLight,
          );
        }),
        const SizedBox(
          height: 25,
        ),
        Obx(() {
          if (controller.isGPSEnabled.value &&
              !controller.isGPSPermsionGranted.value) {
            return CustomElevatedButton(
                btText: "Solicitar Acceso",
                onPressed: () {controller.requestGPSAccess();},
                btStyle: primaryButton);
          }else{
            return Container();
          }
        })

      ],
    ));
  }
}
