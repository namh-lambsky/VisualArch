import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/common_widgets/image_carousel/image_carousel.dart';
import 'package:visualarch_v1/src/common_widgets/separator/custom_separator.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/other_constants.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/menus/controllers/project_controller.dart';
import 'package:visualarch_v1/src/features/menus/models/building_projects_model.dart';
import 'package:visualarch_v1/src/features/menus/screens/menus/project_page/maps_page/maps_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPageMobile extends StatelessWidget {
  final String projectName;

  const ProjectPageMobile({super.key, required this.projectName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectController());
    final double padding = context.layout.value(xs: 8);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(hasBackButton: true, showProfilePhoto: false),
      body: SafeArea(
        child: FutureBuilder(
            future: controller.getProjectByName(projectName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  BuildingProjectModel project = snapshot.data!;
                  return RefreshIndicator(
                    onRefresh: () => controller.loadProject(projectName),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: padding * 4, right: padding * 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    child:
                                        Image.network(project.projectLogoURL)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  project.name,
                                  style: titleStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "Desde:",
                                style: titleStyleLight,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "\$${format.format(project.price)}",
                                style: titleStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text(
                                      "${project.address}, ${project.city}",
                                      style: titleStyleLight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: TextButton.icon(
                                onPressed: () => Get.to(() =>
                                    MapsPage(projectAddress: project.address)),
                                label: const Text(
                                  "Haz clic aquí para saber como llegar",
                                  style: subtitleStyle,
                                ),
                                icon: const Icon(
                                  Icons.help,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                style: textBt,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            buildSecondInfo(project),
                            const SizedBox(
                              height: 15,
                            ),
                            const CustomSeparator(title: "Galería"),
                            ImageCarousel(images: project.images),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomElevatedButton(
                                btText: "Empezar Recorrido",
                                onPressed: () async {
                                  await launchUrl(Uri.parse(project.tourURL),
                                      mode: LaunchMode.inAppBrowserView);
                                },
                                btStyle: primaryButton),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Quieres saber más acerca de este Proyecto de vivienda?",
                              style: paragraphStyle,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {launchUrl(Uri.parse(project.contactURL));},
                              child: const Text(
                                "Haz clic aquí para contactarte con un asesor del proyecto.",
                                style: subtitleStyleS,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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
      ),
    );
  }

  Container buildSecondInfo(BuildingProjectModel project) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey[300]),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const Text(
                    "Area desde",
                    style: subtitleStyleSB,
                  ),
                  Text(
                    "${project.area} m\u00b2",
                    style: subtitleStyleSB,
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: VerticalDivider(
                  color: Colors.grey[600],
                  thickness: 2,
                ),
              ),
              Column(
                children: [
                  const Text(
                    "Torres",
                    style: subtitleStyleSB,
                  ),
                  Text(
                    project.towers != 0 ? "${project.towers}" : "-",
                    style: subtitleStyleSB,
                  ),
                ],
              ),
              SizedBox(
                height: 45,
                child: VerticalDivider(
                  color: Colors.grey[600],
                  thickness: 2,
                ),
              ),
              Column(
                children: [
                  const Text(
                    "Unds.",
                    style: subtitleStyleSB,
                  ),
                  Text(
                    project.availableUnits != 0
                        ? "${project.availableUnits}"
                        : "-",
                    style: subtitleStyleSB,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
