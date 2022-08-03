import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

class MyTheme {
  MyTheme({
    this.brightness,
    this.backgroundColor,
    this.scaffoldBackgroundColor,
    this.primaryColor,
    this.primaryColorBrightness,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.accentColor,
  });

  Brightness? brightness;
  Color? backgroundColor = Colors.black;
  Color? scaffoldBackgroundColor;
  Color? primaryColor;
  Color? splashColor;
  Brightness? primaryColorBrightness;
  Color? accentColor;
  Color? highlightColor;
  Color? hoverColor;
}

class AppTheme {
  AppTheme(this.name, this.theme);

  String name;
  MyTheme theme;
}

ThemeData buildThemeData(AppTheme appTheme) {
  return ThemeData(
    platform: TargetPlatform.android,
    brightness: appTheme.theme.brightness,
    backgroundColor: appTheme.theme.backgroundColor,
    scaffoldBackgroundColor: appTheme.theme.scaffoldBackgroundColor,
    primaryColor: appTheme.theme.primaryColor,
    primaryColorBrightness: appTheme.theme.primaryColorBrightness,
    accentColor: appTheme.theme.accentColor,
    splashColor: appTheme.theme.splashColor,
    highlightColor: appTheme.theme.highlightColor,
    hoverColor: appTheme.theme.highlightColor,
  );
}

List<AppTheme> myThemes = [
  AppTheme(
      'Light',
      MyTheme(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        accentColor: Color(0xff060F17),
        scaffoldBackgroundColor: Colors.white,
      )),
  AppTheme(
    'Dark',
    MyTheme(
      brightness: Brightness.dark,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      accentColor: Color(0xffFFFFFF),
      scaffoldBackgroundColor: Colors.black,
    ),
  ),
];
