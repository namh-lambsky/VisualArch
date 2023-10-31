import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:visualarch_v1/src/common_widgets/modal/modal_image.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

import '../../constants/images_strings.dart';

class UserImage extends StatelessWidget {
  //final Function(String imageUrl) onFileChanged;

  UserImage({
    Key? key,
    /*required this.onFileChanged*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    String? imageUrl = "";

    return Column(
      children: <Widget>[
        Stack(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: imageUrl == ""
                    ? Center(
                        child: SvgPicture.asset(
                          accIcon,
                          width: 150,
                          height: 150,
                        ),
                      )
                    : Text(
                        "ola",
                        style: titleStyle,
                      ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const ModalImage(),
                          backgroundColor: backgroundColor);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
