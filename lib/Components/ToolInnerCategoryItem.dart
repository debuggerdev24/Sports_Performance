import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/Components/VideoPlay.dart';
import 'package:sportperformance/Utils/Utils.dart';

class ToolInnerCategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final Function()? onTap;

  const ToolInnerCategoryItem(
      {required this.image, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    var translator = TranslatorGenerator.instance;
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4.5,
                  height: MediaQuery.of(context).size.width / 3.8,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MyButton(
                        title: translator.getString("General.start"),
                        fontSize: 12,
                        sizeHieght: 35,
                        color: Colors.black,
                        sizeWidth: MediaQuery.of(context).size.width / 5,
                        onTap: () {
                          if (onTap == null) {
                            Utils.showMyDialog(
                              context,
                              VideoPlay(
                                video: '',
                              ),
                              padding: EdgeInsets.zero,
                            );
                          } else {
                            onTap!();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
