import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool newValue) onChange;

  const MySwitchButton(this.value, this.onChange);
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: value,
        onChanged: onChange,
        trackColor: Colors.grey,
        activeColor: Colors.blue,
      ),
    );
  }
}
