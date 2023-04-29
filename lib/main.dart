import 'package:flutter/material.dart';

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
  var hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                obscureText: hideText,
                autofocus: true,
              ),
              InkWell(
                splashColor: Colors.red,
                onTapDown: (_) {
                  setState(() {
                    hideText = false;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    hideText = true;
                  });
                },
                child: Container(
                  child: const Text(
                    'Mostrar password',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(color: Colors.blue),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  margin: EdgeInsets.all(8),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('boton'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
