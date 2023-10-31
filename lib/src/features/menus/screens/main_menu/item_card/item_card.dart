import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:simple_fx/simple_fx.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class ItemCard extends StatelessWidget {
  final String builderName;
  final String builderLogoPath;
  final String projectName;
  final String projectLogoPath;
  final String imagePath;
  final String city;
  final double price;
  final int area;

  const ItemCard({
    Key? key,
    required this.builderName,
    required this.builderLogoPath,
    required this.projectName,
    required this.imagePath,
    required this.projectLogoPath,
    required this.city,
    this.price = 0,
    this.area = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: context.layout.maxWidth - 20,
          color: Colors.grey[300],
          child: Column(
            children: [
              Stack(
                children: [
                  SimpleFX(
                    imageSource: Image.asset(
                      imagePath,
                    ),
                    brightness: -25,
                  ),
                  Positioned(
                    bottom: 2,
                    left: 8,
                    child: Text(
                      "Desde: \$ $price",
                      style: subtitleStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 69,
                    child: Image.asset(projectLogoPath),
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
                      Text(
                        projectName,
                        style: subtitleStyleSB,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Area m^2",
                        style: subtitleStyleSB,
                      ),
                      Text(
                        area.toString(),
                        style: subtitleStyleSB,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
