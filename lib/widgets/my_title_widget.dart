import 'package:flutter/material.dart';
import 'package:my_todo_list/widgets/task_item.dart';

class MyTitleWidget extends StatelessWidget {
  const MyTitleWidget({
    super.key,
    required this.widget,
  });

  final TaskItem widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.task.title,
      style: TextStyle(
        decoration: widget.task.isDone
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: Colors.blue,
      ),
    );
  }
}
