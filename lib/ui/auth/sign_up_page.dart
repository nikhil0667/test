import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_architecture/core/locator/locator.dart';
import 'package:test_architecture/data/model/request/sign_up_request_model.dart';
import 'package:test_architecture/router/app_router.dart';
import 'package:test_architecture/ui/auth/store/auth_store.dart';
import 'package:test_architecture/util/app_image.dart';
import 'package:test_architecture/values/colors.dart';
import 'package:test_architecture/values/validator.dart';
import 'package:test_architecture/widget/custom_text.dart';
import 'package:test_architecture/widget/custom_text_form_field.dart';
import 'package:test_architecture/widget/message.dart';

import '../../widget/custom_text_button.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final authStore = locator<AuthStore>();
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> _fromKey;
  bool isChecked = false;

  @override
  void initState() {
    // fullNameController = TextEditingController();
    // emailController = TextEditingController();
    // mobileController = TextEditingController();
    // passwordController = TextEditingController();
    // confirmPasswordController = TextEditingController();
    fullNameController = TextEditingController(text: 'Jamie Wilson');
    emailController = TextEditingController(text: "jamie@example.com");
    mobileController = TextEditingController(text: "5263417898");
    passwordController = TextEditingController(text: "secret123");
    confirmPasswordController = TextEditingController(text: "secret123");
    _fromKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [_topBox(context), _signUpDesign(context)],
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
                  label: "Create Account",
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

  Widget _signUpDesign(BuildContext context) {
    return Observer(
      builder: (context) {
        if (authStore.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _fromKey,
              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
                children: [
                  CustomText(
                    label: "Full Name",
                    color: AppColor.grey,
                    fontSize: 16.sp,
                    fontWeight: .w400,
                  ),
                  CustomTextFormField(
                    maxLength: 30,
                    validator: nameValidator.call,
                    prefixIcon: AppImage.person,
                    keyboardType: TextInputType.name,
                    controller: fullNameController,
                    hintText: "Enter The Full Name",
                  ),
                  5.verticalSpace,
                  CustomText(
                    label: "Email",
                    color: AppColor.grey,
                    fontSize: 16.sp,
                    fontWeight: .w400,
                  ),
                  CustomTextFormField(
                    maxLength: 50,
                    validator: emailValidator.call,
                    prefixIcon: AppImage.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: "Enter The Email",
                  ),
                  5.verticalSpace,

                  //
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

                  5.verticalSpace,
                  CustomText(
                    label: "Confirm Password",
                    color: AppColor.grey,
                    fontSize: 16.sp,
                    fontWeight: .w400,
                  ),
                  CustomTextFormField(
                    isPassword: !authStore.isConfirmVisible,
                    maxLength: 10,
                    suffixIcon: InkWell(
                      onTap: () {
                        authStore.isConfirmVisible =
                            !authStore.isConfirmVisible;
                      },
                      child: Icon(
                        authStore.isConfirmVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                    validator: confPasswordValidator.call,
                    prefixIcon: AppImage.password,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter The Confirm Password No",
                  ),
                  20.verticalSpace,

                  Row(
                    spacing: 10,
                    children: [
                      _customCheckbox(),
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          overflow: .ellipsis,
                          text: TextSpan(
                            text: 'By continuing, you agree to the ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff49657B),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms of Service ',
                                style: TextStyle(
                                  fontWeight: .w500,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff49657B),
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: .w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  _submitBtn(),

                  Row(
                    children: [
                      CustomText(
                        label: "Already have an account? ",
                        color: Colors.grey,
                        textDecoration: .none,
                        fontSize: 20.sp,
                      ),
                      CustomTextButton(
                        textDecoration: .none,
                        label: "Login",
                        onPressed: () => context.router.replace(LoginRoute()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _submitBtn() {
    return InkWell(
      onTap: !isChecked
          ? () {
              Message.showMessage(context, "Please Check Terms and Service");
            }
          : authStore.isLoading
          ? null
          : submit,
      child: Container(
        width: double.infinity,
        alignment: .center,
        height: 60,
        decoration: BoxDecoration(
          color: !isChecked ? Colors.grey.shade300 : null,
          gradient: isChecked
              ? LinearGradient(
                  transform: GradientRotation(0.9),
                  stops: [0.2, 0.8, 1],
                  colors: [
                    Color(0xffEDD7BA),
                    Color(0xff8DBAE5),
                    Color(0xff6F77D1),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(20),
        ),

        child: CustomText(
          textAlign: .center,
          label: authStore.isLoading ? "Please Wait" : "Signup  ",
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: .w700,
        ),
      ),
    );
  }

  Widget _customCheckbox() {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(0.9),
          stops: [0.2, 0.8, 1],
          colors: [Color(0xffEDD7BA), Color(0xff8DBAE5), Color(0xff6F77D1)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: isChecked
            ? const Icon(Icons.check_rounded, color: Colors.black)
            : Padding(
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> submit() async {
    if (_fromKey.currentState!.validate()) {
      await authStore.signUp(
        SignUpRequestModel(
          email: emailController.text.trim(),
          fullName: fullNameController.text.trim(),
          phone: "+91 ${mobileController.text.trim()}",
          password: passwordController.text.trim(),
        ),
      );
      print("USER CODE = ${authStore.user}");
      print("USER MEass = ${authStore.user?.message!}");

      if (authStore.user?.code == "200") {
        context.router.push(HomeRoute());
        Message.showMessage(
          context,
          authStore.user?.message ?? "User Register Successfully",
        );
      } else {
        Message.showMessage(context, authStore.error);
      }
    }
  }
}
