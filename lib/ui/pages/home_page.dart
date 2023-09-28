import 'package:flutter/material.dart';
import 'package:todo_list/ui/resources/colors.dart';
import 'package:todo_list/ui/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          const ToDoAppBar(),
          Container(),
        ],
      ),
    );
  }
}
