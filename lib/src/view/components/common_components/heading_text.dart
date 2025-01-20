import 'package:coherent/src/view/components/common_components/title_text.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const HeadingText({super.key, required this.text, this.fontSize, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      child: TitleText(
        title: text,
        fontSize: fontSize ?? 14,
        weight: FontWeight.w600,
        color: color ?? AppColors.black,
      ),
    );
  }
}
