// To parse this JSON data, do
//
//     final bodyCompositionPieChartModel = bodyCompositionPieChartModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<BodyCompositionPieChartModel> bodyCompositionPieChartModelFromJson(
        String str) =>
    List<BodyCompositionPieChartModel>.from(
        json.decode(str).map((x) => BodyCompositionPieChartModel.fromJson(x)));

String bodyCompositionPieChartModelToJson(
        List<BodyCompositionPieChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BodyCompositionPieChartModel {
  String id;
  String coachId;
  String clientId;
  String adiposaPercentage;
  String adiposaAmount;
  String adiposaKilogram;
  String muscularPercentage;
  String muscularAmount;
  String muscularKilogram;
  String residualPercentage;
  String residualAmount;
  String residualKilogram;
  String oseaPercentage;
  String oseaAmount;
  String oseaKilogram;
  String dialPielPercentage;
  String dialPielAmount;
  String dialPielKilograms;
  String the6Pliegues;
  String indiceMusculo;
  String adiposeTissue;
  String muscularTissue;
  String bodyWeight;

  BodyCompositionPieChartModel({
    required this.id,
    required this.coachId,
    required this.clientId,
    required this.adiposaPercentage,
    required this.adiposaKilogram,
    required this.adiposaAmount,
    required this.muscularPercentage,
    required this.muscularKilogram,
    required this.muscularAmount,
    required this.residualPercentage,
    required this.residualKilogram,
    required this.residualAmount,
    required this.oseaPercentage,
    required this.oseaKilogram,
    required this.oseaAmount,
    required this.dialPielPercentage,
    required this.dialPielKilograms,
    required this.dialPielAmount,
    required this.the6Pliegues,
    required this.indiceMusculo,
    required this.adiposeTissue,
    required this.muscularTissue,
    required this.bodyWeight,
  });

  factory BodyCompositionPieChartModel.fromJson(Map json) {
    return BodyCompositionPieChartModel(
      id: json["id"],
      coachId: json["coach_id"],
      clientId: json["client_id"],
      adiposaPercentage: json["adiposa_percentage"],
      adiposaAmount: json["adiposa_amount"],
      muscularPercentage: json["muscular_percentage"],
      muscularAmount: json["muscular_amount"],
      residualPercentage: json["residual_percentage"],
      residualAmount: json["residual_amount"],
      oseaPercentage: json["osea_percentage"],
      oseaAmount: json["osea_amount"],
      dialPielPercentage: json["dial_piel_percentage"],
      dialPielAmount: json["dial_piel_amount"],
      the6Pliegues: json["6_pliegues"],
      indiceMusculo: json["indice_musculo"],
      adiposeTissue: json["adipose_tissue"],
      muscularTissue: json["muscular_tissue"],
      bodyWeight: json["body_weight"],
      adiposaKilogram: json["adiposa_kilograms"],
      muscularKilogram: json["muscular_kilograms"],
      residualKilogram: json["residual_kilograms"],
      oseaKilogram: json["osea_kilograms"],
      dialPielKilograms: json["dial_piel_kilograms"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "coach_id": coachId,
        "client_id": clientId,
        "adiposa_percentage": adiposaPercentage,
        "adiposa_amount": adiposaAmount,
        "muscular_percentage": muscularPercentage,
        "muscular_amount": muscularAmount,
        "residual_percentage": residualPercentage,
        "residual_amount": residualAmount,
        "osea_percentage": oseaPercentage,
        "osea_amount": oseaAmount,
        "dial_piel_percentage": dialPielPercentage,
        "dial_piel_amount": dialPielAmount,
        "6_pliegues": the6Pliegues,
        "indice_musculo": indiceMusculo,
        "adipose_tissue": adiposeTissue,
        "muscular_tissue": muscularTissue,
        "body_weight": bodyWeight,
      };
}
