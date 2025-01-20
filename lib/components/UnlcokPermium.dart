import 'package:flutter/material.dart';


import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/extensions/context_extension.dart';

class UnlockPermium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ////final translator = TranslatorGenerator.instance;



    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/images/permium.PNG",
                width: size.width / 1.2,
                height: size.width / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: size.width / 1.5,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              context.translator.subscribeTitle,
              // translator.getString("Subscribe.title"),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: size.width / 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              context.translator.subscribeSubTitle,
              // translator.getString("Subscribe.subTitle"),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        MyButton(
          fontSize: 20,
          sizeHieght: 50,
          sizeWidth: size.width / 2,
          fontWeight: FontWeight.w400,
          title: context.translator.subscribeTextButton, //translator.getString("Subscribe.textButton"),
          onTap: () {},
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
