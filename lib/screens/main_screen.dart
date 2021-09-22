import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/screens/Experiance/Experiance_screen.dart';
import 'package:safetravel/screens/home/home_screen.dart';
import 'package:safetravel/screens/profile/profile_screen.dart';
import 'package:safetravel/screens/shared/drawer.dart';
import 'package:safetravel/screens/tour/tour_screen.dart';

import 'package:safetravel/utilities/constants.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class MainScreen extends StatefulWidget {
  int pageIndex = 0;

  MainScreen({Key? key}) : super(key: key);
  // List<Widget> pageList = <Widget>[
  //   HomeScreen(),
  // ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    ExperienceScreen(),
    TourScreen(),
    ProfileScreen()
  ];
  _buildAppBar() {
    return AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title:
            Text("safetravel.com", style: GoogleFonts.allura(letterSpacing: 2)),
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
                icon: Icon(Icons.art_track_rounded), label: "Experience"),
            BottomNavigationBarItem(
                icon: Icon(Icons.beach_access_rounded), label: "Tour"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_sharp), label: "Account")
          ],
        ));
  }
}
