import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/common_widgets/missing/no_data.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/menus/controllers/project_controller.dart';

import '../item_card/building_project_card.dart';

class BuilderPageMobile extends StatelessWidget {
  final String builderName;

  const BuilderPageMobile({
    required this.builderName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);
    final controller = Get.put(ProjectController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(
        hasBackButton: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getAllProjectsByCompanyName(builderName);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(padding * 4),
                //EdgeInsets.only(top: padding* 4.0,left: padding* 4.0,right: padding* 4.0),
                child: Text(
                  "Proyectos de vivienda de $builderName",
                  style: titleStyle,
                ),
              ),
              Container(
                height: 610,
                child: FutureBuilder(
                  future: controller.getAllProjectsByCompanyName(builderName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {

                        return snapshot.data!.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (c, index) {
                                  return BuildingProjectCard(
                                    projectName: snapshot.data![index].name,
                                    images: snapshot.data![index].images,
                                    projectLogoPath:
                                        snapshot.data![index].projectLogoURL,
                                    city: snapshot.data![index].city,
                                    area: snapshot.data![index].area,
                                    price: snapshot.data![index].price,
                                    towers: snapshot.data![index].towers,
                                    availableUnits: snapshot.data![index].availableUnits,
                                  );
                                },
                              )
                            : const NoData();
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error! ${snapshot.error.toString()}",
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
                  },
                  //ListView.builder(shrinkWrap: true,itemCount: ,),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
