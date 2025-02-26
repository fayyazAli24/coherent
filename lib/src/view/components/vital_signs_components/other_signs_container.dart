import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final String title;
  final String value;
  final trailingIcon;
  final trailColor;

  const SignContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      required this.iconColor,
      required this.textColor,
      required this.trailingIcon,
      required this.trailColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.w, // Adjust based on UI needs
        height: 21.h,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// **Title Text**
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),

                /// **Icon + Value**
                Row(
                  children: [
                    Icon(icon, color: iconColor, size: 20),
                    SizedBox(width: 4),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),

                /// **Synced Info**
                Text(
                  "Synced on",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                SizedBox(height: 1.h),

                Text(
                  "30 Oct 2024",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text('Current Vitals'),
                SizedBox(
                  height: 1.h,
                ),
                Image.asset(
                  AppAssets.vital_signs, // Replace with your image path
                  width: 40, // Adjust size as needed
                  height: 40,
                ),
              ],
            )
          ],
        ));
  }
}
