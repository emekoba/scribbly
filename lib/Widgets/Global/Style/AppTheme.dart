import 'package:flutter/material.dart';

List<int> colors = [
  0xffEEDD82,
  0xfff032e6,
  0xfffabebe,
  0xff008080,
  0xffe6beff,
  0xff9a6324,
  0xfffffac8,
  0xff800000,
  0xffaaffc3,
  0xff808000,
  0xffffd8b1,
  0xff000075,
  0xff808080,
  // 0xffffffff,
  0xff3cb44b,
  0xff000000,
  0xfff58231,
  0xffe6194b,
  0xff911eb4,
  0xff46f0f0,
  0xffffe119,
  0xff4363d8,
  0xffdd82ee,
  0xffbcf60c,
  0xff1A1A1A,
];

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      accentColor: Colors.grey,
      scaffoldBackgroundColor: Color.fromRGBO(231, 238, 241, 0.938),
      iconTheme: IconThemeData(color: Colors.black),
      buttonColor: Colors.blue,
      //
      textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Emporia",
              letterSpacing: 1),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Sailor",
              letterSpacing: 1),
          headline3: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.8,
              height: 1.8,
              fontFamily: "Helvetica"),
          headline4:
              TextStyle(fontFamily: "Blanco", fontWeight: FontWeight.bold),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              letterSpacing: 1.8),
          headline6: TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: "Sebino",
            // height: 1.8,
            // letterSpacing: 1.8,
          )));

  static final ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xff1D212B),
      accentColor: Color(0xff4a4a58),
      scaffoldBackgroundColor: Color(0xff4a4a58),
      iconTheme: IconThemeData(color: Color(0xff1D212B)),
      buttonColor: Colors.amberAccent,
      //
      textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Emporia",
              letterSpacing: 1),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Sailor",
              letterSpacing: 1),
          headline3: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.8,
              height: 1.8,
              fontFamily: "Helvetica"),
          headline4:
              TextStyle(fontFamily: "Blanco", fontWeight: FontWeight.bold),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              letterSpacing: 1.8),
          headline6: TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: "Sebino",
            // height: 1.8,
            // letterSpacing: 1.8,
          )));
}
