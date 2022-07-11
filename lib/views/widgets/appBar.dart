import 'package:flutter/material.dart';

Widget appBar2({Widget left, String title, Widget right}) {
  return AppBar(
      //kolla yt för annan appbar
      leading: left,
      //leadingWidth: 70,
      title: Text(
        '$title',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [right]);
}
