import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import '../snackbar.dart';

class NutritionServices {
  var pref = GetStorage();
  Dio dio = Dio();

  Future<List<NutritionModel>?> getNutritionList(String day) async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      });
      final u = pref.read("user_id");
      final c = pref.read("coach_id");
      myLog("User id ---------------> $u");
      myLog("Coach id ---------------> $c");
      var response = await dio.post("$baseUrl/my-nutrition.php", data: data);
      myLog("body ---------------> ${response.data}");
      if (response.data['code'].toString() == "6") {
        myLog("---------------------------------> ${response.data["data"]}");
        List<NutritionModel> data = (response.data['data'] as List)
            .map((e) => NutritionModel.fromJson(e))
            .toList();
        return data;
        // for (var element in (response.data['data'] as List)) {
        //   if (element['day_name'] == day) {
        //     return NutritionModel.fromJson(element);
        //   }
        // }
      }
      return null;
    } catch (e) {
      myLog(e.toString());
      return null;
    }
  }

  // todo --------> old function
  // Future<String> downloadFile(
  //     String fileUrl, String fileName, BuildContext context) async {
  //   try {
  //     late String filePath;
  //     Directory? directory;
  //     if (Platform.isAndroid) {
  //       // final status = (await getAndroidVersion() > 10)
  //       //     ? await Permission.manageExternalStorage.request()
  //       //     : await Permission.storage.request();
  //       // filePath = "/storage/emulated/0/Download/$fileName";
  //
  //       // directory = await getDownloadsDirectory();
  //       //[NutritionServices] /storage/emulated/0/Android/data/com.sportsperformance.user/files/downloads
  //       directory = await getExternalStorageDirectory();
  //       filePath = "${directory!.path}/$fileName";
  //       // [NutritionServices] /storage/emulated/0/Android/data/com.sportsperformance.user/files
  //     } else {
  //       directory = await getApplicationDocumentsDirectory();
  //       filePath = "${directory.path}/$fileName";
  //       myLog(directory.path.toString());
  //     }
  //
  //     Response response = await dio.download(fileUrl, filePath);
  //
  //     if (response.statusCode == 200) {
  //       if (context.mounted) {
  //         customSnackBar(
  //           context: context,
  //           msg: "File saved successfully to downloads",
  //           title: 'Success',
  //           color: Colors.green,
  //         );
  //       }
  //     }
  //     return filePath;
  //   } catch (e) {
  //     myLog(
  //         "---------------------- Error in PDF Downloading ------> ${e.toString()}");
  //     if (context.mounted) {
  //       customSnackBar(
  //         msg: "Storage Permission is recommended",
  //         title: "Failed",
  //         context: context,
  //         color: Colors.red,
  //       );
  //     }
  //     return "Error";
  //   }
  // }

  Future<String> downloadFile(
      String fileUrl, String fileName, BuildContext context) async {
    try {
      late String filePath;
      Directory? directory;

      if (Platform.isAndroid) {
        // For Android 10+ (API 29+) - Use scoped storage
        // This saves to app's external files directory but makes it accessible
        directory = await getExternalStorageDirectory();

        // Create Downloads subfolder in app directory
        final downloadsDir = Directory('${directory!.path}/Downloads');
        if (!await downloadsDir.exists()) {
          await downloadsDir.create(recursive: true);
        }
        filePath = "${downloadsDir.path}/$fileName";
      } else if (Platform.isIOS) {
        // For iOS - use documents directory
        directory = await getApplicationDocumentsDirectory();
        filePath = "${directory.path}/$fileName";
      }
      myLog(fileUrl.toString());

      Response response = await Dio().download(
        fileUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            // print(
            //     "Download progress: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      if (response.statusCode == 200) {
        // Verify file exists
        final file = File(filePath);
        if (await file.exists()) {
          if (context.mounted) {}
          return filePath;
        }
      }

      throw Exception("Download failed with status: ${response.statusCode}");
    } catch (e) {
      print("Error downloading file: ${e.toString()}");

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Download failed: ${e.toString()}"),
            backgroundColor: Colors.red,
          ),
        );
      }
      return "Error";
    }
  }

  Future<String> downloadFileTemp(
      String fileUrl, String fileName, BuildContext context) async {
    try {
      if (Platform.isAndroid) {
        // This method saves directly to public Downloads folder
        // Add to pubspec.yaml: flutter_file_downloader: ^1.1.0

        final response = await Dio().get(
          "https://morth.nic.in/sites/default/files/dd12-13_0.pdf",
          options: Options(responseType: ResponseType.bytes),
        );

        // Save to public downloads (Android 10+)
        final directory = Directory('/storage/emulated/0/Download');
        final file = File('${directory.path}/$fileName');
        await file.writeAsBytes(response.data);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("File saved to Downloads folder"),
              backgroundColor: Colors.green,
            ),
          );
        }

        return file.path;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return "Error";
    }
    return "Error";
  }

  int androidVersion() {
    return int.tryParse(Platform.version.split('.')[0]) ?? 0;
  }

  Future<void> getStoragePermission(BuildContext context) async {
    PermissionStatus manageExternalStoragePermissionStatus =
        await Permission.manageExternalStorage.request();
    PermissionStatus storagePermissionStatus =
        await Permission.storage.request();

    // if(mounted ==  false) return;
    if (manageExternalStoragePermissionStatus == PermissionStatus.granted) {
      // customSnackBar(msg: "Permission granted for storage", title: "Success", context: context,color: Colors.red);
    }
    if (manageExternalStoragePermissionStatus == PermissionStatus.denied) {
      if (context.mounted) {
        customSnackBar(
            msg: "Storage Permission is recommended",
            title: "Failed",
            context: context,
            color: Colors.red);
      }
    }
    if (manageExternalStoragePermissionStatus ==
        PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
}
