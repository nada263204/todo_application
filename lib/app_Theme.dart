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
          foregroundColor: White,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22
          )
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: PrimaryLight,
            unselectedItemColor: Grey,
          ),
          textTheme:TextTheme(
            bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Black,
            ),
            bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PrimaryLight
            ),
             bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Black
            )
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: PrimaryLight,
            foregroundColor: White,
            shape: CircleBorder(side: BorderSide(color: White,width: 4))
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