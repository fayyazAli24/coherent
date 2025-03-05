import 'dart:io';

import 'package:coherent/src/view/components/common_components/title_text.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final backgroundColor;
  var backbutton;
  CustomAppBar({
    required this.text,
    this.backgroundColor,
    this.backbutton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backbutton ?? false,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white, // Change back button color here
      ),
      title: TitleText(
        title: text,
        fontSize: 18,
        weight: FontWeight.w500,
        color: AppColors.white,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    "Are you sure you want to logout?",
                    style: TextStyle(fontSize: 16),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add logout functionality here
                        Navigator.of(context).pop();
                        exit(0);
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40);
}
