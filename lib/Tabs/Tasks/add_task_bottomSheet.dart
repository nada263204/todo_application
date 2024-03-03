import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/Tabs/Tasks/custom_textField.dart';
import 'package:todo_application/Tabs/Tasks/deffultBottom.dart';
import 'package:todo_application/app_Theme.dart';

class addTaskBottomSheet extends StatefulWidget {
  const addTaskBottomSheet({super.key});

  @override
  State<addTaskBottomSheet> createState() => _addTaskBottomSheetState();
}

class _addTaskBottomSheetState extends State<addTaskBottomSheet> {
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
                },
                child: Text(
                  dateFormat.format(DateTime.now())
                  ,style: Theme.of(context).textTheme.bodySmall),
              ),
              SizedBox(height: 12,),
              defultButtom(textt: "add",onPressed: addTask,),
            ],
          ),
        ),
      ),
    );
  }

  void addTask(){}
}