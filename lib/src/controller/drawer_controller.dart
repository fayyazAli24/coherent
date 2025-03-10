import 'package:coherent/src/view/screens/bottom_navigation/screens/faq_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/messaging/main_landing_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/notification_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/screens/bottom_navigation/screens/dashboard/main_dashboard_screen.dart';

class CustomDrawerController extends GetxController {
  @override
  void onInit() {
    setTitle();
    super.onInit();
  }

  var pageIndex = 0.obs;
  var bottomNavigationIndex = 0.obs;
  var appBarText = ''.obs;
  final pages = [const DashboardScreen(), ServiceScreen(), NotficationScreen(), MainLandingScreen(), FaqScreen()];

  void setIndex(int index) {
    pageIndex.value = index; // Update the index
  }

  Widget get currentScreen {
    switch (pageIndex.value) {
      case 1:
        return const DashboardScreen();
      case 2:
        return ServiceScreen();
      case 3:
        return const NotficationScreen();
      case 4:
        return const MainLandingScreen();
      default:
        return FaqScreen();
    }
  }

  void setTitle() {
    if (pageIndex.value == 0) {
      appBarText.value = "Home";
    } else if (pageIndex.value == 1) {
      appBarText.value = "Packages";
    } else if (pageIndex.value == 2) {
      appBarText.value = "Notification";
    } else if (pageIndex.value == 3) {
      appBarText.value = "Messages";
    } else if (pageIndex.value == 4) {
      appBarText.value = 'FAQ';
    }
  }

  void selectBottomTab(int index) {
    bottomNavigationIndex.value = index;
  }
}
