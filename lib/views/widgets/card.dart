import 'package:flutter/material.dart';

Widget card(
    {double width = double.infinity, double padding = 20, Widget child2}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: child2,
  );
}
