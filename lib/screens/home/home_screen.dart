import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/component/inspiration_card.dart';
import 'package:safetravel/component/nearby_card.dart';

import 'package:safetravel/utilities/constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildHeaderSearchBox() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Text("Hi Sang! Make sure you are safe covid 19 ",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.black45, fontWeight: FontWeight.bold)),
                Spacer(),
                IconButton(
                  onPressed: () => {print("icon button press")},
                  icon: Icon(Icons.add_moderator),
                  color: kPrimaryColor,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: kPrimaryColor.withOpacity(0.23))
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search for your Yacht...",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                      fontFamily: GoogleFonts.allura().fontFamily,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    )),
              ),
            )
          ],
        ));
  }

  Widget _buildNearByYou() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Container(
            height: 24,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding / 4),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Near by ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        WidgetSpan(
                          child:
                              Icon(Icons.person_pin_circle_outlined, size: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: kDefaultPadding / 5),
                    height: 8.0,
                    color: kPrimaryColor.withOpacity(0.2),
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: kDefaultPadding),
          child: RaisedButton(
              onPressed: () => {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: kPrimaryColor,
              child: Text(
                "More",
                style: TextStyle(color: Colors.white),
              )),
        )
      ],
    );
  }

  Widget _buildHeadingPopulate() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Container(
            height: 20,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Tour Populate",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(right: kDefaultPadding / 5),
                    height: 8.0,
                    color: kPrimaryColor.withOpacity(0.2),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNearByCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NearByYouCard(
              image: "assets/yachts/yacht1.jpg",
              title: "Classic",
              address: "Hòn Tiên",
              price: 1000,
              press: () => {print("Hon Tien")}),
          NearByYouCard(
              image: "assets/yachts/yacht2.jpg",
              title: "Business",
              address: "Phú Quốc",
              price: 1000,
              press: () => {print("Hon Ba")}),
          NearByYouCard(
              image: "assets/yachts/yacht3.jpg",
              title: "Business",
              address: "Hà Tiên",
              price: 1000,
              press: () => {print("Phu Quoc")}),
          NearByYouCard(
              image: "assets/yachts/yacht4.jpg",
              title: "Luxury",
              address: "Resort Vin",
              price: 1000,
              press: () => {print("Test")})
        ],
      ),
    );
  }

  Widget _buildTourPopulate() {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 12, bottom: 30),
              children: [
                InspirationCard(
                  image: "assets/yachts/yacht1.jpg",
                  description:
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.",
                  title: "Top 10 Yacht Luxury ",
                  press: () => {print("top10 1")},
                ),
                SizedBox(
                  height: 20.0,
                ),
                InspirationCard(
                  image: "assets/yachts/yacht2.jpg",
                  description:
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit,",
                  title: "Top 5 Yacht Rent a lot ",
                  press: () => {print("top10 2")},
                ),
                SizedBox(
                  height: 20.0,
                ),
                InspirationCard(
                  image: "assets/yachts/yacht3.jpg",
                  description:
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit,",
                  title: "Top 5 Popular place ",
                  press: () => {print("top10 3")},
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          _buildHeaderSearchBox(),
          _buildNearByYou(),
          _buildNearByCard(),
          _buildHeadingPopulate(),
          _buildTourPopulate()
        ],
      ),
    );
  }
}
