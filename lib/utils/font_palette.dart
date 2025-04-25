import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontPalette {
  static const themFont = 'NotoSansKR';

  static TextStyle get blackBold => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle get blackMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle get blackRegular => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
