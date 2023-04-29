import 'package:flutter/material.dart';
import 'package:my_todo_list/models/task.dart';
import 'package:my_todo_list/widgets/add_task_form.dart';
import 'package:my_todo_list/widgets/task_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Mi primera Tarea',
      date: '29-04-2023',
    ),
    Task(
      id: '2',
      title: 'Mi segunda Tarea',
      date: '29-04-2023',
    ),
    Task(
      id: '3',
      title: 'Mi tercera Tarea',
      date: '29-04-2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: Column(
        children: [
          const AddTaskForm(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: tasks.map((e) {
                return TaskItem(task: e);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
