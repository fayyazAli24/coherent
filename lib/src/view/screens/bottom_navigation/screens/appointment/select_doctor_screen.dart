import 'package:coherent/src/controller/bottom_navigation_controller/appointment_controller.dart';
import 'package:coherent/src/view/components/common_components/custom_app_bar.dart';
import 'package:coherent/src/view/components/common_components/custom_text_form.dart';
import 'package:coherent/src/view/screens/bottom_navigation/screens/appointment/set_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectDoctorScreen extends StatelessWidget {
  const SelectDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final appointmentController = Get.put(AppointmentController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(
        text: 'Appointments',
        backbutton: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 92.w,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome! Fayyaz Ali',
                    style: TextStyle(fontSize: 17.sp, color: Colors.grey.shade600),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFormField(
                  controller: controller,
                  obscureText: false,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hint: 'What are you looking for',
                ),
                SizedBox(
                  height: 4.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Book Appointments with Top',
                    style: TextStyle(fontSize: 17.sp, color: Colors.grey.shade600),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                SizedBox(
                  height: 63.h,
                  child: ListView.builder(
                      itemCount: appointmentController.doctorList.length,
                      itemBuilder: (context, index) {
                        var item = appointmentController.doctorList[index];
                        return InkWell(
                            onTap: () {
                              Get.to(() => SetTimeScreen(
                                    item: item,
                                  ));
                            },
                            child: item);
                      }),
                ),
                SizedBox(
                  height: 5.5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
