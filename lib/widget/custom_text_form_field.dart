import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../values/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isPassword;

  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<String>? autofillHints;
  final Color? hintColor;
  final String? prefixIcon;
  final int? maxLines;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,

    required this.hintText,
    this.isPassword = false,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.hintColor,
    this.maxLength,
    this.validator,
    this.keyboardType,
    this.autofillHints,
    this.maxLines,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofillHints: autofillHints,
      obscureText: isPassword,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      maxLength: maxLength,
      style: TextStyle(color: AppColor.black),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: TextStyle(color: hintColor ?? Colors.grey),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsetsGeometry.only(left: 8.0),
                child: SizedBox(
                  width: 30,
                  child: Row(
                    spacing: 10,
                    children: [
                      Image.asset(prefixIcon!, width: 25, height: 25),
                      SizedBox(
                        height: 30,
                        width: 1,
                        child: ColoredBox(color: Color(0xff9A9CAD)),
                      ),
                    ],
                  ),
                ),
              ),
        suffixIcon: Padding(
          padding: EdgeInsetsGeometry.only(right: 8.0),
          child: suffixIcon,
        ),
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        counterText: "",
        filled: true,
        fillColor: Color(0xffE4E5E8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(maxLines == null ? 10 : 20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
