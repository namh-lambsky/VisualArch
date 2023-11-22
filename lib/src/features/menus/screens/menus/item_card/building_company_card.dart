import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import '../builder_page/builder_page.dart';

class BuildingCompanyCard extends StatelessWidget {
  final String builderName;
  final String builderLogoPath;

  const BuildingCompanyCard({
    Key? key,
    required this.builderName,
    required this.builderLogoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>BuilderPage(builderName: builderName,));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: context.layout.maxWidth - 20,
            color: Colors.grey[700],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.white,
                      child: Image.network(
                        builderLogoPath,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  builderName,
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
