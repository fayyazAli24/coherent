import 'package:coherent/src/controller/bottom_navigation_controller/vital_sign_controller.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:coherent/src/view/components/vital_signs_components/line_chart.dart';
import 'package:coherent/src/view/components/vital_signs_components/other_signs_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../components/common_components/custom_app_bar.dart';

class VitalSignsScreen extends StatefulWidget {
  const VitalSignsScreen({super.key});

  @override
  State<VitalSignsScreen> createState() => _VitalSignsScreenState();
}

class _VitalSignsScreenState extends State<VitalSignsScreen> {
  @override
  Widget build(BuildContext context) {
    final vitalSignController = Get.put(VitalSignController());

    return Scaffold(
      appBar: CustomAppBar(
        text: "Vital Signs",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // BMI Graph
            Column(
              children: [
                Text('BMI Graph'),
                SizedBox(
                    width: 90.w,
                    height: 20.h,
                    child: LineChartWidget(
                      chartData: vitalSignController.getBmi(),
                    )),
              ],
            ),
            SizedBox(height: 16),

            // Vital Signs List
            Expanded(
              child: Obx(() {
                if (vitalSignController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                final vitalSigns = vitalSignController.getVitalSignsList();

                if (vitalSigns.isEmpty) {
                  return Center(child: Text("No vital signs available"));
                }

                return ListView.builder(
                  itemCount: vitalSigns.length,
                  itemBuilder: (context, index) {
                    final sign = vitalSigns[index];
                    return SignContainer(
                      icon: sign["icon"],
                      title: sign["title"],
                      value: sign["value"],
                      iconColor: sign["iconColor"],
                      textColor: sign["textColor"],
                      trailingIcon: sign["trailingIcon"],
                      trailColor: sign["trailColor"],
                      dateTime: sign["Date"],
                      // dateTime: sign[""],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
