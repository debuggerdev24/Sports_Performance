import 'package:flutter/material.dart';

class ToolsInnerCategory extends StatelessWidget {
  final String image;
  final String title;
  final Function()? onTap;

  const ToolsInnerCategory({
    required this.image,
    required this.title,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width / 3.5,
            height: size.width / 3.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Image.asset(image, fit: BoxFit.fill),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
