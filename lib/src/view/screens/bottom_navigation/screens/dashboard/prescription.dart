import 'package:coherent/src/core/utils/app_colors.dart';
import 'package:coherent/src/view/components/common_components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Prescription",
        backgroundColor: AppColors.primaryColor,
        backbutton: true,
      ),
      body: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Changes the shadow's direction
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.blue.shade200, borderRadius: BorderRadius.circular(25)),
                    child: Center(child: Text("Intramuscular")),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "CAFLAM 50MG TABLET",
                    style: TextStyle(color: index <= 4 ? Colors.blue : Colors.redAccent, fontSize: 22),
                  ),
                  Text(
                    "Dr Saleem Rajput",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    "Once Weekly, Next 50 Days",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
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
