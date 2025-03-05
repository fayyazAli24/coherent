import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentCard extends StatelessWidget {
  final DateTime? date;
  final String? imagePath;
  final String? medicineType;
  final String? doctorName;
  final String? purpose;
  final String? status;
  final bool shadow;

  const AppointmentCard({
    super.key,
    this.date,
    this.imagePath,
    this.medicineType,
    this.doctorName,
    this.purpose,
    this.status,
    this.shadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(2, 4),
                  ),
                ]
              : [],
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    date != null ? DateFormat('dd MMM yyyy - hh:mm a').format(date!) : '13 Feb, 2025 - 12:20 PM',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    status ?? 'confirmed',
                    style: TextStyle(
                      color: status == 'confirmed'
                          ? Colors.green
                          : status == 'cancelled'
                              ? Colors.redAccent
                              : Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 3.w),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: Image.asset(
                        width: 10.w,
                        imagePath ?? AppAssets.doctorImage,
                      ),
                    ),
                    SizedBox(width: 1.5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicineType ?? 'General Medicine',
                          style: TextStyle(color: AppColors.grey),
                        ),
                        Text(
                          doctorName ?? 'Dr. James Wilson',
                          style: TextStyle(color: AppColors.black),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Purpose: ',
                            style: TextStyle(color: Colors.grey.shade600),
                            children: <TextSpan>[
                              TextSpan(
                                text: purpose ?? 'Alergy',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
