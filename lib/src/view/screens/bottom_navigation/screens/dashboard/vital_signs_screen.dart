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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        text: "Vital Signs",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Height Container (Full Width)
              HeightContainer(
                height: Row(
                  children: [
                    Icon(Icons.height, size: 26, color: AppColors.primaryColor),
                    SizedBox(width: 6),
                    Text(
                      "Height",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                value: Row(
                  children: [
                    Text(
                      "172.2 cm",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "(5'8\")",
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),

              SizedBox(height: 16), // Spacing

              // Grid Layout for Other Vitals
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (screenWidth > 600) ? 2 : 1, // 2 columns on tablets, 1 on phones
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.2, // Controls the height of items
                ),
                children: [
                  SignContainer(
                    icon: Icons.monitor_weight,
                    title: "Weight",
                    value: "88 KG",
                    iconColor: Colors.blue,
                    textColor: Colors.green,
                    trailingIcon: Icons.monitor_weight,
                    trailColor: Colors.blue,
                  ),
                  SignContainer(
                    icon: Icons.bloodtype_outlined,
                    title: "Blood Pressure",
                    value: "119/78 mmHg",
                    iconColor: Colors.redAccent,
                    textColor: Colors.green,
                    trailingIcon: Icons.bloodtype_sharp,
                    trailColor: Colors.redAccent,
                  ),
                  SignContainer(
                    icon: Icons.thermostat,
                    title: "Temperature",
                    value: "90°F (32.22°C)",
                    iconColor: Colors.orangeAccent,
                    textColor: Colors.green,
                    trailingIcon: Icons.thermostat,
                    trailColor: Colors.orangeAccent,
                  ),
                  SignContainer(
                    icon: Icons.monitor_heart,
                    title: "SPO2",
                    value: "98%",
                    iconColor: Colors.blue,
                    textColor: Colors.green,
                    trailingIcon: Icons.favorite,
                    trailColor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
