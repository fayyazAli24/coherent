import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('13 Feb, 2025 - 12:20 PM'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'confirmed',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 3.w,
                ),
                CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    width: 10.w,
                    AppAssets.doctorImage,
                  ),
                  backgroundColor: Colors.blueGrey,
                ),
                SizedBox(
                  width: 1.5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General Medicine',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    Text(
                      'Dr.Daniel Hardman',
                      style: TextStyle(color: AppColors.black),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Patient: ',
                        style: TextStyle(color: Colors.grey.shade600),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'John Snow',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
