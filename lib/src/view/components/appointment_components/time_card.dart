import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final List<String> times;
  final int length;
  const TimeCard({super.key, required this.times, required this.length});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 columns
        crossAxisSpacing: 12, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
        childAspectRatio: 1.5, // Adjust the aspect ratio for better appearance
      ),
      itemCount: length,
      itemBuilder: (context, index) {
        return TimeSlot(time: times[index]);
      },
    );
  }
}

class TimeSlot extends StatelessWidget {
  final String time;

  TimeSlot({required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
