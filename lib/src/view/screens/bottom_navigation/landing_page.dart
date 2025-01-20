import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/bottom_navigation_controller/bottom_navigation_controller.dart';
import '../../../core/utils/app_colors.dart';
import '../../components/common_components/bottom_navigation_button.dart';
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
    return PopScope(
      canPop: false,
      child: Obx(() => Scaffold(
            appBar: CustomAppBar(
              backbutton: false,
              text: bottomNavigationController.appBarText.value,
              backgroundColor: AppColors.primaryColor,
            ),
            body: bottomNavigationController.pages[bottomNavigationController.pageIndex.value],
            bottomNavigationBar: Container(
              height: 70,
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: BottomNavigationButton(
                                index: 0,
                                selectedIndex: bottomNavigationController.bottomNavigationIndex,
                                icon: Icons.home),
                          ),
                        ),
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: BottomNavigationButton(
                              index: 1,
                              selectedIndex: bottomNavigationController.bottomNavigationIndex,
                              icon: Icons.medical_services_outlined,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          "Services",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: BottomNavigationButton(
                                index: 2,
                                selectedIndex: bottomNavigationController.bottomNavigationIndex,
                                icon: Icons.notification_add_outlined),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: BottomNavigationButton(
                                index: 3,
                                selectedIndex: bottomNavigationController.bottomNavigationIndex,
                                icon: Icons.message_outlined),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Messages",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
