import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

final goodBlack = Color(0xFF373A38);
final goodGray = Color(0xFF858C8A);
final backgroundColor = Color(0xFFB3E2E3);
final kPrimaryColor05 = Color(0xFF79CECF);
final whiteColor05 = Color(0xFFD9F1F1);
final boxShadow = BoxShadow(
  color: goodGray.withOpacity(0.2),
  offset: Offset(0, 2.h),
  blurRadius: 20.r,
);

String mainFont = 'OpenSans';
String fontHeading = "iCielBCRostrum";

/*
final h1fs = 43.95.sp;
final h2fs = 35.16.sp;
final h3fs = 28.13.sp;
final h4fs = 22.50.sp;
final h5fs = 18.00.sp;
final h6fs = 14.40.sp;
*/

final h1fs = 46.39.sp;
final h2fs = 37.11.sp;
final h3fs = 29.69.sp;
final h4fs = 23.75.sp;
final h5fs = 19.00.sp;
final h6fs = 15.20.sp;

final baseFont = TextStyle(
  color: goodBlack,
  fontSize: h3fs,
  fontFamily: mainFont,
);

final h1b = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);

final h2b = baseFont.copyWith(
  fontSize: h2fs,
  fontWeight: FontWeight.bold,
);

final h3b = baseFont.copyWith(
  fontSize: h3fs,
  fontWeight: FontWeight.bold,
);
final h4b = baseFont.copyWith(
  fontSize: h4fs,
  fontWeight: FontWeight.bold,
);

final h5b = baseFont.copyWith(
  fontSize: h5fs,
  fontWeight: FontWeight.bold,
);

final h1 = baseFont.copyWith(
  fontSize: h1fs,
);

final h2 = baseFont.copyWith(
  fontSize: h2fs,
);

final h3 = baseFont.copyWith(
  fontSize: h3fs,
);
final h4 = baseFont.copyWith(
  fontSize: h4fs,
);

final h5 = baseFont.copyWith(
  fontSize: h5fs,
);

final h3ita = h3.copyWith(
  fontStyle: FontStyle.italic,
);

final formStyle = h3;
