import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/messaging/doctor_list_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/messaging/nurse_screen_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class MainLandingScreen extends StatelessWidget {
  const MainLandingScreen({super.key});

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              labelColor: AppColors.primaryColor,
              indicatorColor: AppColors.primaryColor,
              tabs: [
                Tab(
                  icon: Image.asset(
                    AppAssets.doctorIcon,
                    width: 35,
                  ),
                  text: "Doctors",
                ),
                Tab(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, top: 5),
                    child: Image.asset(
                      AppAssets.nurseIcon,
                      width: 35,
                    ),
                  ),
                  text: "Nurses",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [DoctorListScreen(), NurseScreenList()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
