import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import 'custom_text.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.store, super.key});

  final dynamic store;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              label: store.error,
              color: AppColor.blueDark,
              fontSize: 16.spMin,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
