import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:number_display/number_display.dart';

Widget statsContainer(int number, String statName) {
  final display = createDisplay(length: 3);

  return RelativeBuilder(builder: (context, height, width, sy, sx) {
    return Column(
      children: [
        Text(
          '${display(number)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: sy(20),
          ),
        ),
        SizedBox(height: 5),
        Text(
          statName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: sy(10),
          ),
        ),
      ],
    );
  });
}
