// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
  type: json['type'] as String?,
  tasks: (json['tasks'] as List<dynamic>?)
      ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
  'type': instance.type,
  'tasks': instance.tasks,
};

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  progress: (json['progress'] as num?)?.toInt(),
  status: json['status'] as String?,
  dueDate: json['due_date'] == null
      ? null
      : DateTime.parse(json['due_date'] as String),
  team: (json['team'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'progress': instance.progress,
  'status': instance.status,
  'due_date': instance.dueDate?.toIso8601String(),
  'team': instance.team,
};
