import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Firebase_utils.dart';
import 'package:todo_application/Models/Task_Model.dart';
import 'package:todo_application/Tabs/Tasks/Tasks_Provider.dart';
import 'package:todo_application/Tabs/Tasks/custom_textField.dart';
import 'package:todo_application/Tabs/Tasks/deffultBottom.dart';
import 'package:todo_application/app_Theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: MediaQuery.of(context).size.height*0.9,
          child: Column(
            children: [
              Text('Add New Task',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.Black),),
              customTextFormField(
                controller:titleController ,
                hinttext: 'Enter Task Title',maxLines: 1,),
              SizedBox(height: 12,),
              customTextFormField(
                controller:descriptionController ,
                hinttext: "Enter Task Discription",maxLines:5),
              SizedBox(height: 12,),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('Selected Date',style: Theme.of(context).textTheme.bodyLarge,)),
                SizedBox(height: 12,),
              InkWell(
                 onTap: () async{
                  final dateTime =  await showDatePicker(
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365))
                  );if(dateTime != null){selectedDate=dateTime;}
                  setState(() {});
                },
                child: Text(
                  dateFormat.format(selectedDate)
                  ,style: Theme.of(context).textTheme.bodySmall),
              ),
              const SizedBox(height: 12,),
              defultButtom(textt: "add",onPressed: addTask,),
            ],
          ),
        ),
      ),
    );
  }

  void addTask(){
    firebaseUtiles.addTaskToFirestore(
      taskModel(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate,
    )).timeout(
      const Duration(milliseconds: 500),
      onTimeout: (){
        Provider.of <TasksProvider> (context,listen: false).getTasks;
        Navigator.of(context).pop();
        Fluttertoast.showToast(
        msg: "Task added successfully ",
        toastLength: Toast.LENGTH_SHORT,
    );

      }).catchError((e){
        Navigator.of(context).pop();
      Fluttertoast.showToast(
        msg: "Failed , please try again",
        toastLength: Toast.LENGTH_SHORT,
    );
    });
  }
}