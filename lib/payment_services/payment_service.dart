import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import '../utils/global.dart';

class PaymentService {
  PaymentService._();

  static PaymentService paymentService = PaymentService._();

  Future<void> makePayment(int amount) async {
    // try {
      String? paymentIntentClientSecret = await _createPayment(amount, "usd");//india - inr
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Ankit Umredkar",
        ),
      );
      await _processPayment();
    // } catch (e) {
    //   log("makePayment methode ${e.toString()}");
    // }
  }

  Future<String?> _createPayment(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency
      };
      Response response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $secretKey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );
      myLog(response.statusCode.toString());
      if (response.statusCode == 200) {
        myLog(response.data["client_secret"]);
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      myLog("create method ${e.toString()}");
    }
    return null;
  }



  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      myLog("Payment completed successfully!");
      g.Get.snackbar(
        "Success!", // Title
        "Your action was completed successfully.", // Message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green, // Green background
        colorText: Colors.white, // White text for contrast
        borderRadius: 16,
        margin: EdgeInsets.fromLTRB(15,0,15,35),
        duration: Duration(seconds: 3), // Snackbar duration
      );
    } catch (e) {
      myLog("proccess Payment : ${e.toString()}");
    }
  }
  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
