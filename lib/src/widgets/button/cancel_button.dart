import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme/themes.dart';


class CancelButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double? height;
  final double? fontSize;

  const CancelButton(
      this.title, {super.key,
        required this.onPressed,
        this.height,
        this.fontSize,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 15.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: appBlanc,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.w),
            side: BorderSide(color: appColor),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 12.sp,
            color: appColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}