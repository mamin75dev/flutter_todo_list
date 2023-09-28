import 'package:flutter/material.dart';
import 'package:todo_list/ui/resources/colors.dart';

class ToDoAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<String> items;
  final Function(int) onPressed;
  const ToDoAppBar({super.key, required this.items, required this.onPressed});

  @override
  State<ToDoAppBar> createState() => _ToDoAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ToDoAppBarState extends State<ToDoAppBar> {
  int index = 0;

  double changePosition(double width) {
    switch (index) {
      case 0:
        return width * (0.03 + 0.01);
      case 1:
        return width * (0.03 + 0.01 + 0.3 + 0.009);
      case 2:
        return width * (0.03 + 0.01 + 0.3 + 0.009 + 0.3 + 0.009);
      default:
        return width * (0.03 + 0.01);
    }
  }

  GestureDetector tabItem(Size size, int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = i;
        });
        widget.onPressed(i);
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.3,
        child: Text(
          widget.items[i],
          style: index == i ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.125,
      color: sbgColor,
      padding: EdgeInsetsDirectional.only(top: size.height * 0.05),
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.fastLinearToSlowEaseIn,
            top: size.height * 0.006,
            bottom: size.height * 0.011,
            left: changePosition(size.width),
            duration: const Duration(milliseconds: 500),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.3,
              height: size.height * 0.068,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [primaryColor, secondaryColor]),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: lineColor),
              ),
              height: size.height * 0.07,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: size.width * 0.01,
                vertical: size.height * 0.005,
              ),
              margin: EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tabItem(size, 0),
                  tabItem(size, 1),
                  tabItem(size, 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
