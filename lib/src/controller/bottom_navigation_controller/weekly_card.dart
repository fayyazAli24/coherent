import 'package:coherent/src/controller/bottom_navigation_controller/appointment_controller.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeeklyCard extends StatelessWidget {
  final String slot;
  final DateTime date1;
  final DateTime date2;
  const WeeklyCard({super.key, required this.slot, required this.date1, required this.date2});

  @override
  Widget build(BuildContext context) {
    AppointmentController controller = Get.put(AppointmentController());
    return Obx(() {
      bool isSelected = (controller.date.value == date1) && (controller.selectedSlot.value == slot);
      return InkWell(
        onTap: () {
          controller.selectSlot(slot, date1);
          var slots = slot;
          var value = slots.substring(0, 2);
          if (value != 'No') {
            controller.slotCount.value = int.tryParse(value)!;
            controller.date.value = date1;
            return;
          }
          controller.slotCount.value = 0;
          controller.date.value = date1;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Container(
            width: 12.5.w,
            // margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  DateFormat('E').format(date1),
                  style: TextStyle(fontSize: 14.sp, color: isSelected ? Colors.white : Colors.black),
                ),
                Text(
                  DateFormat('d').format(date2),
                  style: TextStyle(fontSize: 14.sp, color: isSelected ? Colors.white : Colors.black),
                ),
                Text(slot, style: TextStyle(fontSize: 12.5.sp, color: isSelected ? Colors.white : Colors.black)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
