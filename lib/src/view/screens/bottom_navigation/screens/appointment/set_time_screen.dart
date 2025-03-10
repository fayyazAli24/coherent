import 'package:coherent/src/controller/bottom_navigation_controller/appointment_controller.dart';
import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:coherent/src/view/components/appointment_components/doctor_card.dart';
import 'package:coherent/src/view/components/appointment_components/weekly_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../components/appointment_components/time_card.dart';
import '../../../../components/common_components/custom_button.dart';

class SetTimeScreen extends StatefulWidget {
  DoctorCard? item;
  SetTimeScreen({super.key, this.item});

  @override
  State<SetTimeScreen> createState() => _SetTimeScreenState();
}

class _SetTimeScreenState extends State<SetTimeScreen> {
  final AppointmentController appointmentController = Get.put(AppointmentController());
  late List<DateTime> next7Days;
  late List<String> slots;
  var times = [
    '9:15 AM',
    '9:30 AM',
    '9:45 AM',
    '10:00 AM',
    '10:15 AM',
    '10:30 AM',
    '10:45 AM',
    '11:00 AM',
    '11:15 AM',
    '11:30 AM',
    '11:45 AM',
    '12:00 PM',
    '12:15 PM',
    '12:30 PM',
    '12:45 PM',
    '01:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    next7Days = List.generate(7, (index) => today.add(Duration(days: index)));

    // Generate slots only once
    slots = next7Days.map((date) {
      if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
        return '0 slots';
      } else {
        return '${(16 - date.day % 5).clamp(1, 16)} slots'; // Example variation
      }
    }).toList();

    appointmentController.slotCount.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    List<DateTime> next7Days = List.generate(7, (index) => today.add(Duration(days: index)));
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SizedBox(
          width: 98.w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[700]!, // Light grey
                        Colors.grey[500]!, // Medium grey
                        Colors.grey[400]!, // Dark grey
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                      child: Image.asset(
                    widget.item?.image ?? '',
                    width: 45.w,
                    height: 25.h,
                  )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    widget.item?.name ?? '',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text(
                    'MBBS ${widget.item?.speciality ?? ''} Specialist',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 17.sp, color: Colors.grey.shade500),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() => Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Text(DateFormat('MMMM dd').format(appointmentController.date.value)))),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: SizedBox(
                    height: 8.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: next7Days.length,
                        itemBuilder: (context, index) {
                          return WeeklyCard(slot: slots[index], date1: next7Days[index], date2: next7Days[index]);
                        }),
                  ),
                ),
                Obx(() => Padding(
                      padding: EdgeInsets.only(left: 2.w, top: 2.h),
                      child: appointmentController.slotCount.value == 0
                          ? Text('Please Select a day with available slots')
                          : Text(
                              'Select Time',
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                            ),
                    )),
                SizedBox(
                  height: 1.h,
                ),
                Obx(() => SizedBox(
                      height: 33.h,
                      child: TimeCard(
                        length: appointmentController.slotCount.value,
                        times: times,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensure space between buttons
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Get.back();
                        },
                        child: Text('Back', style: TextStyle(color: AppColors.white)),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onTap: () {},
                        child: Text(
                          'Continue',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
