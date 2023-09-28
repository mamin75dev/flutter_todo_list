import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ToDo App',
      home: HomePage(),
    );
  }
}
