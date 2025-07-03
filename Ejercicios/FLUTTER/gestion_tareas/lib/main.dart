import 'package:flutter/material.dart';
import 'package:gestion_tareas/models/routes.dart';
import 'package:gestion_tareas/views/add_task_page.dart';
import 'package:gestion_tareas/views/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {Routes.addPage: (ctx) => AddTaskPage()},
    );
  }
}
