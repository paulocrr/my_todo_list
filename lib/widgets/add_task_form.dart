import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddTaskForm extends StatefulWidget {
  final Function(String) alDarClick;
  const AddTaskForm({required this.alDarClick, super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _taskDescriptionController = TextEditingController();
  var countCharacters = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _taskDescriptionController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Escribe la tarea que quieras',
              counterText: '$countCharacters letra(s)',
              labelText: 'Tarea',
            ),
            onChanged: (value) {
              setState(() {
                countCharacters = value.length;
              });
            },
          ),
          ElevatedButton.icon(
            onPressed: _taskDescriptionController.text.isEmpty
                ? null
                : () {
                    widget.alDarClick(_taskDescriptionController.text);

                    _taskDescriptionController.clear();
                    FocusManager.instance.primaryFocus?.unfocus();

                    setState(() {
                      countCharacters = 0;
                    });

                    AwesomeDialog(
                      context: context,
                      autoHide: const Duration(seconds: 2),
                      title: 'Se agrego la tarea',
                      customHeader: Lottie.asset(
                        'assets/success-animation.json',
                        repeat: false,
                      ),
                    ).show();
                  },
            icon: const Icon(Icons.add),
            label: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _taskDescriptionController.dispose();
  }
}
