import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_architecture/core/locator/locator.dart';
import 'package:test_architecture/data/model/request/login_request_model.dart';
import 'package:test_architecture/router/app_router.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';
import 'package:test_architecture/util/app_image.dart';
import 'package:test_architecture/values/colors.dart';
import 'package:test_architecture/values/validator.dart';
import 'package:test_architecture/widget/custom_text.dart';
import 'package:test_architecture/widget/custom_text_form_field.dart';
import 'package:test_architecture/widget/message.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authStore = locator<AuthStore>();
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> _fromKey;

  @override
  void initState() {
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    _fromKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (locator<AuthStore>().user != null) {
      context.router.push(HomeRoute());
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [_topBox(context), _loginDesign(context)],
        ),
      ),
    );
  }

  Widget _topBox(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(0.9),
          colors: [Color(0xffEDD7BA), Color(0xff8DBAE5), Color(0xff6F77D1)],
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            InkWell(
              onTap: () => context.router.pop(),
              child: Icon(Icons.arrow_back, size: 30, color: Colors.black),
            ),
            10.verticalSpace,
            Row(
              crossAxisAlignment: .start,
              spacing: 20,
              children: [
                SizedBox(
                  height: 60,
                  width: 7,
                  child: ColoredBox(color: Colors.black),
                ),
                CustomText(
                  textAlign: .start,
                  label: "Hello !",
                  fontWeight: .w600,
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginDesign(BuildContext context) {
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _fromKey,
          child: Column(
            spacing: 10,
            crossAxisAlignment: .start,
            children: [
              CustomText(
                label: "Mobile",
                color: AppColor.grey,
                fontSize: 16.sp,
                fontWeight: .w400,
              ),
              CustomTextFormField(
                maxLength: 10,
                validator: mobileValidator.call,
                prefixIcon: AppImage.phone,
                keyboardType: TextInputType.phone,
                controller: mobileController,
                hintText: "Enter The Phone No",
              ),
              5.verticalSpace,
              CustomText(
                label: "Password",
                color: AppColor.grey,
                fontSize: 16.sp,
                fontWeight: .w400,
              ),
              CustomTextFormField(
                isPassword: !authStore.isVisible,
                maxLength: 10,
                suffixIcon: InkWell(
                  onTap: () {
                    authStore.isVisible = !authStore.isVisible;
                  },
                  child: Icon(
                    authStore.isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                validator: passwordValidator.call,
                prefixIcon: AppImage.password,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Enter The Password No",
              ),
              30.verticalSpace,
              InkWell(
                onTap: authStore.isLoading ? null : submit,
                child: Container(
                  width: double.infinity,
                  alignment: .center,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      transform: GradientRotation(0.9),
                      stops: [0.2, 0.8, 1],
                      colors: [
                        Color(0xffEDD7BA),
                        Color(0xff8DBAE5),
                        Color(0xff6F77D1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomText(
                    textAlign: .center,
                    label: authStore.isLoading ? "Please Wait" : "Login",
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: .w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }





  Future<void> submit() async {
    print("Im Call");
    if (_fromKey.currentState!.validate()) {
      bool? success = await authStore.login(
        LoginRequestModel(
          phone: "+91 ${mobileController.text.trim()}",
          password: passwordController.text.trim(),
        ),
      );
      print("Daya $success");
      if (success!) {
        context.router.push(HomeRoute());
        Message.showMessage(context, "Login Successfully");
      } else {
        Message.showMessage(context, authStore.error);
      }
    }
  }
}
