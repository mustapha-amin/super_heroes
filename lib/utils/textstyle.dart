import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTextStyle(
  double size, {
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
      fontFamily: 'Montserrat');
}
