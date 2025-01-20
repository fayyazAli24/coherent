import 'dart:developer';

import 'package:coherent/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  String? _appLogoPath; // Optional: Path to your app logo

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller?.forward();

    // Set app logo path (replace with your actual path if needed)
    _appLogoPath = AppAssets.app_logo; // Example path

    // Delayed navigation after animation (modify logic as needed)
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        try {
          Get.offNamed(RouteNames.login);
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation?.value ?? 1,
                  child: Transform.scale(
                    scale: _animation?.value,
                    child: child,
                  ),
                );
              },
              child: // Conditional for logo display
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  _appLogoPath!,
                  // color: AppColors.appBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
