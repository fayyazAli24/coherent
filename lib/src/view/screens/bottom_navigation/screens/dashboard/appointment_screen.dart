import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../components/common_components/custom_app_bar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Prescription",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Changes the shadow's direction
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Appointment Booked",
                    style: TextStyle(color: index <= 3 ? Colors.blue : Colors.redAccent, fontSize: 20),
                  ),
                  Text(
                    "Dr Saleem Rajput",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    "02 March 2025",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index == 3
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Earlier",
                    style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              : SizedBox();
        },
      ),
    );
  }
}
