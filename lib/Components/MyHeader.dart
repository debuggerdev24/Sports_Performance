import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';

class MyHeader extends StatelessWidget {
  final String title;
  final double? width;
  final double? textSize;
  final Color? textColor;
  final bool? noTranslate;

  const MyHeader(this.title,
      {this.width, this.textColor, this.textSize, this.noTranslate});
  @override
  Widget build(BuildContext context) {
    final TranslatorGenerator translator = TranslatorGenerator.instance;
    return Container(
      width: width,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          noTranslate == true ? title : translator.getString(title),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
    );
  }
}
