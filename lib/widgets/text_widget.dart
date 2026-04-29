import 'package:flutter/material.dart';

Widget textWidget({
  required String title,
  required Color textColor,
  required String fontFamily,
  required FontWeight fontWeight,
  required double fontSize,
  double? blurRadius,
  double? height,
  Color? shadowColor,
  Offset? offset,
  TextDecoration? decoration,
  TextOverflow? overflow,
  double? wordSpacing,
  TextBaseline? textBaseline,
  TextAlign? textAlign,
  FontStyle? fontStyle,
  double? letterSpacing,
  int? maxLines,
}) {
  return Text(
    title,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow ?? TextOverflow.visible,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: textColor,
      decoration: decoration ?? TextDecoration.none,
      height: height,
      textBaseline: textBaseline,
      fontStyle: fontStyle ?? FontStyle.normal,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      shadows: [
        Shadow(
          color: shadowColor ?? Colors.transparent,
          blurRadius: blurRadius ?? 0,
          offset: offset ?? Offset.zero,
        )
      ],
    ),
  );
}
