import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_architecture/core/locator/locator.dart';
import 'package:test_architecture/data/model/response/calender_model.dart';
import 'package:test_architecture/router/app_router.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';
import 'package:test_architecture/ui/home/store/home_store.dart';
import 'package:test_architecture/util/app_image.dart';
import 'package:test_architecture/values/colors.dart';
import 'package:test_architecture/values/extensions/string_ext.dart';
import 'package:test_architecture/widget/custom_text.dart';

import '../../widget/custom_error_widget.dart';
import '../../widget/custom_tab_bar.dart';
import '../../widget/profile_section.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = locator<HomeStore>();
  final authStore = locator<AuthStore>();
  DateTime? selectedDate;
  int index = 0;
  List<CalenderModel> monthDays = [];

  @override
  void initState() {
    homeStore.getTasksList(homeStore.isLeft ? "left" : "done");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: floatingActioRoundBig(),
      bottomNavigationBar: bottomNavigationBar(),
      backgroundColor: AppColor.black,
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              40.verticalSpace,

              ProfileSection(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1D1D1D),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: _loadingIndicator(50),
                    ),
                    CustomText(
                      textAlign: .start,
                      label: "Task\nCompleted",
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                    InkWell(
                      onTap: () {
                        _openCalender(context);
                      },
                      child: roundedContainer(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.calendar_month),

                            CustomText(
                              label: DateFormat(
                                "MMM dd",
                              ).format(selectedDate ?? DateTime.now()),
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: roundedContainer(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  radius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                label: "Your Tasks",
                                color: Colors.black,
                                fontSize: 30.sp,
                                fontWeight: .w500,
                              ),
                              CustomText(
                                label: "(7/10) Completed",
                                color: Colors.grey,
                                fontSize: 15.sp,
                              ),
                            ],
                          ),

                          CustomTabBar(),
                        ],
                      ),
                      _listTask(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _openCalender(BuildContext context) async {
    selectedDate = (await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ))!;
    homeStore.getSelectedTasksList(selectedDate!);
  }

  Widget _listTask() {
    if (homeStore.error.isNotEmpty) {
      return CustomErrorWidget(store: homeStore);
    }

    if (homeStore.isLoading) {
      return Expanded(
        child: Center(child: CircularProgressIndicator(color: Colors.red)),
      );
    }

    if (homeStore.selectedTask!.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: homeStore.selectedTask?.length,
        itemBuilder: (context, index) {
          var task = homeStore.selectedTask?[index];
          Color barColor = Colors.blue;

          if (task?.status == "in_progress") {
            barColor = Color(0xffFFC83F);
          } else if (task?.status == "over_due") {
            barColor = Color(0xffFF6B6B);
          } else if (task?.status == "completed") {
            barColor = Color(0xff76EF83);
          }

          return ListTile(
            leading: _loadingIndicator(
              task!.progress!,
              lineColor: Colors.white,
              lineWidth: 5,
              radius: 25,
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: .w400,
              status: task.status,
            ),
            title: CustomText(
              textAlign: .start,
              label: task.title!,
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: .bold,
            ),
            subtitle: Row(
              spacing: 10,
              children: [
                Icon(Icons.circle, color: barColor, size: 14),
                Expanded(
                  child: CustomText(
                    maxLines: 1,
                    label:
                    "${task.status!.replaceAll("_", " ").toPascalCase()}",
                    color: barColor,
                    fontSize: 16.sp,
                  ),
                ),
                Expanded(
                  child: CustomText(
                    maxLines: 1,

                    label: DateFormat("MMM dd, yyyy").format(task.dueDate!),
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            trailing: SizedBox(
              width: 100,
              child: Stack(
                children: List.generate(growable: true, task.team!.length, (
                    index,
                    ) {
                  return Positioned(
                    left: index * 20,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 40,
                      height: 40,
                      clipBehavior: .hardEdge,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: .circular(100),
                        child: Image.network(
                          task.team![index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      );
    }

    return Center(
      child: CustomText(
        label: "No Found Tasks",
        color: AppColor.grey,
        fontSize: 15.sp,
      ),
    );
  }

  Widget _loadingIndicator(
      int progress, {
        double? radius,
        FontWeight? fontWeight,
        double? lineWidth,
        double? fontSize,
        Color? lineColor,
        Color? color,
        String? status,
      }) {
    Color barColor = Colors.blue;

    if (status == "in_progress") {
      barColor = Color(0xffFFC83F);
    } else if (status == "over_due") {
      barColor = Color(0xffFF6B6B);
    } else if (status == "completed") {
      barColor = Color(0xff76EF83);
    } else {
      barColor = Colors.blue;
    }
    return CircularPercentIndicator(
      radius: radius ?? 50.0,
      lineWidth: lineWidth ?? 10.0,
      animation: true,
      percent: progress / 100,
      center: Text(
        "$progress%",
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 20.0,
          color: color ?? Colors.white,
        ),
      ),

      circularStrokeCap: CircularStrokeCap.round,
      progressColor: barColor,
      backgroundColor: lineColor ?? Colors.black,
    );
  }

  Widget roundedContainer({
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Widget? child,
    Color? color,
    BorderRadius? radius,
    double? borderRadius,
  }) {
    return Container(
      width: width,
      padding: padding,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,

        borderRadius: radius ?? BorderRadius.circular(borderRadius ?? 100),
      ),

      child: child,
    );
  }

  Widget bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      notchMargin: 0,
      child: Row(
        children: [
          bottomNavigationBarItem(icon: AppImage.home, index: 0),
          bottomNavigationBarItem(icon: AppImage.graph, index: 1),
          bottomNavigationBarItem(
            icon: AppImage.graph,
            index: -1,
            color: Colors.transparent,
          ),
          bottomNavigationBarItem(icon: AppImage.notification, index: 2),
          bottomNavigationBarItem(icon: AppImage.setting, index: 3),
        ],
      ),
    );
  }

  Widget bottomNavigationBarItem({
    required String icon,
    required int index,
    Color? color,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: index == 2
            ? () {}
            : () {
          context.router.push(ChatRoute());
        },
        child: Container(
          color: Colors.transparent,
          child: Image.asset(
            icon,
            width: index == -1 ? 0 : 30,
            height: index == -1 ? 0 : 30,
          ),
        ),
      ),
    );
  }

  Widget floatingActioRoundBig() {
    return GestureDetector(
      onTap: () => debugPrint("Click"),
      child: Container(
        padding: const EdgeInsetsGeometry.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(50),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImage.backgroundImage),
          ),
        ),

        child: const Icon(Icons.add, size: 40, color: Colors.black),
      ),
    );
  }
}
