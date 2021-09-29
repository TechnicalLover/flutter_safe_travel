import 'package:flutter/material.dart';
import 'package:safetravel/utilities/constants.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:safetravel/widget/blog_card.dart';
import 'package:safetravel/widget/search_bar.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY POSTS"),
        backgroundColor: kPrimaryColor,
      ),
      body: (Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BlogCard(),
                  SizedBox(height: 5),
                  BlogCard(),
                  SizedBox(height: 5),
                  BlogCard(),
                  SizedBox(height: 5),
                  BlogCard(),
                  SizedBox(height: 5),
                  BlogCard(),
                  SizedBox(height: 5),
                  BlogCard(),
                  SizedBox(height: 5),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
