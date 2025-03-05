import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrescriptionCard extends StatelessWidget {
  final DateTime? date;
  final String? imagePath;
  final String? medicineType;
  final String? doctorName;
  final String? dosage;
  final bool shadow;
  final String? medicationName;

  const PrescriptionCard({
    super.key,
    this.date,
    this.imagePath,
    this.medicineType,
    this.doctorName,
    this.dosage,
    this.medicationName,
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
                    offset: const Offset(2, 4),
                  ),
                ]
              : [],
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Header with Date
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                date != null ? DateFormat('dd MMM yyyy').format(date!) : '01 Feb 2025',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 2.h),

            // Medicine Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                    child: Image.asset(
                      width: 10.w,
                      imagePath ?? AppAssets.doctorImage,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Medicine Type Tag
                      Container(
                        width: 25.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            medicineType ?? 'ORAL',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),

                      // Medicine Name
                      Text(
                        medicationName ?? "CAFLAM 50MG TABLET",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0.5.h),

                      // Doctor's Name
                      Text(
                        doctorName ?? 'Dr. Saleem Rajput',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 0.5.h),

                      // Dosage Information
                      Text(
                        dosage ?? 'Once Weekly, Next 50 Days',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
