import 'package:coherent/src/controller/bottom_navigation_controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/faq.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DashboardController());
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.faqData.length,
        itemBuilder: (context, index) {
          return FaqCard(
            question: controller.faqData[index]['question']!,
            answer: controller.faqData[index]['answer']!,
          );
        },
      ),
    );
  }
}
