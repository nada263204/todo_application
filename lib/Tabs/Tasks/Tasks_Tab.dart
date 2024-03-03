import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:todo_application/Tabs/Tasks/Task_Item.dart';
import 'package:todo_application/app_Theme.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
              compactMode: true,
              weekDaySelectedColor: AppTheme.PrimaryLight,
              selectedBackgroundColor:AppTheme.PrimaryLight ,
              disableDaysBeforeNow: true,
              ),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: AppTheme.PrimaryLight,
              headerTextColor: Colors.black,
              ),
          onChangeDateTime: (datetime) {
            print(datetime.getDate());
          },
      ),
      SizedBox(height: 8,),
      Expanded(
        child: ListView.builder(
          itemBuilder:(context,index) => Task_item(),
          itemCount: 4,
           ),
      )
      ],
    );
  }
}