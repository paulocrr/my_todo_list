import 'package:flutter/material.dart';
import 'package:my_todo_list/models/task.dart';
import 'package:my_todo_list/widgets/my_check_box.dart';
import 'package:my_todo_list/widgets/my_title_widget.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final Function(Task)? onRemove;
  const TaskItem({required this.task, this.onRemove, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: MyCheckBox(
          isDone: widget.task.isDone,
          onChange: (value) {
            setState(() {
              widget.task.isDone = value ?? false;
            });
          },
        ),
        title: MyTitleWidget(widget: widget),
        subtitle: Text(widget.task.date),
        trailing: IconButton(
          onPressed: () {
            final removeAction = widget.onRemove;

            if (removeAction != null) {
              removeAction(widget.task);
            }
          },
          icon: const Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
