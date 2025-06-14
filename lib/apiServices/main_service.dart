import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;
import 'package:sportperformance/Models/body_composition_chart_model.dart';
import 'package:sportperformance/Models/body_composition_model.dart';
import 'package:sportperformance/Models/timeLine_linegraph_model.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/models/user_model.dart';

import '../Utils/url.dart';

class MainScreenService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<List<UserDetailModel>> userdetail(BuildContext context) async {
    List<UserDetailModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post(
      '$baseUrl/user-details.php',
      data: form,
      options: Options(headers: headers),
    );
    // print(headers);
    // print('form================== $form');
    // print("ddddddddddddddddddd${pref.read('user_id')}");
    // print(form.fields);
    var data = response.data;
    if (data['status'] == 'true') {
      // blist = userDetailModelFromJson(data['data']);
      blist.add(UserDetailModel.fromJson(data['data']));
    }
    pref.write('coach_id', blist[0].coachId);
    if (data['status'] != 'true') {
      pref.write('isLogin', false);
      Get.offAllNamed('/login', arguments: [context]);
    }
    return blist;
  }

  Future<List<BodyCompositionModel>> bodyCompositionApi() async {
    List<BodyCompositionModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'coach_id': pref.read('coach_id'),
    });

    var response = await dio.post(
      '$baseUrl/my-body-composition.php',
      data: form,
      options: Options(headers: headers),
    );
    // print(headers);
    // print('form ==================> $form');
    // print("${pref.read('user_id')}");
    // print(form.fields);
    var data = response.data;
    if (data['status'] == 'true') {
      myLog(
          "body composition first section API Data ---------------------> ${response.data['data']}");
      for (var element in (response.data['data'] as List)) {
        blist.add(BodyCompositionModel.fromJson(element));
      }
    }

    return blist;
  }

  Future<List<LineGraphData>> timelineGraphApi() async {
    List<LineGraphData> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'coach_id': pref.read('coach_id'),
    });

    var response = await dio.post(
      '$baseUrl/my-timeline.php',
      data: form,
      options: Options(headers: headers),
    );
    // print(headers);
    // print('form================== $form');
    // print("ddddddddddddddddddd${pref.read('user_id')}");
    // print(form.fields);
    var data = response.data;
    if (data['status'] == 'true') {
      for (var element in (response.data['data'] as List)) {
        blist.add(LineGraphData.fromJson(element));
      }
    }

    return blist;
  }

  Future<List<BodyCompositionPieChartModel>> pieChartApi() async {
    List<BodyCompositionPieChartModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;

    var headers = {
      'Authorization': pref.read('token'),
    };

    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'coach_id': pref.read('coach_id'),
    });

    var response = await dio.post(
      '$baseUrl/my-body-composition-pie-chart.php', //todo ------> base https://sportsperformance.cl/api/my-body-composition-pie-chart.php
      data: form,
      options: Options(headers: headers),
    );

    var data = response.data;
    if (data["status"] == "true") {
      myLog(
          "body composition second section API Data ---------------------> ${response.data['data']}");
      for (var element in (response.data['data'] as List)) {
        blist.add(BodyCompositionPieChartModel.fromJson(element));
      }
    }
    return blist;
  }
}

//can you ple
//Worked on
