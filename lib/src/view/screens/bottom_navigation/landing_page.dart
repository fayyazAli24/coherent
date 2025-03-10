import 'package:coherent/src/view/components/dashboard_components/drawer.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/appointment/select_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/bottom_navigation_controller/bottom_navigation_controller.dart';
import '../../../core/utils/app_colors.dart';
import '../../components/common_components/custom_app_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var bottomNavigationController = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(
            backbutton: false,
            text: bottomNavigationController.appBarText.value,
            backgroundColor: AppColors.primaryColor,
          ),
          drawer: CustomDrawer(),
          body: PopScope(
              canPop: false, child: bottomNavigationController.pages[bottomNavigationController.pageIndex.value]),
          bottomNavigationBar: _buildBottomNavigationBar(),
        ));
  }

  Widget _buildBottomNavigationBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 7.5.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(index: 0, icon: Icons.home, label: "Home"),
              _buildBottomNavItem(index: 1, icon: Icons.medical_services_outlined, label: "Packages"),
              const SizedBox(width: 60), // Space for the middle button
              _buildBottomNavItem(index: 2, icon: Icons.notification_add_outlined, label: "Notification"),
              _buildBottomNavItem(index: 3, icon: Icons.message_outlined, label: "Messages"),
            ],
          ),
        ),
        Positioned(
          bottom: 25, // Adjust this value to control overlap
          left: MediaQuery.of(context).size.width / 2 - 34, // Center the button
          child: FloatingActionButton(
            onPressed: () {
              Get.to(() => SelectDoctorScreen());
            },
            backgroundColor: AppColors.white,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, size: 32, color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = index == bottomNavigationController.bottomNavigationIndex.value;
    return InkWell(
      onTap: () {
        bottomNavigationController.bottomNavigationIndex.value = index;
        bottomNavigationController.selectBottomTab(index);
        bottomNavigationController.setIndex(index);
        bottomNavigationController.setTitle();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.7.h),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade300 : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 0.5.h), // Spacing between icon and text
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
