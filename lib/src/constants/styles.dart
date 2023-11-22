import 'package:flutter/material.dart';
import 'colors.dart';

const TextStyle paragraphStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: 'Thin',
);

const TextStyle extraLightStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: 'ExtraLight',
);

const TextStyle buttonTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontFamily: 'SemiBold',
);

const TextStyle buttonWTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: 'Semibold',
);

const TextStyle titleStyle =
    TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'SemiBold');

const TextStyle titleStyleLight=TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'ExtraLight');

const TextStyle titleBigStyleLight=TextStyle(fontSize: 32,color: Colors.white,fontFamily: 'ExtraLight');

const TextStyle subtitleStyle =
    TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Regular');

const TextStyle subtitleStyleS =
    TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Regular');

const TextStyle subtitleStyleSB =
TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Regular');

InputDecoration textFieldEmailDecoration = InputDecoration(
  prefixIcon: const Icon(Icons.alternate_email),
  hintText: "E-mail",
  enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
    borderSide: BorderSide(color: Colors.red.shade400),
  ),
  fillColor: Colors.grey.shade200,
  filled: true,
);

InputDecoration textFieldNameDecoration = InputDecoration(
  prefixIcon: const Icon(Icons.person),
  hintText: "Nombre Completo",
  enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
    borderSide: BorderSide(color: Colors.red.shade400),
  ),
  fillColor: Colors.grey.shade200,
  filled: true,
);

InputDecoration textFieldPhoneDecoration = InputDecoration(
  prefixIcon: const Icon(Icons.phone),
  hintText: "Telefono móvil",
  enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
    borderSide: BorderSide(color: Colors.red.shade400),
  ),
  fillColor: Colors.grey.shade200,
  filled: true,
);

ButtonStyle primaryButton = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: primaryColor,
    minimumSize: const Size(280, 65));

ButtonStyle warningButton = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.redAccent,
    minimumSize: const Size(160, 55));

ButtonStyle transparentButton = ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent,minimumSize: const Size(60, 60));

ButtonStyle textBt= TextButton.styleFrom(alignment: AlignmentDirectional.topStart,elevation: 0,padding: EdgeInsets.zero);