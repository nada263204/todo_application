import 'package:flutter/material.dart';
import 'package:todo_application/Models/Task_Model.dart';
import 'package:todo_application/Firebase_utils.dart';

class TasksProvider with ChangeNotifier{
  List <taskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasks()async{
    final allTasks = await firebaseUtiles.getAllTasksFromFirestore();
    tasks = allTasks.where((task) => task.dateTime.day == selectedDate.day && task.dateTime.month == selectedDate.month && task.dateTime.year == selectedDate.year).toList();
    tasks.sort((previousTask,nextTask) => previousTask.dateTime.compareTo(nextTask.dateTime));
    notifyListeners();
  }

  void changeSelectedData(DateTime dateTime){
    selectedDate = dateTime;
    notifyListeners();
    getTasks();
  }
}