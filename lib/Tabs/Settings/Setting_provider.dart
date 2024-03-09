import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  void changeTheme(ThemeMode selectedThemeMode){
    themeMode = selectedThemeMode;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage){
    languageCode = selectedLanguage;
    notifyListeners();
  }
}

