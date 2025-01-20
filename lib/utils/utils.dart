import 'package:flutter/material.dart';

class Utils {
  static showMyDialog(BuildContext context, Widget content,
      {bool? dismissable, EdgeInsetsGeometry? padding}) {
    showDialog(
      context: context,
      barrierDismissible: dismissable ?? true,
      builder: (ctx) => AlertDialog(
        contentPadding: padding ?? const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        content: content,
      ),
    );
  }

  static Future<dynamic> showMyBottomSheet(BuildContext context, Widget widget,
      {double? borderRadius, bool? isDismissible}) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible ?? true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 15),
          topRight: Radius.circular(borderRadius ?? 15),
        ),
      ),
      builder: (ctx) => SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: widget,
        ),
      ),
    );
  }
}
