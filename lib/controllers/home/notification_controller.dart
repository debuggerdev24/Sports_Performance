import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../apiServices/home_service.dart';
import '../../models/notification_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notificationList = List<NotificationModel>.empty(growable: true).obs;
  getNotification() async {
    isLoading(true);
    notificationList.assignAll(await HomeScreenService().notificationList());
    isLoading(false);
  }

  String convertDateFormat(DateTime originalDate) {
    // Parse the original date string
    // DateTime dateTime = DateTime.parse(originalDate);

    // Format the date to the desired format
    DateFormat formatter = DateFormat('dd - MMMM - yyyy');
    String formattedDate = formatter.format(originalDate);

    return formattedDate;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getNotification();
    super.onInit();
  }
}
