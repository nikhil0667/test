import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/locator/locator.dart';
import '../ui/home/store/home_store.dart';
import 'custom_text.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {

  final homeStore = locator<HomeStore>();
  @override
  Widget build(BuildContext context) {

    double height = 60;
    double width = 180;
    return roundedContainer(
      width: width,
      height: height,
      color: Colors.black,
      child: Row(
        children: [
          InkWell(
            onTap: () => setState(() {
              homeStore.getTasksList();
              homeStore.isLeft = !homeStore.isLeft;
            }),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Center(
                child: roundedContainer(
                  width: (width / 2) - 10,

                  height: height - 10,
                  color: homeStore.isLeft ? Colors.black : Colors.white,
                  child: Center(
                    child: CustomText(
                      label: "Left",
                      color: !homeStore.isLeft ? Colors.black : Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => setState(() {
              homeStore.getTasksList(name: "done");
              homeStore.isLeft = !homeStore.isLeft;
            }),
            child: Center(
              child: roundedContainer(
                width: (width / 2) - 10,

                height: height - 10,
                color: !homeStore.isLeft ? Colors.black : Colors.white,
                child: Center(
                  child: CustomText(
                    label: "Done",
                    color: homeStore.isLeft ? Colors.black : Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget roundedContainer({
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Widget? child,
    Color? color,
    double? borderRadius,
  }) {
    return Container(
      width: width,
      padding: padding,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(borderRadius ?? 100),
      ),

      child: child,
    );
  }
}
