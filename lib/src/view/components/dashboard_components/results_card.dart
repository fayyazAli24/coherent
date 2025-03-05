import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResultsCard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final String? value;
  final DateTime? dateTime;
  final IconData? trail;
  final String? image;

  const ResultsCard(
      {super.key, this.title, this.icon = Icons.bloodtype, this.value, this.dateTime, this.trail, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50.w,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Card content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'HbA1c Results',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(icon ?? Icons.bloodtype, color: Colors.red, size: 24),
                    SizedBox(width: 4),
                    Text(
                      value ?? '7.22%',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Synced on",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  dateTime != null ? DateFormat('dd MMM yyyy').format(dateTime!) : "30 Oct 2024, 10:30 AM",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(trail ?? Icons.monitor_heart, color: Colors.green, size: 32),
                ),
              ],
            ),
            // Positioned image at top-right corner
            if (image != null)
              Positioned(
                top: 0,
                right: 0,
                child: ClipOval(
                  child: Image.asset(
                    image!,
                    width: 60,
                    height: 60,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
