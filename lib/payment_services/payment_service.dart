import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/snackbar.dart';
import '../utils/global.dart';

class PaymentService {
  PaymentService._();

  static PaymentService paymentService = PaymentService._();

  Future<void> makePayment(int amount,BuildContext context) async {
    // try {
      String? paymentIntentClientSecret = await _createPayment(amount, "usd");//india - inr
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Nicolas A.",
        ),
      );
      await _processPayment(context);
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



  Future<void> _processPayment(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      if(!context.mounted) return;
      customSnackBar(msg: "Your action was completed successfully.", title: "Success!", context: context,color: Colors.green);
    } catch (e) {
      customSnackBar(msg: "Your action was not completed successfully.", title: "Failed!", context: context,color: Colors.red);
    }
  }
  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
