import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_architecture/core/locator/locator.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';
import 'package:test_architecture/ui/home/store/home_store.dart';
import 'package:test_architecture/values/colors.dart';
import 'package:test_architecture/widget/custom_text.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = locator<HomeStore>();
  final authStore = locator<AuthStore>();

  @override
  void initState() {
    homeStore.getTasksList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body:
          // Observer(
          //   builder: (context) {
          //     if (homeStore.isLoading) {
          //       return Center(
          //         child: CircularProgressIndicator(color: Colors.white),
          //       );
          //     } else {}
          //   },
          Column(
            children: [
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 15,
                ),
                child: ListTile(
                  trailing: Container(
                    width: 55,
                    height: 100,
                    padding: .all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColor.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.email_rounded, color: Colors.white),
                  ),
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                      authStore.user?.avatar ??
                          "https://randomuser.me/api/portraits/men/32.jpg",
                    ),
                  ),
                  title: CustomText(
                    textAlign: .start,
                    label: "Welcome ${authStore.user?.name ?? ""}!",
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                  subtitle: CustomText(
                    textAlign: .start,
                    label: "Explore Tasks",
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: .w700,
                  ),
                ),
              ),
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
                      child: _loadingIndicator(50.0),
                    ),
                    CustomText(
                      textAlign: .start,
                      label: "Task\nCompleted",
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                    roundedContainer(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.calendar_month),
                          CustomText(
                            label: "Mar 22",
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: roundedContainer(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.white,
                  borderRadius: 50,
                  child: Column(
                    children: [
                      Row(
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

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
// Widget _tabBar(){
//     return
// }
  Widget _loadingIndicator(double progess) {
    return CircularPercentIndicator(
      radius: 50.0,
      lineWidth: 10.0,
      animation: true,
      percent: progess / 100,
      center: Text(
        "$progess%",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),

      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
      backgroundColor: Colors.black,
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
