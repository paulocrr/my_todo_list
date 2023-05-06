import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  final bool isDone;
  final void Function(bool?)? onChange;
  const MyCheckBox({this.isDone = false, this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.red,
      value: isDone,
      onChanged: onChange,
    );
  }
}
