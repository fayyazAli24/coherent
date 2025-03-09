import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../components/common_components/title_text.dart';
import 'package:coherent/src/view/components/common_components/heading_text.dart';
import '../../../controller/auth_controller/auth_controller.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../services/common_services/app_service.dart';
import '../../components/common_components/custom_text_form.dart';
import '../../components/common_components/fractionally_elevated_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final mrnoController = TextEditingController();
  final emiratesIdController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dobController = TextEditingController();
  final authController = Get.put(AuthController());

  bool passFilled = false;
  bool userFilled = false;
  @override
  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    mrnoController.dispose();
    emiratesIdController.dispose();
    dobController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
                      color: AppColors
                          .primaryColor, // Replace with AppColors.appBlue
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
                          emailTextField(false),
                          AppSize.vrtSpace(10),
                          mrnoTextField(false),
                          AppSize.vrtSpace(10),
                          emiratesIdTextField(false),
                          AppSize.vrtSpace(10),
                          phoneNumberTextField(false),
                          AppSize.vrtSpace(10),
                          dobTextField(false),
                          AppSize.vrtSpace(10),
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
      controller: passwordController,
      validator: validator,
      onSuffixTap: () {},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: false,
    );
  }

  CustomTextFormField userTextField(bool userFilled) {
    return CustomTextFormField(
      controller: userNameController,
      hint: "full Name",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
        } else {}
      },
    );
  }

  CustomTextFormField emailTextField(bool? userFilled) {
    return CustomTextFormField(
      controller: emailController,
      hint: "Email",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
        } else {}
      },
    );
  }

  CustomTextFormField mrnoTextField(bool? userFilled) {
    return CustomTextFormField(
      controller: mrnoController,
      hint: "mrNo",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
        } else {}
      },
    );
  }

  CustomTextFormField emiratesIdTextField(bool? userFilled) {
    return CustomTextFormField(
      controller: emiratesIdController,
      hint: "Emirates ID",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
        } else {}
      },
    );
  }

  CustomTextFormField dobTextField(bool? userFilled) {
    return CustomTextFormField(
      controller: dobController,
      hint: "DOB",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
        } else {}
      },
    );
  }

  CustomTextFormField phoneNumberTextField(bool? userFilled) {
    return CustomTextFormField(
      controller: phoneNumberController,
      hint: "Phone Number",
      obscureText: false,
      validator: validator,
      filled: userFilled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value?.isNotEmpty ?? false) {
        } else {}
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
              var response = await authController.signupService(
                  userNameController.text.trim(),
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  mrnoController.text.trim(),
                  emiratesIdController.text.trim(),
                  phoneNumberController.text.trim(),
                  dobController.text.trim());
              if (response == null) {
                Get.snackbar("Server Down", "Something went wrong",
                    colorText: Colors.white,
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM);
              }

              Get.snackbar("Successfully Registered", "Signup successfull",
                  colorText: Colors.white,
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM);
              Get.toNamed(RouteNames.login);
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
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(
        0, size.height - 50); // Start slightly above the bottom-left corner
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
