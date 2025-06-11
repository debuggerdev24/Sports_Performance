class MyCalenderData {
  String id;
  String exerciseVisible;
  String burn;
  String day;
  String title;
  String warmup;
  String cooldown;
  bool isComplete;
  List<ExerciseCircuit> exerciseCircuit;

  MyCalenderData({
    required this.id,
    required this.exerciseVisible,
    required this.burn,
    required this.day,
    required this.title,
    required this.warmup,
    required this.cooldown,
    required this.isComplete,
    required this.exerciseCircuit,
  });

  factory MyCalenderData.fromJson(Map<String, dynamic> json) => MyCalenderData(
        id: json["id"],
        exerciseVisible: json["exercise_visible"],
        burn: json["burn"],
        day: json["day"],
        title: json["title"],
        warmup: json["warmup"],
        cooldown: json["cooldown"],
        isComplete: json["is_complete"],
        exerciseCircuit: List<ExerciseCircuit>.from(
            json["exercisecircuit"].map((x) => ExerciseCircuit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "exercise_visible": exerciseVisible,
        "burn": burn,
        "day": day,
        "title": title,
        "warmup": warmup,
        "cooldown": cooldown,
        "is_complete": isComplete,
        "exercisecircuit":
            List<dynamic>.from(exerciseCircuit.map((x) => x.toJson())),
      };
}

class ExerciseCircuit {
  String id;
  String types;
  String title;
  String steps;
  dynamic instruction;
  String videoLink;
  dynamic metric;
  String videoLinkThumbnail;

  ExerciseCircuit({
    required this.id,
    required this.types,
    required this.title,
    required this.steps,
    required this.instruction,
    required this.videoLink,
    required this.metric,
    required this.videoLinkThumbnail,
  });

  factory ExerciseCircuit.fromJson(Map<String, dynamic> json) =>
      ExerciseCircuit(
        id: json["id"] ?? "test",
        types: json["types"] ?? "test",
        title: json["title"] ?? "test",
        steps: json["steps"] ?? "test",
        instruction: json["instruction"] ?? "test",
        videoLink: json["video_link"] ?? "test",
        metric: json["metric"] ?? "test",
        videoLinkThumbnail: json["video_link_thumbnail"] ?? "test",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "types": types,
        "title": title,
        "steps": steps,
        "instruction": instruction,
        "video_link": videoLink,
        "metric": metric,
        "video_link_thumbnail": videoLinkThumbnail,
      };
}
