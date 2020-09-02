// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    Task({
        this.id,
        this.creatorId,
        this.taskName,
        this.completed,
    });

    int id;
    int creatorId;
    String taskName;
    int completed;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        creatorId: json["creatorId"],
        taskName: json["taskName"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "creatorId": creatorId,
        "taskName": taskName,
        "completed": completed,
    };
}
