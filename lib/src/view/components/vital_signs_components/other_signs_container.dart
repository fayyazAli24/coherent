import 'package:flutter/material.dart';

import 'line_chart.dart';

class SignContainer extends StatelessWidget {
  final icon;
  final iconColor;
  final textColor;
  final title;
  final value;
  var data;

  SignContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      required this.iconColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3), // Changes the shadow's direction
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Text(
                  value,
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                Text("2 Days Ago", style: TextStyle(fontSize: 15))
              ],
            ),
            SizedBox(
              height: 110,
              width: 160,
              child: LineChartWidget(),
            )
          ],
        ),
      ),
    );
  }
}
