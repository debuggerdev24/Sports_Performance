// To parse this JSON data, do
//
//     final userDetailModel = userDetailModelFromJson(jsonString);

import 'dart:convert';

List<UserDetailModel> userDetailModelFromJson(String str) =>
    List<UserDetailModel>.from(
        json.decode(str).map((x) => UserDetailModel.fromJson(x)));

String userDetailModelToJson(List<UserDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailModel {
  String id;
  String coachId;
  String name;
  String email;
  String phone;
  String fcmToken;
  String userWallet;
  String password;
  String profilePicture;
  String weight;
  String height;
  String gender;
  String timelinePicture;
  String businessName;
  dynamic signinVerificationToken;
  String role;
  String status;
  DateTime createdDate;
  String myCoach;
  String coachPic;

  UserDetailModel({
    required this.id,
    required this.coachId,
    required this.name,
    required this.email,
    required this.phone,
    required this.fcmToken,
    required this.userWallet,
    required this.password,
    required this.profilePicture,
    required this.weight,
    required this.height,
    required this.gender,
    required this.timelinePicture,
    required this.businessName,
    this.signinVerificationToken,
    required this.role,
    required this.status,
    required this.createdDate,
    required this.myCoach,
    required this.coachPic,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        id: json["id"],
        coachId: json["coach_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        fcmToken: json["fcm_token"],
        userWallet: json["user_wallet"],
        password: json["password"],
        profilePicture: json["profile_picture"] ?? '',
        weight: json["weight"],
        height: json["height"],
        gender: json["gender"] ?? '',
        timelinePicture: json["timeline_picture"],
        businessName: json["business_name"],
        signinVerificationToken: json["signin_verification_token"],
        role: json["role"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        myCoach: json["my_coach"],
        coachPic: json["my_coach_profile_picture"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coach_id": coachId,
        "name": name,
        "email": email,
        "phone": phone,
        "fcm_token": fcmToken,
        "user_wallet": userWallet,
        "password": password,
        "profile_picture": profilePicture,
        "weight": weight,
        "height": height,
        "gender": gender,
        "timeline_picture": timelinePicture,
        "business_name": businessName,
        "signin_verification_token": signinVerificationToken,
        "role": role,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "my_coach": myCoach,
        "my_coach_profile_picture": coachPic
      };
}
