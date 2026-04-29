import 'package:flutter/material.dart';

import '../generated/assets.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;

  const CustomText({
    super.key,
    required this.label,
    required this.color,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.shadows,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,

      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,

      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: TextStyle(
        shadows: shadows ?? [],
        decoration: textDecoration ?? TextDecoration.none,
        color: color,
        fontFamily: Assets.fonts.plusJakartaDisplayRegular,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
