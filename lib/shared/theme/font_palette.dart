import 'package:chat_app/shared/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontPalette {
  static const themeFont = "Poppins";

  static TextTheme get textLightTheme {
    return Typography.englishLike2018.apply(
      fontSizeFactor: 0.8.sp,
      bodyColor: kBlack,
      fontFamily: FontPalette.themeFont,
    );
  }

  static TextStyle get hW700S23 => TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: kBlack,
  );

  static TextStyle get hW500S18 => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: kBlack,
  );

  static TextStyle get hW800S26 => TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: 0,
    color: kBlack,
  );

  static TextStyle get hW700S20 => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: kBlack,
  );

  static TextStyle get hW700S16 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, letterSpacing: 0);
  static TextStyle get hW700S18 =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, letterSpacing: 0);
  static TextStyle get hW500S16CGrey => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: Color(0xff666C6D),
  );

  static TextStyle get hW700S14 =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700);

  static TextStyle get hW400S14 =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0);

  static TextStyle get hW600S14 =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, letterSpacing: 0);
  static TextStyle get hW600S16 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: 0);
  static TextStyle get hW600S20 =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, letterSpacing: 0);
  static TextStyle get hW600S28 =>
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, letterSpacing: 0);
  static TextStyle get hW600S12 =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, letterSpacing: 0);

  static TextStyle get hW700S13 =>
      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, letterSpacing: 0);
  static TextStyle get hW700S12 =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, letterSpacing: 0);
  static TextStyle get hW400S13 =>
      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, letterSpacing: 0);

  static TextStyle get hW600S13 =>
      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, letterSpacing: 0);

  static TextStyle get hW700S9 =>
      TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w700, letterSpacing: 0);

  static TextStyle get hW600S11 =>
      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, letterSpacing: 0);

  static TextStyle get hW500S14 =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, letterSpacing: 0);

  static TextStyle get hW800S16 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800, letterSpacing: 0);

  static TextStyle get hW800S20 =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800, letterSpacing: 0);

  static TextStyle get hW500S13 =>
      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, letterSpacing: 0);

  static TextStyle get hW500S11 =>
      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, letterSpacing: 0);

  static TextStyle get hW500S10 =>
      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500, letterSpacing: 0);

  static TextStyle get hW500S12 =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, letterSpacing: 0);
  static TextStyle get hW300S16 =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, letterSpacing: 0);
  static TextStyle get hW500S16 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 0);

  static TextStyle get hW400S10 =>
      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, letterSpacing: 0);

  static TextStyle get hW700S11 =>
      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700, letterSpacing: 0);

  static TextStyle get hW700S26 =>
      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700, letterSpacing: 0);
}
