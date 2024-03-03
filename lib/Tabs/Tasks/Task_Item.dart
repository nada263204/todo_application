import 'package:flutter/material.dart';
import 'package:todo_application/app_Theme.dart';

class Task_item extends StatelessWidget {
  const Task_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.White,
            borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Row(
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
                    Text('task title',
                    style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 4,),
                    Text('task description',
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
        ),
      ],
    );
  }
}