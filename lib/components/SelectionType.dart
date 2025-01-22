import 'package:flutter/material.dart';

class SelectionType extends StatelessWidget {
  final List<String> types;
  final String selected;
  final double? fontSize;
  final Function(String) onTap;

  const SelectionType({
    required this.types,
    required this.selected,
    required this.onTap,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          types.length,
          (index) => InkWell(
            onTap: () {
              onTap(types[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 3),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: selected == types[index]
                    ? Colors.white
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                types[index],
                style: TextStyle(
                  fontSize: fontSize ?? 18,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
