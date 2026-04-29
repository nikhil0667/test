import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.store, super.key});

  final dynamic store;

  @override
  Widget build(BuildContext context) {
    return Center(
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
          CustomButton(
            label: "Retry",
            onPressed: () {
              store.isLoading = true;
              Future.delayed(
                Duration(seconds: 1),
              ).then((value) => store.fetchUser());
            },
            width: 140.w,
            height: 46.h,
            borderRadius: 12,
          ),
        ],
      ),
    );
  }
}
