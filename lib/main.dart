import 'package:coherent/src/core/routes/app_routes.dart';
import 'package:coherent/src/core/routes/route_names.dart';
import 'package:coherent/src/view/screens/onboarding/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:responsive_sizer/responsive_sizer.dart'; // Import ResponsiveSizer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Coherent',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false, // Hide debug banner
          initialRoute: RouteNames.splash, // Set initial route to login
          getPages: AppRoutes.routes,
          home: const LoginScreen(),
        );
      },
    );
  }
}
