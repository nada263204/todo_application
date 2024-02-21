import 'package:flutter/material.dart';
import 'package:todo_application/Tabs/Settings/Setting_provider.dart';
import 'package:todo_application/app_Theme.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/home_Screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> SettingProvider(),
      child:const MyApp()
    )
     );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =  Provider.of<SettingProvider>(context);
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.LightTheme,
        darkTheme:AppTheme.DarkTheme,
       localizationsDelegates: AppLocalizations.localizationsDelegates,
       supportedLocales: AppLocalizations.supportedLocales,
       locale: Locale(settingProvider.languageCode),
       routes: {
        HomeScreen.routeName:(ctx) => HomeScreen(),
       },
       initialRoute: HomeScreen.routeName,
      );
  }
}
