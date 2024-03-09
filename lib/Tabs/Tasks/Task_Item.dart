import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Firebase_utils.dart';
import 'package:todo_application/Models/Task_Model.dart';
import 'package:todo_application/Tabs/Tasks/Tasks_Provider.dart';
import 'package:todo_application/app_Theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task_item extends StatelessWidget {
  final taskModel task;
  const Task_item({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children:  [
        SlidableAction(
          onPressed: (_){
            firebaseUtiles.deleteTaskFromFirestore(task.id).timeout(
      const Duration(milliseconds: 500),
      onTimeout: () {
        Provider.of <TasksProvider> (context,listen: false).getTasks();
      },
    )
    .catchError((_) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
        msg: "Some thing went wrong",
        toastLength: Toast.LENGTH_SHORT
        );
    });
          },
          backgroundColor: AppTheme.Red,
          foregroundColor: AppTheme.White,
          icon: Icons.delete,
          label: 'Delete',
          borderRadius: BorderRadius.circular(15),
        ),
      ],
        ),
        child: Container(
          decoration: BoxDecoration(
          color: AppTheme.White,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: const EdgeInsets.all(12),
          child: Column(
                children: [
          Row(
            children: [
                Container(
          height: 60,
          width:2,
          color: Theme.of(context).primaryColor,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,
                    style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 4,),
                    Text(task.description,
                    style:Theme.of(context).textTheme.bodySmall ,)
                  ],
                ),
              ),
              Spacer(),
              Container(
                height:34 ,
                width: 69,
                decoration: BoxDecoration(
                  color:Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:Image.asset('assets/images/check.png',),
              )
            ],
          ),
                ],
          ),
        ),
      ),
    );
  }

  
}
