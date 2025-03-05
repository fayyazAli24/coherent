import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/bottom_navigation_controller/bottom_navigation_controller.dart';
import '../../../core/utils/app_colors.dart';

class BottomNavigationButton extends StatelessWidget {
  final int index; // Index of this tab
  final RxInt selectedIndex; // Observable for selected index
  final IconData icon;
  const BottomNavigationButton({super.key, required this.index, required this.selectedIndex, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Update selected index when tapped
        var bottomNavigationController = Get.find<BottomNavigationController>();
        bottomNavigationController.selectBottomTab(index);
        bottomNavigationController.setIndex(index);
        bottomNavigationController.setTitle();
      },
      child: Obx(() {
        // Change color based on selection
        Color color = selectedIndex.value == index ? Colors.blue.shade300 : AppColors.primaryColor;
        return Container(
            width: 9.5.w,
            height: 4.5.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Icon(
              icon,
              color: Colors.white,
            )));
      }),
    );
  }
}
