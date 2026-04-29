import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.color,
    this.textDecoration,
  });

  final String label;
  final VoidCallback onPressed;
  final TextDecoration? textDecoration;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        label: label,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w600,
        textDecoration: textDecoration ?? TextDecoration.underline,
        fontSize: 18.spMin,
      ),
    );
  }
}
