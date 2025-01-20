import 'package:coherent/src/controller/bottom_navigation_controller/dashboard_controller.dart';
import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../components/common_components/title_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final billController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 100.w,
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
                          color: Colors.black.withOpacity(0.3), // Shadow color
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
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(flex: 2, child: buildIcons())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcons() {
    return GridView.builder(
      itemCount: billController.items().length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 1.2, // Keeps the box size the same
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: billController.onItemsTap()[billController.items()[index]],
          child: Card(
            elevation: 5,
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.25, // Increased width
                    height: MediaQuery.sizeOf(context).height * 0.1, // Increased height
                    child: Image.asset(
                      billController.itemsIcons()[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                  FittedBox(
                    child: TitleText(
                      title: billController.items()[index],
                      fontSize: 18, // Keep font size unchanged
                      color: AppColors.white,
                      weight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
