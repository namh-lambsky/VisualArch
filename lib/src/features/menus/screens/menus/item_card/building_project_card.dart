import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/image_carousel/image_carousel.dart';
import 'package:visualarch_v1/src/constants/other_constants.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

import '../project_page/project_page.dart';


class BuildingProjectCard extends StatelessWidget {
  final String projectName;
  final String projectLogoPath;
  final List<String> images;
  final String city;
  final double price;
  final int area;
  final int towers;
  final int availableUnits;

  const BuildingProjectCard({
    Key? key,
    required this.projectName,
    required this.images,
    required this.projectLogoPath,
    required this.city,
    this.price = 0,
    this.area = 0,
    this.towers = 0,
    this.availableUnits = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Get.to(() => ProjectPage(projectName: projectName)),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: context.layout.maxWidth - 75,
            color: Colors.grey[300],
            child: Column(
              children: [
                buildCarouselImagesAndPrice(),
                const SizedBox(
                  height: 10,
                ),
                Column(children: [
                  buildPrimaryInfo(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildSecondaryInfo(),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCarouselImagesAndPrice() {


    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          ImageCarousel(images: images,hasPrice: true),
          Positioned(
            bottom: 2,
            left: 8,
            child: Text(
              "Desde: \$${format.format(price)} ",
              style: subtitleStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container buildSecondaryInfo() {
    return Container(
      color: Colors.grey[500],
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
                    "$area m\u00b2",
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
                    towers != 0 ? "$towers" : "-",
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
                    availableUnits != 0 ? "$availableUnits" : "-",
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

  Row buildPrimaryInfo() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Image.network(projectLogoPath),
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: [
            Text(
              city,
              style: subtitleStyleSB,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              projectName,
              style: buttonTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
