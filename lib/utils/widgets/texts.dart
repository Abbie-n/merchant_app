import 'package:flutter/material.dart';

class FWt {
  FWt();

  static FontWeight extraLight = FontWeight.w200;
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight semiBold = FontWeight.w500;
  static FontWeight mediumBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
}

class Styles {
  static Text regular(
    String text, {
    double? fontSize = 14,
    Color? color,
    TextAlign? align = TextAlign.left,
    String? fontFamily,
  }) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.regular,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  static Text medium(
    String text, {
    double? fontSize = 14,
    Color? color,
    TextAlign? align = TextAlign.left,
    String? fontFamily,
  }) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.mediumBold,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  static Text semiBold(
    String text, {
    double? fontSize = 14,
    Color? color,
    TextAlign? align = TextAlign.left,
    String? fontFamily,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.semiBold,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  static Text bold(
    String text, {
    double? fontSize = 14,
    Color? color,
    TextAlign? align = TextAlign.left,
    String? fontFamily,
  }) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.bold,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  static TextSpan spanSemiBold(
    String text, {
    double? fontSize = 14,
    Color? color,
  }) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: FWt.semiBold,
        color: color,
      ),
    );
  }
}
