import 'package:flutter/material.dart';

import 'package:safetravel/utilities/constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs
class InspirationCard extends StatelessWidget {
  final String image, title, description;
  final Function() press;
  const InspirationCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _indTitleTextStyle = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.w500);
    final _indSubTextStyle =
        Theme.of(context).textTheme.subtitle2?.copyWith(color: kPrimaryColor);

    return GestureDetector(
      onTap: press,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 140,
          padding: EdgeInsets.only(left: 20),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white12, boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                blurRadius: 20,
                color: kPrimaryColor.withOpacity(0.20))
          ]),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(Icons.beach_access, size: 20, color: kPrimaryColor),
                      SizedBox(height: 10),
                      Text(description, style: TextStyle(color: Colors.black87))
                    ],
                  )
                ],
              ),
              Positioned(
                right: -60,
                top: -6,
                child: Container(
                  height: 186,
                  width: 190,
                  child: CircleAvatar(
                    backgroundImage:
                        ResizeImage(AssetImage(image), width: 190, height: 186),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
