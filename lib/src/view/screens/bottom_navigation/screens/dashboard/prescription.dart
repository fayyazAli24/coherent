import 'package:coherent/src/controller/bottom_navigation_controller/dashboard_controller.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:coherent/src/view/components/common_components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<PrescriptionScreen> {
  final dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Prescription",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: ListView.separated(
        itemCount: dashboardController.prescriptionCardList.length,
        itemBuilder: (context, index) {
          var item = dashboardController.prescriptionCardList[index];
          return item;
        },
        separatorBuilder: (BuildContext context, int index) {
          return index == 4
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
