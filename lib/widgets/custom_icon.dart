import 'package:flutter/material.dart';

Widget customIcon(IconData icon, Function onTap) {
  return GestureDetector(
    onTap: () => onTap,
    child: Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Icon(
          icon,
        ),
      ),
    ),
  );
}
