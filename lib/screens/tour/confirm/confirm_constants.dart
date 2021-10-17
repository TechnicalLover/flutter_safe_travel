import 'package:flutter/material.dart';
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
  color: goodGray.withOpacity(0.30),
  offset: const Offset(0, 10),
  blurRadius: 50,
);

String mainFont = 'OpenSans';
String fontHeading = "iCielBCRostrum";

const h1fs = 28.13;
const h2fs = 22.50;
const h3fs = 18.00;
const h4fs = 14.40;
const h5fs = 11.52;

final baseFont = TextStyle(
  color: goodBlack,
  fontSize: 15.36,
  fontFamily: mainFont,
);

final h1b = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);

final h2b = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);

final h3b = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);
final h4b = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);

final h5b = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);

final h1 = baseFont.copyWith(
  fontSize: h1fs,
  fontWeight: FontWeight.bold,
);

final h2 = baseFont.copyWith(
  fontSize: h1fs,
);

final h3 = baseFont.copyWith(
  fontSize: h1fs,
);
final h4 = baseFont.copyWith(
  fontSize: h1fs,
);

final h5 = baseFont.copyWith(
  fontSize: h1fs,
);

final h3ita = h3.copyWith(
  fontStyle: FontStyle.italic,
);

final formStyle = h3;
