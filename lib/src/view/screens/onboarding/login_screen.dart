import 'package:coherent/src/core/routes/route_names.dart';
import 'package:coherent/src/view/components/common_components/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../services/common_services/app_service.dart';
import '../../components/common_components/custom_text_form.dart';
import '../../components/common_components/fractionally_elevated_button.dart';
import '../../components/common_components/title_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool passFilled = false;
  bool userFilled = false;

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image or color (if needed)
            // Container(color: AppColors.appBlue),

            // Main content
            SingleChildScrollView(
              child: Column(
                children: [
                  // Curved Container with Logo
                  ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      color: AppColors.primaryColor, // Replace with AppColors.appBlue
                      child: Center(
                        child: Image.asset(
                          AppAssets.app_logo,
                          width: MediaQuery.of(context).size.height * 0.25,
                        ),
                      ),
                    ),
                  ),

                  // Form Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSize.vrtSpace(20),
                          headingText("Login ID"),
                          AppSize.vrtSpace(5),
                          userTextField(userFilled),
                          AppSize.vrtSpace(15),
                          headingText("Password"),
                          AppSize.vrtSpace(5),
                          passTextField(passFilled),
                          AppSize.vrtSpace(10),
                          AppSize.vrtSpace(15),
                          loginButton(),
                          AppSize.vrtSpace(10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget registerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(RouteNames.signupScreen);
        },
        child: Row(
          children: [
            TitleText(
                title: "Already have an account? ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                )),
            TitleText(
                title: "Register",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }

  Padding forgotPasswordText() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(RouteNames.forgetPassword);
        },
        child: TitleText(
            title: "Forgot Password?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  CustomTextFormField passTextField(bool passFilled) {
    return CustomTextFormField(
      hint: "Password",
      filled: passFilled,
      // onChanged: (value) {
      //   if (value?.isNotEmpty ?? false) {
      //     // ref.read(getPasswordFieldFilledProvider.notifier).state = true;
      //   } else {
      //     // ref.read(getPasswordFieldFilledProvider.notifier).state = false;
      //   }
      // },
      // obscureText: authController.isObsecure.value,
      controller: passwordController,
      validator: validator,
      onSuffixTap: () {
        // authController.isObsecure.value = !authController.isObsecure.value;
        // print("----- ${authController.isObsecure.value}");
      },

      autovalidateMode: AutovalidateMode.onUserInteraction, obscureText: false,
      // suffix: authController.isObsecure.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
    );
  }

  CustomTextFormField userTextField(bool userFilled) {
    return CustomTextFormField(
      controller: userNameController,
      hint: "Email",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
          // ref.read(getUserFieldFilledProvider.notifier).state = true;
        } else {
          // ref.read(getUserFieldFilledProvider.notifier).state = false;
        }
      },
    );
  }

  Image buildIcons(String path) {
    return Image.asset(
      path,
      color: AppColors.white,
      height: 20,
      width: 20,
    );
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  Widget headingText(String text) {
    return HeadingText(
      text: text,
    );
  }

  Widget tagHeading(String text) {
    return HeadingText(
      text: text,
      fontSize: 20.sp,
      color: Colors.redAccent,
    );
  }

  Widget biometricText(String text) {
    return HeadingText(
      text: text,
      fontSize: 17.sp,
    );
  }

  Widget loginButton() {
    return Center(
      child: FractionallyElevatedButton(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              Get.toNamed(RouteNames.bottomNavigation);
            }
          },
          child: TitleText(
            title: "Login",
            color: Colors.white,
            fontSize: 20,
            weight: FontWeight.w700,
          )),
    );
  }

  Future loading() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> errorDialog(String msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: TitleText(
              title: msg,
              fontSize: 20,
              weight: FontWeight.w500,
            ),
          ),
          actions: [
            Center(
              child: FractionallyElevatedButton(
                onTap: () {},
                child: TitleText(
                  title: "OK",
                  color: AppColors.white,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Container footer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.deepOrangeAccent,
      ),
      child: Center(
        child: Column(
          children: [
            TitleText(
              title: "Copyright © 2025. All "
                  "rights reserved.",
              color: AppColors.white,
            ),
            AppSize.vrtSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIcons(AppAssets.facebook),
                  buildIcons(AppAssets.googlePlus),
                  buildIcons(AppAssets.linkedIn),
                  buildIcons(AppAssets.twitter),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start slightly above the bottom-left corner
    path.quadraticBezierTo(
      size.width / 2, size.height, // Control point at the bottom center
      size.width, size.height - 50, // Slightly above the bottom-right corner
    );
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(0, 0); // Top-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
