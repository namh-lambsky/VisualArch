import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final bool isWeb;
  final String url;
  final bool isRounded;
  final bool brightnessDown;

  const ImageWidget({
    required this.url,
    this.isWeb = false,
    this.brightnessDown = false,
    this.isRounded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
          borderRadius:
              isRounded ? BorderRadius.circular(25) : BorderRadius.zero,
          child:
              Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: isWeb
                          ? NetworkImage(url)
                          : AssetImage(url) as ImageProvider),
                ),
              ),
              brightnessDown? Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.65, 1.0],
                  ),
                ),
              ):Container()
            ],
          )),
    );
  }
}
