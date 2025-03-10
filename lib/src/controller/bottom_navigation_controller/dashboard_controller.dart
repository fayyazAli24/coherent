import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:coherent/src/view/components/dashboard_components/results_card.dart';
import 'package:coherent/src/view/components/prescription_components/prescription_card.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/appointment_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/prescription.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/results_screen.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/vital_signs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/keys.dart';
import '../../view/components/dashboard_components/appointment_card.dart';

class DashboardController extends GetxController {
  List<String> items() {
    return [
      newBillKey,
      viewBillKey,
      filterBill,
      blockBillKey,
    ];
  }

  List<ResultsCard> resultCards = [
    ResultsCard(
      title: "HbA1c Level",
      icon: Icons.bloodtype,
      value: "5.8",
      dateTime: DateTime.now().subtract(Duration(days: 1)), // 1 day ago
      trail: Icons.check_circle,
    ),
    ResultsCard(
      title: "Blood Pressure",
      icon: Icons.favorite,
      value: "120/80 mmHg",
      dateTime: DateTime.now().subtract(Duration(days: 3)), // 3 days ago
      trail: Icons.favorite,
    ),
    ResultsCard(
      title: "Cholesterol Level",
      icon: Icons.local_hospital,
      value: "180 mg/dL",
      dateTime: DateTime.now().subtract(Duration(days: 7)), // 7 days ago
      trail: Icons.trending_up,
    ),
    ResultsCard(
      title: "Heart Rate",
      icon: Icons.monitor_heart,
      value: "72 bpm",
      dateTime: DateTime.now().subtract(Duration(days: 14)), // 14 days ago
      trail: Icons.graphic_eq_outlined,
    ),
    ResultsCard(
      title: "Oxygen Saturation",
      icon: Icons.thermostat,
      value: "98%",
      dateTime: DateTime.now().subtract(Duration(days: 21)), // 21 days ago
      trail: Icons.verified,
    ),
  ];

  List<ResultsCard> resultCardsIcons = [
    ResultsCard(
      title: "HbA1c Level",
      icon: Icons.bloodtype,
      value: "5.8",
      dateTime: DateTime.now().subtract(Duration(days: 1)), // 1 day ago
      trail: Icons.check_circle,
      image: AppAssets.hbIcon,
    ),
    ResultsCard(
      title: "Blood Pressure",
      icon: Icons.favorite,
      value: "120/80 mmHg",
      dateTime: DateTime.now().subtract(Duration(days: 3)), // 3 days ago
      trail: Icons.favorite,
      image: AppAssets.bloodPressure,
    ),
    ResultsCard(
      title: "Cholesterol Level",
      icon: Icons.local_hospital,
      value: "180 mg/dL",
      dateTime: DateTime.now().subtract(Duration(days: 7)), // 7 days ago
      trail: Icons.trending_up,
      image: AppAssets.cholestrol,
    ),
    ResultsCard(
      title: "Heart Rate",
      icon: Icons.monitor_heart,
      value: "72 bpm",
      dateTime: DateTime.now().subtract(Duration(days: 14)), // 14 days ago
      trail: Icons.graphic_eq_outlined,
      image: AppAssets.heartRate,
    ),
    ResultsCard(
      title: "Oxygen Saturation",
      icon: Icons.thermostat,
      value: "98%",
      dateTime: DateTime.now().subtract(Duration(days: 21)), // 21 days ago
      trail: Icons.verified,
      image: AppAssets.oxygenSaturation,
    ),
  ];

