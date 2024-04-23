import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle _getTextStyle({
  required double fontSize,
  String? fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required TextDecoration decoration,
  double? height,
  TextOverflow? overflow,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily ?? FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    height: height ?? 1,
    overflow: overflow ?? TextOverflow.ellipsis,
  );
}

//* light style
TextStyle getLightStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

//* regular style
TextStyle getRegularStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

//* medium style
TextStyle getMediumStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

//* semi bold style
TextStyle getSemiBoldStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

//* bold text style
TextStyle getBoldStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

//* extra bold style
TextStyle getExtraBoldStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.extraBold,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

//* black style
TextStyle getBlackStyle({
  double fontSize = 12,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  double? height,
  TextOverflow? overflow,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.black,
    color: color,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

class FontConstants {
  static const String fontFamily = 'Urbanist';
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
