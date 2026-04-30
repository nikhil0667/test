// To parse this JSON data, do
//
//     final tasks = tasksFromJson(jsonString);



class Tasks {
  String? type;
  List<Task>? tasks;

  Tasks({this.type, this.tasks});

  factory Tasks.fromJson(Map<String, dynamic> json, String type) => Tasks(
    type: json["type"],
    tasks: json["tasks"] == null
        ? []
        : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x, type))),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "tasks": tasks == null
        ? []
        : List<dynamic>.from(tasks!.map((x) => x.toMap())),
  };
}

class Task {
  int? id;
  String? title;
  int? progress;
  String? status;
  DateTime? dueDate;
  List<String>? team;

  Task({
    this.id,
    this.title,
    this.progress,
    this.status,
    this.dueDate,
    this.team,
  });

  factory Task.fromJson(Map<String, dynamic> json, String type) => Task(
    id: json["id"],
    title: json["title"],
    progress: json["progress"],
    status: json["status"],
    dueDate: json[type == "left" ? "due_date" : "completed_at"] == null
        ? null
        : DateTime.parse(json[type == "left" ? "due_date" : "completed_at"]),
    team: json["team"] == null
        ? []
        : List<String>.from(json["team"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "progress": progress,
    "status": status,
    "due_date":
        "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "team": team == null ? [] : List<dynamic>.from(team!.map((x) => x)),
  };
}
