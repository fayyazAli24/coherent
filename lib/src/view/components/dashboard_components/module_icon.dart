import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ModuleIcon extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final VoidCallback callback;
  const ModuleIcon({super.key, required this.color, required this.image, required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Center(
              child: Image.asset(
                image,
                width: 9.w,
                // height: 7.h,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
