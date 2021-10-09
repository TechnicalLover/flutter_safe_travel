import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    fontFamily: GoogleFonts.allura().fontFamily,
    color: kPrimaryColor,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(5, 5),
        color: kPrimaryColor,
        blurRadius: 10,
      )
    ],
    fontSize: 30);
final hoverColor = Colors.white70;
final kBoxDecorationStyle = BoxDecoration(
  color: Color.fromRGBO(158, 217, 232, 0.1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
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
