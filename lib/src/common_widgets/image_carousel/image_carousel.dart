import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

import '../image_widget/image_widget.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;
  final double height;
  final bool hasPrice;
  final bool roundedImage;

  const ImageCarousel({
    required this.images,
    this.height = 400,
    this.hasPrice=false,
    this.roundedImage=false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: images.length,
          itemBuilder: (context, numero, i) {
            return ImageWidget(
              url: images[numero],
              isWeb: true,
              brightnessDown: hasPrice,
              isRounded: roundedImage,
            );
          },
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 1.1,
          ),
        ),
        Positioned(
          top: context.height * 0.09,
          right: context.width * 0.01,
          child: IconButton(
            onPressed: () => carouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear),
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 35,
            ),
            style: transparentButton,
          ),
        ),
        Positioned(
          top: context.height * 0.09,
          left: context.width * 0.01,
          child: IconButton(
            onPressed: () => carouselController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 35,
            ),
            style: transparentButton,
          ),
        )

      ],
    );
  }
}
