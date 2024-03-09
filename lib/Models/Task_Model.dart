// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class taskModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  taskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    this.isDone = false,
  });

  factory taskModel.fromJson(Map<String,dynamic> json){
    return taskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: (json['dateTime'] as Timestamp).toDate() ,
      isDone: json['isDone'],
    );
  }

  Map<String,dynamic> toJson() => {
    "id":id,
    "title":title,
    "description":description,
    "dateTime": Timestamp.fromDate(dateTime),
    "isDone":isDone,
  };
}
