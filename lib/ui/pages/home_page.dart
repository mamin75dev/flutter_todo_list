import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/data/models/todo.dart';
import 'package:todo_list/ui/resources/colors.dart';
import 'package:todo_list/ui/widgets/app_bar.dart';
import 'package:todo_list/ui/widgets/search_box.dart';
import 'package:todo_list/ui/widgets/todo_list.dart';

var randomizer = Random();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tabs = ["All ToDos", "Future ToDos", "Done ToDos"];

  List<ToDo> todos = List.generate(
    100,
    (index) => ToDo(
      done: randomizer.nextBool(),
      title: "Todo ${index + 1}",
      date: "23/03/2023",
    ),
  );

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: sbgColor,
      body: Column(
        children: [
          ToDoAppBar(
            items: tabs,
            onPressed: (index) {
              setState(() {
                selected = index;
              });
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: size.width * .04),
              margin: EdgeInsetsDirectional.only(top: size.height * 0.01),
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(20)), color: bgColor),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBox(),
                  SizedBox(height: size.height * 0.07),
                  Text(
                    tabs[selected],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Expanded(child: ToDoList(todos: todos)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
