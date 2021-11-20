import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle textSize12(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontSize: 12,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize14(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize16(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize18(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
      fontSize: 18,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize20(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontSize: 20,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize22(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontSize: 22,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize24(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontSize: 24,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSize26(
      {Color color = AppColors.cherryPie,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
      fontSize: 26,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textSizeCustom(
      {Color color = AppColors.cherryPie,
      double size = 20,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }
}
