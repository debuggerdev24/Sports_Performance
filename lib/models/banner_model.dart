// To parse this JSON data, do
//
//     final bannerListModel = bannerListModelFromJson(jsonString);

import 'dart:convert';

List<BannerListModel> bannerListModelFromJson(String str) =>
    List<BannerListModel>.from(
        json.decode(str).map((x) => BannerListModel.fromJson(x)));

String bannerListModelToJson(List<BannerListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerListModel {
  String bannerUrl;
  String bannerImage;

  BannerListModel({
    required this.bannerUrl,
    required this.bannerImage,
  });

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
        bannerUrl: json["banner_url"],
        bannerImage: json["banner_image"],
      );

  Map<String, dynamic> toJson() => {
        "banner_url": bannerUrl,
        "banner_image": bannerImage,
      };
}