  List<AppointmentCard> appointmentList = [
    AppointmentCard(
      date: DateTime.now().add(Duration(days: 3, hours: 1, minutes: 10)), // 1 day ago, 2:15 hours earlier
      medicineType: "Cardiology",
      doctorName: "Dr. James Wilson",
      purpose: "Heart Checkup",
      status: "confirmed",
      imagePath: AppAssets.doctorImage,
    ),
    AppointmentCard(
      date: DateTime.now().add(Duration(days: 2, hours: 4, minutes: 30)), // 2 days ago, 4:30 hours earlier
      medicineType: "Dermatology",
      doctorName: "Dr. Sarah Adams",
      purpose: "Skin Allergy",
      status: "confirmed",
      imagePath: AppAssets.doctorFemaleImage1,
    ),
    AppointmentCard(
      date: DateTime.now().subtract(Duration(days: 2, hours: 5, minutes: 33)), // 3 days ago, 6:45 hours earlier
      medicineType: "Ophthalmology",
      doctorName: "Dr. David Brown",
      purpose: "Eye Test",
      status: "cancelled",
      imagePath: AppAssets.doctorMaleImage3,
    ),
    AppointmentCard(
      date: DateTime.now().subtract(Duration(days: 3, hours: 6, minutes: 45)), // 3 days ago, 6:45 hours earlier
      medicineType: "Ophthalmology",
      doctorName: "Dr. David Brown",
      purpose: "Eye Test",
      status: "confirmed",
      imagePath: AppAssets.doctorMaleImage3,
    ),
    AppointmentCard(
      date: DateTime.now().subtract(Duration(days: 4, hours: 1, minutes: 10)), // 4 days ago, 1:10 hours earlier
      medicineType: "Orthopedics",
      doctorName: "Dr. Michael Lee",
      purpose: "Knee Pain Treatment",
      status: "No Show",
      imagePath: AppAssets.doctorMaleImage4,
    ),
  ];

  List<PrescriptionCard> prescriptionCardList = [
    PrescriptionCard(
      date: DateTime.now(),
      imagePath: AppAssets.doctorImage,
      medicineType: 'ORAL',
      doctorName: 'Dr. James Wilson',
      medicationName: 'CAFLAM 50MG TABLET',
      dosage: 'For 10 Days',
    ),
    PrescriptionCard(
      date: DateTime.now(),
      imagePath: AppAssets.doctorMaleImage2,
      medicineType: 'ORAL',
      doctorName: 'Dr. John Smith',
      medicationName: 'Gabapentin 300mg',
      dosage: 'For 3 Days',
    ),
  ];

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

  List<Map<String, String>> faqData = [
    {
      'question': 'How do I log in to the Coherent app?',
      'answer':
          'You can log in using the credentials provided by your medical center or register using your MRN and demographic details.',
    },
    {
      'question': 'How can I review my appointments?',
      'answer':
          'Your previous and upcoming appointments are available in the "Appointments" section. Your nearest appointment is also displayed on your Dashboard.',
    },
    {
      'question': 'Can I schedule or reschedule an appointment through the app?',
      'answer': 'Yes, you can book, reschedule, or cancel appointments directly from the "Appointments" section.',
    },
    {
      'question': 'How can I access my medical records and test results?',
      'answer': 'Your vital signs, prescriptions, and lab results are available in the "Health Records" section.',
    },
    {
      'question': 'Can I consult with my doctor via the app?',
      'answer':
          'Yes, you can request a virtual consultation or send messages to your doctor through the app’s telehealth feature.',
    },
    {
      'question': 'How can I review prescriptions?',
      'answer':
          'You can review prescriptions by navigating to the "Prescriptions" section and selecting the required prescription.',
    },
    {
      'question': 'What should I do if I forget my password?',
      'answer':
          'Click on "Forgot Password" on the login screen and follow the steps to reset your password using your registered email or phone number.',
    },
    {
      'question': 'How do I get reminders for my medications and upcoming appointments?',
      'answer':
          'Enable push notifications in the app settings to receive timely alerts for medications, appointments, and health reminders.',
    },
    {
      'question': 'Is my health data secure in the app?',
      'answer':
          'Yes, the app uses advanced encryption and follows healthcare compliance standards to ensure your data remains private and secure.',
    },
    {
      'question': 'Who do I contact for technical support or assistance?',
      'answer': 'You can reach out to our support team via the provided helpline.',
    },
  ];
}
