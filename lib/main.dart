import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/Tabs/Settings/Setting_provider.dart';
import 'package:todo_application/Tabs/Tasks/Tasks_Provider.dart';
import 'package:todo_application/app_Theme.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/home_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings = const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context)=> SettingProvider(),
    ),
    ChangeNotifierProvider(
      create: (context)=> TasksProvider()..getTasks(),
    )
      ],
      child:const MyApp(),
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
            darkTheme: AppTheme.DarkTheme,
            themeMode: settingProvider.themeMode,
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
