import 'package:flutter/material.dart';

Widget mytitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "HABER",
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
      ),
      Text(
        "APP",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      )
    ],
  );
}
