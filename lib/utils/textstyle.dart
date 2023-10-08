import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

TextStyle kTextStyle(
  double size, {
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontSize: size.sp,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Colors.black,
    fontFamily: 'Montserrat',
  );
}
