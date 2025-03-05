import 'package:coherent/src/controller/bottom_navigation_controller/dashboard_controller.dart';
import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:coherent/src/view/components/dashboard_components/appointment_card.dart';
import 'package:coherent/src/view/components/dashboard_components/module_icon.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/appointment_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/prescription.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/results_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/vital_signs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final billController = Get.put(DashboardController());
  final dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 1.6.h,
          ),
          Center(
            child: Container(
              width: 95.w,
              height: 17.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.background),
                  fit: BoxFit.cover, // Ensures the background covers the entire container
                ),
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(red: 0.8, green: 0.8, blue: 0.8), // Shadow color
                    offset: Offset(0, 4), // Horizontal and vertical offset
                    blurRadius: 10, // Blur radius
                    spreadRadius: 2, // Spread radius
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.app_logo, // Replace with your child image asset
                  width: 50.w, // Adjust the size of the child image as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          modules()

          // Expanded(flex: 2, child: buildIcons())
        ],
      )),
    );
  }

  Widget modules() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(red: 0.8, green: 0.8, blue: 0.8), // Shadow color
                offset: Offset(0, 4), // Horizontal and vertical offset
                blurRadius: 10, // Blur radius
                spreadRadius: 2, // Spread radius
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),

              /// location section
              Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(
                    Icons.location_on,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    'Home-',
                    style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text('Dubai Production City,Dubai', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(),

              /// module selection section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ModuleIcon(
                    callback: () {
                      Get.to(() => AppointmentScreen());
                    },
                    color: Colors.green,
                    image: AppAssets.appointment,
                    title: 'Appointment',
                  ),
                  ModuleIcon(
                    callback: () {
                      Get.to(() => VitalSignsScreen());
                    },
                    color: Colors.deepPurpleAccent,
                    image: AppAssets.vital_signs,
                    title: 'Vital Signs',
                  ),
                  ModuleIcon(
                      callback: () {
                        Get.to(() => PrescriptionScreen());
                      },
                      color: Colors.lightGreen,
                      image: AppAssets.prescription_logo,
                      title: 'Prescription'),
                  ModuleIcon(
                      callback: () {
                        Get.to(() => ReportsScreen());
                      },
                      color: Colors.teal,
                      image: AppAssets.reports_logo,
                      title: 'Results'),
                ],
              ),
              Divider(),

              /// recent appointment section
              AppointmentCard(
                date: DateTime.now().add(Duration(days: 3, hours: 1, minutes: 10)), // 4 days ago, 1:10 hours earlier

                shadow: false,
                status: 'confirmed',
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      'Your Health Feed',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ReportsScreen());
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      var item = dashboardController.resultCards[index];
                      return item;
                    }),
              ),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        )
      ],
    );
  }
}
