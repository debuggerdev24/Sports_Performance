// class ProgramModel {
//   Data data;
//
//   ProgramModel({
//     required this.data,
//   });
//
//   factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
//         data: Data.fromJson(json),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

class ProgramModel {
  String programName;
  String programDescription;
  Map<String, dynamic> programData;

  ProgramModel({
    required this.programName,
    required this.programDescription,
    required this.programData,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        programName: json["program_name"],
        programDescription: json["program_description"],
        programData: Map.from(json["program_data"])
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "program_name": programName,
        "program_description": programDescription,
        "program_data": Map.from(programData)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class ProgramDatumElement {
  String id;
  String day;
  String title;
  List<String> subTitle;
  String checkRestDay;
  String programComplete;
  String isComplete;
  String coachName;
  List<WorkoutDetail> workoutDetails;

  ProgramDatumElement({
    required this.id,
    required this.day,
    required this.title,
    required this.subTitle,
    required this.checkRestDay,
    required this.programComplete,
    required this.isComplete,
    required this.coachName,
    required this.workoutDetails,
  });

  factory ProgramDatumElement.fromJson(Map<String, dynamic> json) =>
      ProgramDatumElement(
        id: json["id"],
        day: json["day"],
        title: json["title"],
        subTitle: List<String>.from(json["subTitle"].map((x) => x)),
        checkRestDay: json["check_rest_day"],
        programComplete: json["program_complete"],
        isComplete: json["is_complete"],
        coachName: json["coach_name"],
        workoutDetails: List<WorkoutDetail>.from(
            json["workout_details"].map((x) => WorkoutDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "title": title,
        "subTitle": List<dynamic>.from(subTitle.map((x) => x)),
        "check_rest_day": checkRestDay,
        "program_complete": programComplete,
        "is_complete": isComplete,
        "coach_name": coachName,
        "workout_details":
            List<dynamic>.from(workoutDetails.map((x) => x.toJson())),
      };
}

class WorkoutDetail {
  String label;
  String title;
  String steps;
  String videoLink;
  String metricId;

  WorkoutDetail({
    required this.label,
    required this.title,
    required this.steps,
    required this.videoLink,
    required this.metricId,
  });

  factory WorkoutDetail.fromJson(Map<String, dynamic> json) => WorkoutDetail(
        label: json["label"]!,
        title: json["title"],
        steps: json["steps"],
        videoLink: json["video_link"],
        metricId: json["metric_id"],
      );

  Map<String, dynamic> toJson() => {
        "label": labelValues.reverse[label],
        "title": title,
        "steps": steps,
        "video_link": videoLink,
        "metric_id": metricId,
      };
}

enum Label { EXERCISE }

final labelValues = EnumValues({"exercise": Label.EXERCISE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
