import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sportperformance/extensions/object_extension.dart';

import '../Utils/url.dart';
import '../models/banner_model.dart';
import '../models/my_calenderdata_model.dart';
import '../models/notification_model.dart';

class HomeScreenService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();
  Dio dio = Dio();

  Future<List<BannerListModel>> bannerList() async {
    List<BannerListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read("token"),
    };

    var response = await dio.post(
      '$baseUrl/banner-list.php',
      options: Options(headers: headers),
    );

    var data = response.data;

    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(BannerListModel.fromJson(i));
        }
      }
    }
    return blist;
  }

  Future<List<String>> goalsApi() async {
    List<String> blist = [];
    formData.FormData form;
    var headers = {
      'Authorization': pref.read("token"),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'coach_id': pref.read('coach_id'),
    });

    var response = await dio.post(
      '$baseUrl/my-goals.php', //https://sportsperformance.cl/api/my-goals.php
      data: form,
      options: Options(headers: headers),
    );

    var data = response.data;
    // log("I Want to read this --> ${data["data"]}");

    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        if (data['data']['goals'] != null) {
          blist.add(data['data']['goals']);
        }
      }
    }
    return blist;
  }

  Future<List<MyCalenderData>> myCalenderExercise(String date) async {
    List<MyCalenderData> workOustData = [];

    formData.FormData form;
    var headers = {
      'Authorization': pref.read("token"),
    };

    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'coach_id': pref.read('coach_id'),
      'date': date,
    });

    var response = await dio.post(
      '$baseUrl/my-calender.php',
      data: form,
      options: Options(headers: headers),
    );

    var data = response.data;
    myLog(data.toString());

    myLog("request send");
    if (response.statusCode == 200 && data['status'] == "true") {
      if (data['data'] != null) {
        workOustData = (data['data'] as List)
            .map(
              (e) => MyCalenderData.fromJson(e),
            )
            .toList();
      }
    }

    return workOustData;
  }

  Future<bool> markWorkoutComplete(String id) async {
    // List<MyCalenderData> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read("token"),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'coach_id': pref.read('coach_id'),
      'id': id,
    });

    var response = await dio.post(
      '$baseUrl/my-workout-complete.php',
      data: form,
      options: Options(headers: headers),
    );

    var data = response.data;

    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        if (data['data']['is_complete'] == 1) {
          return true;
        }
      }
    }
    return false;
  }

  Future<List<NotificationModel>> notificationList() async {
    List<NotificationModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read("token"),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'user_type': pref.read('role') == '1' ? 'customer' : 'trainer'
    });

    var response = await dio.post(
        '$baseUrl/my-notifications.php', //todo https://sportsperformance.cl/api/my-notifications.php
        options: Options(headers: headers),
        data: form);
    // myLog(headers.toString());

    var data = response.data;

    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(NotificationModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<String>> getExerciseStatus(
      {required String year, required String month}) async {
    formData.FormData form;
    var headers = {
      'Authorization': pref.read("token"),
    };

    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'coach_id': pref.read('coach_id'),
      'year': year,
      'month': month
    });

    var response = await dio.post(
      '$baseUrl/client-calender-workouts.php',
      data: form,
      options: Options(headers: headers),
    );

    var data = response.data;

    List<String> exerciseStatus = [];
    myLog("-------> ${response.statusCode} ${response.data['data']}");

    if (response.statusCode == 200 && data['status'] == "true") {
      if (data['data'] != null) {
        exerciseStatus =
            (data['data'] as Map).values.map((e) => e as String).toList();
      }
    }
    return exerciseStatus;
  }
}
