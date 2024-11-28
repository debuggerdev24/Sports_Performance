// To parse this JSON data, do
//
//     final bodyCompositionPieChartModel = bodyCompositionPieChartModelFromJson(jsonString);

import 'dart:convert';

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
  String muscularPercentage;
  String muscularAmount;
  String residualPercentage;
  String residualAmount;
  String oseaPercentage;
  String oseaAmount;
  String dialPielPercentage;
  String dialPielAmount;
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
    required this.adiposaAmount,
    required this.muscularPercentage,
    required this.muscularAmount,
    required this.residualPercentage,
    required this.residualAmount,
    required this.oseaPercentage,
    required this.oseaAmount,
    required this.dialPielPercentage,
    required this.dialPielAmount,
    required this.the6Pliegues,
    required this.indiceMusculo,
    required this.adiposeTissue,
    required this.muscularTissue,
    required this.bodyWeight,
  });

  factory BodyCompositionPieChartModel.fromJson(Map<String, dynamic> json) =>
      BodyCompositionPieChartModel(
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
      );

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
