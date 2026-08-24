import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _interTextStyle({
  required final double fontSize,
  required final FontWeight fontWeight,
  required final double height,
  required final double letterSpacing,
}) {
  if (!GoogleFonts.config.allowRuntimeFetching) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  return GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height,
    letterSpacing: letterSpacing,
  );
}

TextTheme get textTheme => TextTheme(
  // H1 - Regular 32px
  displayLarge: _interTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0,
  ),

  // H2 - Regular 24px
  displayMedium: _interTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0,
  ),

  // Body - Regular 16px
  bodyLarge: _interTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  ),

  // Caption 2 - Regular 14px
  bodyMedium: _interTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  ),

  // Caption - Regular 10px
  labelSmall: _interTextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0,
  ),
);
