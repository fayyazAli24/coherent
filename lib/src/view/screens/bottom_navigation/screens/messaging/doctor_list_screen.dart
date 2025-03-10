import 'package:coherent/src/controller/bottom_navigation_controller/messaging_controller.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/messaging/messaging_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MessaginController messaginController = Get.put(MessaginController());
    return Scaffold(
      body: ListView.builder(
          itemCount: messaginController.doctorList.length,
          itemBuilder: (context, index) {
            var item = messaginController.doctorList[index];
            return InkWell(
                onTap: () {
                  Get.to(() => MessagingScreen(
                        item: item,
                      ));
                },
                child: item);
          }),
    );
  }
}
