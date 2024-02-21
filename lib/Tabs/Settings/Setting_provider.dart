import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode themMode = ThemeMode.light;
  String languageCode = 'en';

  void changeTheme(ThemeMode selectedThemeMode){
    themMode = selectedThemeMode;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage){
    languageCode = selectedLanguage;
    notifyListeners();
  }
}