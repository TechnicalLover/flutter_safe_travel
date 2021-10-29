import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

Widget buildPrimaryButton2(String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: h3b.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.r),
      ),
    ),
  );
}

Widget buildSecondaryButton2(String text, VoidCallback onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Text(
        text,
        style: h3.copyWith(
          color: kPrimaryColor,
        ),
      ),
    ),
    style: ElevatedButton.styleFrom(
      side: const BorderSide(width: 2.0, color: kPrimaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
}
