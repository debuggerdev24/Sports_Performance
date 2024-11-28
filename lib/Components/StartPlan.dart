import 'package:flutter/material.dart';
import 'package:sportperformance/Components/MyButtton.dart';

class StartPlan extends StatelessWidget {
  final String title;
  final String subTitle;

  const StartPlan({
    required this.title,
    required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).iconTheme.color,
                size: 10,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 20),
          MyButton(
            title: 'START',
            borderRadius: 5,
            sizeHieght: 50,
            fontWeight: FontWeight.w500,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
