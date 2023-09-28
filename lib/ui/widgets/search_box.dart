import 'package:flutter/material.dart';
import 'package:todo_list/ui/resources/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsetsDirectional.only(top: size.height * 0.03),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        cursorColor: primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          prefixIconColor: primaryColor,
          fillColor: primaryColor,

          hintText: "Search",
          focusColor: primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(100),
          ),
          // contentPadding: EdgeInsetsDirectional.zero,
        ),
      ),
    );
  }
}
