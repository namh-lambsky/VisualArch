import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/styles.dart';

class ProfileListWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  const ProfileListWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.endIcon = true,
      this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.transparent),
        child: Icon(
          icon,
          color: textColor,
          size: 35,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: textColor, fontFamily: 'Regular'),
      ),
      trailing: endIcon?Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.transparent),
        child: Icon(
          LineAwesomeIcons.angle_right,
          color: textColor,
          size: 30,
        ),
      ):null
    );
  }
}
