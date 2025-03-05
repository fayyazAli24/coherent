import 'package:coherent/src/controller/bottom_navigation_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../components/common_components/custom_app_bar.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.put(DashboardController());
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        text: "Results",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: ListView.builder(
          itemCount: dashboardController.resultCardsIcons.length,
          itemBuilder: (context, index) {
            var item = dashboardController.resultCardsIcons[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.7.w),
              child: item,
            );
          }),
    );
  }
}
