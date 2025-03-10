import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({super.key});
  final List<Map<String, dynamic>> packages = [
    {
      "title": "Fertility Testing and Diagnosis",
      "services": ["Initial Consultation", "Blood Tests and Ultrasound"],
      "icon": Icons.medical_services
    },
    {
      "title": "Fertility Treatments",
      "services": ["Ovulation Induction", "IUI", "IVF"],
      "icon": Icons.local_hospital
    },
    {
      "title": "Fertility Counseling",
      "services": ["Support and guidance for fertility treatments"],
      "icon": Icons.support_agent
    },
    {
      "title": "Monitoring Packages",
      "services": ["Regular scans and blood tests to track treatment progress"],
      "icon": Icons.monitor_heart
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fertility Packages",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[700],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final package = packages[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(package["icon"], color: Colors.purple, size: 30),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            package["title"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        package["services"].length,
                        (i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  package["services"][i],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
