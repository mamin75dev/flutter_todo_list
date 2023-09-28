import 'package:flutter/material.dart';
import 'package:todo_list/data/models/todo.dart';
import 'package:todo_list/ui/resources/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo});

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsetsDirectional.symmetric(horizontal: size.height * 0.01),
        decoration: BoxDecoration(color: sbgColor, borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsetsDirectional.only(bottom: size.height * 0.007),
        height: size.height * 0.08,
        child: Row(
          children: [
            Icon(Icons.check_box, color: secondaryColor),
            SizedBox(width: size.width * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    todo.date,
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ),
            Container(
              width: size.height * 0.04,
              height: size.height * 0.04,
              // margin: EdgeInsetsDirectional.only(end: size.width * 0.01),
              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Icon(Icons.delete, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
