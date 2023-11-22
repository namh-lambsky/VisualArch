import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/menus/models/building_company_model.dart';

import 'package:visualarch_v1/src/features/menus/controllers/menu_controller.dart';

import 'item_card/building_company_card.dart';

class MainMenuMobile extends StatelessWidget {
  const MainMenuMobile({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainMenuController());

    double padding = context.layout.value(xs: 8);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(showProfilePhoto: true),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.loadResources();
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding * 4),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() => Text(
                        "Bienvenido, ${controller.userName.value}!",
                        style: subtitleStyle)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Explora recorridos por constructora",
                    style: titleStyle,
                  ),
                ],
              ),
            ),
            Container(
              height: 610,
              child: FutureBuilder<List<BuildingCompanyModel>>(
                  future: controller.getAllCompanies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (c, index) {
                              return BuildingCompanyCard(
                                builderName: snapshot.data![index].name,
                                builderLogoPath:
                                    snapshot.data![index].companyPhotoURL,
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: titleStyle,
                          ),
                        );
                      } else {
                        return const Icon(
                          Icons.error_rounded,
                          color: Colors.red,
                          size: 45,
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
