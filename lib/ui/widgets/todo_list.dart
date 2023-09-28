import 'package:flutter/material.dart';
import 'package:todo_list/data/models/todo.dart';
import 'package:todo_list/ui/widgets/todo_item.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> todos;
  const ToDoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.zero,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoItem(todo: todos[index]);
      },
    );
  }
}
