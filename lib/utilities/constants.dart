import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

const kTextColor = Color(0xFF3C4046);
const kPrimaryColor = Color(0xFF1DADB0);
const kSecondaryColor = Color(0xFF1DADB0);
const double kDefaultPadding = 20.0;
final kHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);
final kTextStyleHeading = TextStyle(
    color: Colors.black54,
    fontSize: 15.0,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kTextPrice = TextStyle(
    color: kPrimaryColor.withOpacity(0.5), fontWeight: FontWeight.bold);
final shadownText = TextStyle(
    fontFamily: fontHeading,
    color: goodBlack,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(-3, 3),
        color: goodBlack.withOpacity(0.5),
        blurRadius: 10,
      )
    ],
    fontSize: 25);
final hoverColor = Colors.white70;
final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white.withOpacity(0.6),
  borderRadius: BorderRadius.circular(10.r),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.r,
      offset: Offset(0, 2),
    ),
  ],
);

final kSearchBarDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  boxShadow: [
    BoxShadow(
      color: kPrimaryColor,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kAddBlogDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
  boxShadow: [
    BoxShadow(
      color: kPrimaryColor,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
