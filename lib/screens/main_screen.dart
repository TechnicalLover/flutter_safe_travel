import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/screens/Experiance/Experiance_screen.dart';
import 'package:safetravel/screens/Location/map.dart';
import 'package:safetravel/screens/home/home_screen.dart';
import 'package:safetravel/screens/home/search_screen.dart';
import 'package:safetravel/screens/profile/profile_screen.dart';
import 'package:safetravel/screens/shared/drawer.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/tour_screen.dart';

import 'package:safetravel/utilities/constants.dart';

import 'tour/qr_code.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class MainScreen extends StatefulWidget {
  final int pageIndex;

  MainScreen({Key? key, this.pageIndex = 0}) : super(key: key);
  // List<Widget> pageList = <Widget>[
  //   HomeScreen(),
  // ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.pageIndex;
  }

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    TourScreen(),
    ExperienceScreen(),
    MapCovid(),
  ];
  _buildAppBar() {
    return AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title:
            Text("safetravel.com", style: TextStyle(fontFamily: fontHeading)),
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            image: DecorationImage(
                image: AssetImage("assets/logos/logo-yacht.png")),
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => {print("notification press")},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 20,
              )),
          Builder(
            builder: (context) => Container(
              child: IconButton(
                  onPressed: () => {Scaffold.of(context).openEndDrawer()},
                  icon: Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                    size: 30.0,
                  )),
            ),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        endDrawer: NavigationDrawerWidget(),
        body: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: pageList[pageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.beach_access_rounded), label: "Tour"),
            BottomNavigationBarItem(
                icon: Icon(Icons.art_track_rounded), label: "Review"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_sharp), label: "Map-Covid19"),
          ],
        ));
  }
}
