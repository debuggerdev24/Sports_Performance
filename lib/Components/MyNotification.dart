import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Utils/Color.dart';

class MyNotification extends StatelessWidget {
  final String title, subtitle;
  final String time;

  const MyNotification({
    required this.title,
    this.subtitle = '',
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    final translator = TranslatorGenerator.instance;
    print(time);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: secondaryColor.withOpacity(0.08),
                child: Transform.rotate(
                  angle: -35,
                  child: ImageIcon(
                    const AssetImage("assets/images/dumble.png"),
                    color: secondaryColor,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      time,
                      // "08 - April - 2023",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
