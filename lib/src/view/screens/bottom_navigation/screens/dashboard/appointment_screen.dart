import 'package:coherent/src/controller/bottom_navigation_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../components/common_components/custom_app_bar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final dashboardController = Get.put(DashboardController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Appointment",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: ListView.separated(
        itemCount: dashboardController.appointmentList.length,
        itemBuilder: (context, index) {
          var item = dashboardController.appointmentList[index];
          return item;
        },
        separatorBuilder: (BuildContext context, int index) {
          return index == 1
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Past Appointments",
                    style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              : SizedBox();
        },
      ),
    );
  }
}
