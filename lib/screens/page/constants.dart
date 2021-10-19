import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

final boxShadowImage = BoxShadow(
  color: goodGray.withOpacity(0.5),
  offset: Offset(0, 5.h),
  blurRadius: 25.r,
);

final boxShadowDetail = BoxShadow(
  color: goodGray.withOpacity(0.3),
  offset: Offset(0, 2.h),
  blurRadius: 20.r,
);

final boxShadowAvatar = BoxShadow(
  color: goodGray.withOpacity(0.8),
  offset: const Offset(-1, 1),
  blurRadius: 8.r,
);

NumberFormat numberFormat = NumberFormat.currency(locale: 'vi', symbol: '₫');
