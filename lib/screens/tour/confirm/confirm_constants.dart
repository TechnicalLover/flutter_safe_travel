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

final h1 = TextStyle(
  color: goodBlack,
  fontSize: 24,
  fontFamily: mainFont,
  fontWeight: FontWeight.bold,
);

final h2 = TextStyle(
  color: goodBlack,
  fontSize: 19.20,
  fontFamily: mainFont,
  fontWeight: FontWeight.bold,
);

final h3 = TextStyle(
  color: goodBlack,
  fontSize: 15.36,
  fontFamily: mainFont,
  fontWeight: FontWeight.bold,
);

final h4 = TextStyle(
  color: goodBlack,
  fontSize: 12.29,
  fontFamily: mainFont,
  fontWeight: FontWeight.bold,
);

final h1nor = TextStyle(
  color: goodBlack,
  fontSize: 24,
  fontFamily: mainFont,
);

final h2nor = TextStyle(
  color: goodBlack,
  fontSize: 19.20,
  fontFamily: mainFont,
);

final h3nor = TextStyle(
  color: goodBlack,
  fontSize: 15.36,
  fontFamily: mainFont,
);

final h4nor = TextStyle(
  color: goodBlack,
  fontSize: 12.29,
  fontFamily: mainFont,
);

final h3ita = TextStyle(
  color: goodBlack,
  fontSize: 15.36,
  fontFamily: mainFont,
  fontStyle: FontStyle.italic,
);

final formStyle = h3nor;
