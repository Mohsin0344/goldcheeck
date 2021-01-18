import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFonts {

  static String headerFont = 'QuickSand';
  static String bodyFont = 'QuickSand';

  static googleHeaderFont({var color, var fontSize, var fontWeight, var fontStyle, var letterSpacing, var height, var decoration}) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
          height: height,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        ),
        fontSize: fontSize != null ? fontSize.toDouble() : null,
        fontWeight: fontWeight,
        fontStyle: fontStyle
    );
  }

  static googleBodyFont({var color, var fontSize, var fontWeight, var fontStyle, var letterSpacing, var height, var decoration}) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
          height: height,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        ),
        fontSize: fontSize != null ? fontSize.toDouble() : null,
        fontWeight: fontWeight,
        fontStyle: fontStyle
    );
  }
}


class CustomSizes {
  static const padding = 8.0;
  static const appBarElevation = 0.0;
//  static const appBarElevation = 6.0;
  static const buttonElevation = 6.0;
  static const buttonFontSize = 18.0;
}


