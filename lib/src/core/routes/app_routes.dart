import 'package:coherent/src/core/routes/route_names.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../view/screens/bottom_navigation/landing_page.dart';
import '../../view/screens/bottom_navigation/screens/dashboard/main_dashboard_screen.dart';
import '../../view/screens/onboarding/login_screen.dart';
import '../../view/screens/onboarding/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteNames.dashboardScreen,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: RouteNames.bottomNavigation,
      page: () => const LandingPage(),
    ),
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
    ),
  ];
}
