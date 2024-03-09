import 'package:flutter/material.dart';
import 'package:todo_application/Tabs/Settings/Setting_tab.dart';
import 'package:todo_application/Tabs/Tasks/Tasks_Tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/Tabs/Tasks/add_task_bottomSheet.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Widget> tabs =[
    TasksTab(),
    SettingTab(),
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    List <String> appBarTitles = [
    AppLocalizations.of(context)!.todoList,
    AppLocalizations.of(context)!.settings,
  ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsetsDirectional.only(start:  20),
          child: Text(appBarTitles[currentIndex]),
        ),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.zero,
        surfaceTintColor: Colors.white,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex=index;
            setState(() {});
          },
          items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Tasks',
                ),
              BottomNavigationBarItem(
              icon:
              Icon(Icons.settings),
              label: 'Setting'
              ),
                ],
                type: BottomNavigationBarType.fixed,
                ),
                ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  showModalBottomSheet(context: context,
                  builder: (_) => AddTaskBottomSheet());
                },
                child: Icon(Icons.add
                ,size: 30,),
                ),
    );
  }
}