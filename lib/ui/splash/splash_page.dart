import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_architecture/router/app_router.dart';
import 'package:test_architecture/util/app_image.dart';
import 'package:test_architecture/values/colors.dart';
import 'package:test_architecture/widget/custom_text.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.black, body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Stack(
          children: [
            Positioned(
              top: -109,
              left: 20,
              child: shape(
                width: 150.w,
                height: 328.h,
                color: AppColor.screenTone,
              ),
            ),
            Positioned(
              top: 80,
              left: 40,
              child: shape(width: 110.w, height: 110.h, color: AppColor.black),
            ),
          ],
        ),
        Positioned(
          top: 50,
          right: -80,
          child: shape(
            height: 150.h,
            width: 328.w,
            child: Image.asset(AppImage.backgroundImage, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 250,
          left: -100,
          child: shape(
            height: 157.h,
            width: 438.w,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(AppImage.leftGradient, fit: BoxFit.fill),
            ),
          ),
        ),
        Positioned(
          top: 440,
          right: -100,
          child: shape(
            height: 157.h,
            width: 438.w,

            child: Image.asset(AppImage.rightGradient, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 30,
          child: SizedBox(
            width: 300,
            child: CustomText(
              textAlign: .left,
              label: "Create Your Tasks And Manage Your Work ",
              color: Colors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 30,
          child: SizedBox(
            width: 380,
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    spacing: 10,
                    children: [
                      dot(width: 8, height: 8, color: Colors.grey.shade700),
                      dot(width: 8, height: 8, color: Colors.grey.shade700),
                      dot(width: 20, height: 8, color: Colors.grey.shade100),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 108,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundBuilder: (context, states, child) {
                        return Image.asset(
                          AppImage.signInButton,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                    onPressed: () {
                      context.router.push(LoginRoute());
                    },
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget shape({
    required double width,
    required double height,
    Widget? child,
    Color? color,
  }) {
    return

      Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(100),
      ),

      child: child,
    );
  }

  Widget dot({
    required double width,
    required double height,
    Widget? child,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(100),
      ),

      child: child,
    );
  }
}
