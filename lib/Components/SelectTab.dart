import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/main.dart';

class SelectTab extends StatelessWidget {
  final String title;
  final String index;
  final String selected;
  final VoidCallback onTap;

  const SelectTab({
    required this.title,
    required this.index,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final translator = TranslatorGenerator.instance;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: size.width / 3.5,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: selected == index
              ? Theme.of(context).primaryColorLight
              : darkMode.value
                  ? Colors.grey
                  : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            translator.getString(title),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12,
                  color: selected == index
                      ? Theme.of(context).primaryColorDark
                      : Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
