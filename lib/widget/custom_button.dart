
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.img,
    this.width,
    this.height,
    this.color,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final String? img;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          backgroundColor: color ?? AppColor.blueDark,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            img != null ? Image.asset(img!) : 0.verticalSpace,
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.spMin,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
