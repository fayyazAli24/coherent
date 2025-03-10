import 'package:coherent/src/controller/bottom_navigation_controller/bottom_navigation_controller.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var drawerController = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple,
                  child: Text(
                    'FA',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Fayyaz Ali',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          _buildBottomNavItem(index: 0, icon: Icons.home, label: "Home"),
          _buildBottomNavItem(index: 1, icon: Icons.medical_services_outlined, label: "Packages"),
          _buildBottomNavItem(index: 2, icon: Icons.notification_add_outlined, label: "Notification"),
          _buildBottomNavItem(index: 3, icon: Icons.message_outlined, label: "Messages"),
          _buildBottomNavItem(index: 4, icon: Icons.question_answer, label: 'FAQ')
        ],
      ),
    );
  }

  Widget _buildBottomNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = index == drawerController.bottomNavigationIndex.value;
    return InkWell(
      onTap: () {
        drawerController.bottomNavigationIndex.value = index;
        drawerController.selectBottomTab(index);
        drawerController.setIndex(index);
        drawerController.setTitle();
        Get.back();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.7.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade300 : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 0.5.h), // Spacing between icon and text
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
