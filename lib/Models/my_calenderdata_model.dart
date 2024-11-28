// To parse this JSON data, do
//
//     final myCalenderData = myCalenderDataFromJson(jsonString);

import 'dart:convert';

MyCalenderData myCalenderDataFromJson(String str) =>
    MyCalenderData.fromJson(json.decode(str));

String myCalenderDataToJson(MyCalenderData data) => json.encode(data.toJson());

class MyCalenderData {
  String id;
  String day;
  String title;
  String warmup;
  String cooldown;
  bool isComplete;
  List<Exercisecircuit> exercisecircuit;

  MyCalenderData({
    required this.id,
    required this.day,
    required this.title,
    required this.warmup,
    required this.cooldown,
    required this.isComplete,
    required this.exercisecircuit,
  });

  factory MyCalenderData.fromJson(Map<String, dynamic> json) => MyCalenderData(
        id: json["id"],
        day: json["day"],
        title: json["title"],
        warmup: json["warmup"],
        cooldown: json["cooldown"],
        isComplete: json["is_complete"],
        exercisecircuit: List<Exercisecircuit>.from(
            json["exercisecircuit"].map((x) => Exercisecircuit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "title": title,
        "warmup": warmup,
        "cooldown": cooldown,
        "is_complete": isComplete,
        "exercisecircuit":
            List<dynamic>.from(exercisecircuit.map((x) => x.toJson())),
      };
}

class Exercisecircuit {
  String id;
  String types;
  String title;
  dynamic steps;
  dynamic instruction;
  String videoLink;
  String videoImage;
  dynamic metric;

  Exercisecircuit({
    required this.id,
    required this.types,
    required this.title,
    required this.steps,
    required this.instruction,
    required this.videoLink,
    required this.videoImage,
    required this.metric,
  });

  factory Exercisecircuit.fromJson(Map<String, dynamic> json) =>
      Exercisecircuit(
        id: json["id"],
        types: json["types"],
        title: json["title"],
        steps: json["steps"],
        instruction: json["instruction"],
        videoLink: json["video_link"],
        metric: json["metric"],
        videoImage: json["video_link_thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "types": types,
        "title": title,
        "steps": steps,
        "instruction": instruction,
        "video_link": videoLink,
        "video_link_thumbnail": videoImage,
        "metric": metric,

      };
}
