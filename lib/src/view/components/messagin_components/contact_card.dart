import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final String medicineType;
  const ContactCard({super.key, required this.doctorName, required this.imagePath, required this.medicineType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              imagePath,
              width: 35,
            ),
          ),
          title: Text(doctorName),
          subtitle: Text(
            medicineType,
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey.shade600),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Divider(),
        ),
      ],
    );
  }
}
