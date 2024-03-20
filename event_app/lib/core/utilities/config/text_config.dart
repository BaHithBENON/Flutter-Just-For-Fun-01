import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../variables/fonts_names.dart';

class TextConfig {
  static TextStyle getSimpleTextStyle(
    bool bold, {
    Color? color,
    int? size,
    bool withFont = true,
    String? font,
    bool underline = false,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    FontStyle? fontStyle,
    Paint? foreground,
  }) {
    return TextStyle(
      fontFamily: withFont ? ( font ?? FontsNames.fontMono) : null,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: size != null ? (size == 3 ? 10 : size.toDouble()) : null,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      fontStyle: fontStyle,
      foreground: foreground,
    );
  }

  static TextStyle getGoogleStyle(
    String font, {
    Color? color,
    bool bold = false,
    int? size,
    bool underline = false,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    FontStyle? fontStyle,
    Paint? foreground,
  }) {
    return GoogleFonts.getFont(
      font, 
      textStyle: getSimpleTextStyle(
        bold,
        color: color,
        size: size,
        underline: underline,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        fontStyle: fontStyle,
        foreground: foreground,
      ),
    );
  }

  static RegExp regExpForRemoveHTMLTags = RegExp(r"<[^>]*>");
  static RegExp nbsp = RegExp(r"&nbsp;");

  static String textWorker(String str) {
    String option1 = str.replaceAll(TextConfig.regExpForRemoveHTMLTags, "");
    String option2 = option1.replaceAll(TextConfig.nbsp, " ");
    return option2;
  }
}
