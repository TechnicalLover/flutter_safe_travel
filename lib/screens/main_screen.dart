import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/Experiance/Experiance_screen.dart';
import 'package:safetravel/screens/Location/map.dart';
import 'package:safetravel/screens/home/home_screen.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/confirm/salomon_bottom_bar.dart';
import 'package:safetravel/screens/tour/tour_screen.dart';
import 'package:safetravel/utilities/constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class MainScreen extends StatefulWidget {
  final int pageIndex;

  MainScreen({Key? key, this.pageIndex = 0}) : super(key: key);

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

  final ScrollController _scrollController = ScrollController();
  double _logoHeight = 60.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [boxShadow],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height: _logoHeight,
                  child: SafeArea(
                    child: Image.asset(
                      'assets/images/safe-travel.png',
                    ),
                  ),
                ),
                SalomonBottomBar(
                  currentIndex: pageIndex,
                  onTap: (i) => setState(() => pageIndex = i),
                  items: [
                    /// Home
                    SalomonBottomBarItem(
                      icon: Icon(Icons.explore),
                      title: Text("Khám phá"),
                      selectedColor: kPrimaryColor,
                    ),

                    /// Likes
                    SalomonBottomBarItem(
                      icon: Icon(Icons.favorite_border),
                      title: Text("Likes"),
                      selectedColor: kPrimaryColor,
                    ),

                    /// Search
                    SalomonBottomBarItem(
                      icon: Icon(Icons.search),
                      title: Text("Search"),
                      selectedColor: kPrimaryColor,
                    ),

                    /// Profile
                    SalomonBottomBarItem(
                      icon: Icon(Icons.person),
                      title: Text("Profile"),
                      selectedColor: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: NotificationListener(
              onNotification: (t) {
                if (t is ScrollEndNotification) {
                  if (_scrollController.position.userScrollDirection ==
                      ScrollDirection.forward) {
                    setState(() {
                      _logoHeight = 60.h;
                    });
                  }
                  if (_scrollController.position.userScrollDirection ==
                      ScrollDirection.reverse) {
                    setState(() {
                      _logoHeight = 0;
                    });
                  }
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 80,
                      color: Colors.green,
                    ),
                    Container(
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 80,
                      color: Colors.green,
                    ),
                    Container(
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 80,
                      color: Colors.green,
                    ),
                    Container(
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 80,
                      color: Colors.green,
                    ),
                    Container(
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 80,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
