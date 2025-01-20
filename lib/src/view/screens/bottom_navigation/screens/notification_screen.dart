import 'package:coherent/src/view/screens/bottom_navigation/screens/dashboard/appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotficationScreen extends StatefulWidget {
  const NotficationScreen({super.key});

  @override
  State<NotficationScreen> createState() => _NotficationScreenState();
}

class _NotficationScreenState extends State<NotficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(AppointmentScreen());
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text("AP"),
              ),
              title: Text("Appointment scheduled"),
              subtitle: Text("Appointment scheduled with Dr.Fayyaz Ali"),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index == 4
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Earlier",
                    style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              : SizedBox();
        },
      ),
    );
  }
}
