// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    required this.notiTitle,
    required this.notiDescription,
    required this.createdDate,
  });

  String notiTitle;
  String notiDescription;
  DateTime createdDate;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notiTitle: json["noti_title"],
        notiDescription: json["noti_description"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "noti_title": notiTitle,
        "noti_description": notiDescription,
        "created_date": createdDate.toIso8601String(),
      };
}
