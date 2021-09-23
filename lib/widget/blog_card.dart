import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:safetravel/utilities/constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs
class BlogCard extends StatefulWidget {
  BlogCard({Key? key}) : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage:
                          AssetImage("assets/images/avatar-blog.jpg"),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("dtsangdtd, ",
                        style: TextStyle(fontWeight: FontWeight.w400)),
                    Text(
                      "15 July 2021",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(" 3.4K Views",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(
                          '106 Likes',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/blog.jpg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'T',
                    style: GoogleFonts.notoSerif(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text:
                        "ravel blogs nowadays are starting to look all the same, with generic off-the-shelf templates, difficult navigation, way too many unnecessary pop-ups and don't get me started on scroll hijacking (why do people do this?).",
                    style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 12,
                        height: 1.5,
                        wordSpacing: 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
