import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:safetravel/widget/blog_card.dart';
import 'package:safetravel/widget/search_bar.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class ExperienceScreen extends StatefulWidget {
  ExperienceScreen({Key? key}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  Widget _BuildAddBlogBar() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kAddBlogDecorationStyle,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, double.maxFinite),
                primary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ), // double.infinity is the width and 30 is the height
              ),
              child: Text(
                "Add your new experience",
                style: TextStyle(color: kPrimaryColor),
              )))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SearchBar(),
          _BuildAddBlogBar(),
          SizedBox(height: 15),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlogCard(),SizedBox(height: 5),
                BlogCard(),SizedBox(height: 5),
                BlogCard(),SizedBox(height: 5),
                BlogCard(),SizedBox(height: 5),
                BlogCard(),SizedBox(height: 5),
                BlogCard(),SizedBox(height: 5),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
