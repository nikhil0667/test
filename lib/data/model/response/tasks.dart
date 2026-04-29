// To parse this JSON data, do
//
//     final tasks = tasksFromMap(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tasks.g.dart';

Tasks tasksFromMap(String str) => Tasks.fromJson(json.decode(str));

String tasksToMap(Tasks data) => json.encode(data.toJson());

@JsonSerializable()
class Tasks {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "tasks")
  List<Task>? tasks;

  Tasks({this.type, this.tasks});

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}

@JsonSerializable()
class Task {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "progress")
  int? progress;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "due_date")
  DateTime? dueDate;
  @JsonKey(name: "team")
  List<String>? team;

  Task({
    this.id,
    this.title,
    this.progress,
    this.status,
    this.dueDate,
    this.team,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
