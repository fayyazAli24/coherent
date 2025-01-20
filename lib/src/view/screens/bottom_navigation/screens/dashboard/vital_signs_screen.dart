import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:coherent/src/view/components/vital_signs_components/height_container.dart';
import 'package:coherent/src/view/components/vital_signs_components/other_signs_container.dart';
import 'package:flutter/material.dart';

import '../../../../components/common_components/custom_app_bar.dart';

class VitalSignsScreen extends StatefulWidget {
  const VitalSignsScreen({super.key});

  @override
  State<VitalSignsScreen> createState() => _VitalSignsScreenState();
}

class _VitalSignsScreenState extends State<VitalSignsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Vital Signs",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeightContainer(
              height: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 26,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              value: Row(
                children: [
                  Text(
                    "172.2 cm",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "(5,8)",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            SignContainer(
                icon: Icons.severe_cold,
                title: "Weight",
                value: "88 KG",
                iconColor: Colors.blue,
                textColor: Colors.green),
            SignContainer(
                icon: Icons.bloodtype_outlined,
                title: "Blood Pressure",
                value: "90 *F (32.22 *C)",
                iconColor: Colors.redAccent,
                textColor: Colors.green),
            SignContainer(
                icon: Icons.severe_cold,
                title: "Temperature",
                value: "119/78 mmHg",
                iconColor: Colors.blue,
                textColor: Colors.green),
            SignContainer(
              icon: Icons.severe_cold,
              title: "SPO2",
              value: "98 %",
              iconColor: Colors.blue,
              textColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
