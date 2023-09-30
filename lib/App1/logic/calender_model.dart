import 'package:flutter/material.dart';

class CalenderLogic extends ChangeNotifier{
  List taskList = [];

  void addtask(Task task){
    taskList.add(task);

  }
}

class Task{
  final String id;
  final String dateTime;
  final String task;
  Task({required this.dateTime,required this.task,required this.id});

  Map<String,dynamic> toJson()=>{
    "id":id,
    "date":dateTime,
    "task":task
  };
  static fromJson(Map<String,dynamic> json){
    return Task(dateTime: json["date"], task: json["task"], id: json["id"]);
  }
}