import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorCard extends StatelessWidget {
  final Color? cardColor;
  final String? name;
  final String? image;
  final String? speciality;

  const DoctorCard({super.key, this.image, this.cardColor, this.name, this.speciality});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(60, 140, 200, 1), // Darker Blue
                Color.fromRGBO(80, 160, 222, 1), // Base Color
                Color.fromRGBO(130, 190, 240, 1), // Lighter Blue
                Color.fromRGBO(180, 220, 250, 1)
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(2, 4),
              ),
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 2.h,
                ),
                Image.asset(
                  image ?? '',
                  width: 20.w,
                  height: 10.h,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(speciality ?? ''), Text(name ?? '')],
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
