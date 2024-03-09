import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Tabs/Settings/Setting_provider.dart';
import 'package:todo_application/app_Theme.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider =Provider.of<SettingProvider>(context);
    return SafeArea(
      child: Container(
        padding:const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600,color: AppTheme.PrimaryLight),),
                Switch(
                  value: settingProvider.themeMode == ThemeMode.dark,
                  onChanged: (value){
                    if(value){settingProvider.changeTheme(ThemeMode.dark);}
                    else{settingProvider.changeTheme(ThemeMode.light);}
                  },
                  activeTrackColor: Theme.of(context).primaryColor,
                  inactiveThumbColor: AppTheme.PrimaryLight,
                  thumbColor: MaterialStatePropertyAll(AppTheme.backgroundColorDark),
                  ),
              ],
            ),
            Row(
              children: [
                Text('Language',
                style: TextStyle(
                  color: AppTheme.PrimaryLight,
                ),),
                SizedBox(width: 10,),
                ],
            ),
          ],
        ),
      ),
    );
  }
}

