import 'dart:ui';

import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/appointment_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/prescription.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/reports_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/vital_signs_screen.dart';
import 'package:get/get.dart';

import '../../core/utils/keys.dart';

class DashboardController extends GetxController {
  List<String> items() {
    return [
      newBillKey,
      viewBillKey,
      filterBill,
      blockBillKey,
    ];
  }

  List<String> itemsIcons() {
    return [
      AppAssets.vital_signs,
      AppAssets.reports_logo,
      AppAssets.prescription_logo,
      AppAssets.appointment,
    ];
  }

  Map<String, VoidCallback> onItemsTap() {
    return {
      newBillKey: () {
        Get.to(VitalSignsScreen());
      },
      viewBillKey: () {
        Get.to(ReportsScreen());
      },
      filterBill: () {
        Get.to(PrescriptionScreen());
      },
      blockBillKey: () {
        Get.to(AppointmentScreen());
      }
    };
  }
}
