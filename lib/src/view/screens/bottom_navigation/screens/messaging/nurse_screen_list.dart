import 'package:coherent/src/controller/bottom_navigation_controller/messaging_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'messaging_screen.dart';

class NurseScreenList extends StatelessWidget {
  const NurseScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    MessaginController messaginController = Get.put(MessaginController());
    return Scaffold(
      body: ListView.builder(
          itemCount: messaginController.nurseList.length,
          itemBuilder: (context, index) {
            var item = messaginController.nurseList[index];
            messaginController.doctorName = item.doctorName;
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
