import 'package:flutter/material.dart';

class AppTheme{
  static Color PrimaryLight  =Color(0XFF5D9CEC);
  static Color backgroundColorLight=Color(0XFFDFECDB);
  static Color backgroundColorDark=Color(0XFF060E1E);
  static Color Green =Color(0XFF61E757);
  static Color Red =Color(0XFFEC4B4B);
  static Color Black =Color(0XFF141922);
  static Color Grey =Color(0XFFC8C9CB);
  static Color White =Color(0XFFFFFFFF);

  static ThemeData LightTheme = ThemeData(
        scaffoldBackgroundColor: backgroundColorLight,
        primaryColor: PrimaryLight,
        inputDecorationTheme: InputDecorationTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: PrimaryLight,
          centerTitle: true,
          )
        );
      static ThemeData DarkTheme = ThemeData(
        scaffoldBackgroundColor: backgroundColorDark,
        primaryColor: PrimaryLight,
        inputDecorationTheme: InputDecorationTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: PrimaryLight,
          centerTitle: true,
          )
        );
}