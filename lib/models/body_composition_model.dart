// To parse this JSON data, do
//
//     final bodyCompositionModel = bodyCompositionModelFromJson(jsonString);

import 'dart:convert';

List<BodyCompositionModel> bodyCompositionModelFromJson(String str) =>
    List<BodyCompositionModel>.from(
        json.decode(str).map((x) => BodyCompositionModel.fromJson(x)));

String bodyCompositionModelToJson(List<BodyCompositionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BodyCompositionModel {
  String id;
  String coachId;
  String clientId;
  String weight;
  String height;
  String head;
  String relaxedArm;
  String contractedArm;
  String forearm;
  String chest;
  String minimumWaist;
  String maxHip;
  String thignButtock;
  String mediumMuscle;
  String leg;
  String triceps;
  String subscapularis;
  String bceps;
  String iliacCrest;
  String supraspinal;
  String abdominal;
  String thigh;
  String legMilimetros;
  DateTime createdDate;

  BodyCompositionModel({
    required this.id,
    required this.coachId,
    required this.clientId,
    required this.weight,
    required this.height,
    required this.head,
    required this.relaxedArm,
    required this.contractedArm,
    required this.forearm,
    required this.chest,
    required this.minimumWaist,
    required this.maxHip,
    required this.thignButtock,
    required this.mediumMuscle,
    required this.leg,
    required this.triceps,
    required this.subscapularis,
    required this.bceps,
    required this.iliacCrest,
    required this.supraspinal,
    required this.abdominal,
    required this.thigh,
    required this.legMilimetros,
    required this.createdDate,
  });

  factory BodyCompositionModel.fromJson(Map<String, dynamic> json) =>
      BodyCompositionModel(
        id: json["id"],
        coachId: json["coach_id"],
        clientId: json["client_id"],
        weight: json["weight"],
        height: json["height"],
        head: json["head"],
        relaxedArm: json["relaxed_arm"],
        contractedArm: json["contracted_arm"],
        forearm: json["forearm"],
        chest: json["chest"],
        minimumWaist: json["minimum_waist"],
        maxHip: json["max_hip"],
        thignButtock: json["thign_buttock"],
        mediumMuscle: json["medium_muscle"],
        leg: json["leg"],
        triceps: json["triceps"],
        subscapularis: json["subscapularis"],
        bceps: json["bíceps"],
        iliacCrest: json["iliac_crest"],
        supraspinal: json["supraspinal"],
        abdominal: json["abdominal"],
        thigh: json["thigh"],
        legMilimetros: json["leg_milimetros"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coach_id": coachId,
        "client_id": clientId,
        "weight": weight,
        "height": height,
        "head": head,
        "relaxed_arm": relaxedArm,
        "contracted_arm": contractedArm,
        "forearm": forearm,
        "chest": chest,
        "minimum_waist": minimumWaist,
        "max_hip": maxHip,
        "thign_buttock": thignButtock,
        "medium_muscle": mediumMuscle,
        "leg": leg,
        "triceps": triceps,
        "subscapularis": subscapularis,
        "bíceps": bceps,
        "iliac_crest": iliacCrest,
        "supraspinal": supraspinal,
        "abdominal": abdominal,
        "thigh": thigh,
        "leg_milimetros": legMilimetros,
        "created_date": createdDate.toIso8601String(),
      };
}
