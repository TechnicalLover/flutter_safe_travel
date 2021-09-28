import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/widget/blog_card.dart';
import 'package:safetravel/widget/nearby_card.dart';
import 'package:safetravel/screens/location/tracking_location_screen.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:intl/intl.dart';
import 'package:safetravel/widget/weather_card.dart';
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
            child: Column(
              children: <Widget>[
                _buildHeaderCovid(),
                // WeatherCard(),
                _buildHeading(),
              ],
            ),
          ),
          _buildTourForYou(),
          Center(
            child: Text(
              "Travel Blog To You",
              style: TextStyle(
                  fontFamily: GoogleFonts.allura().fontFamily,
                  color: kPrimaryColor,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(5, 5),
                      color: kPrimaryColor,
                      blurRadius: 10,
                    )
                  ],
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          BlogCard(),
        ],
      ),
    );
  }

  Widget _buildHeaderCovid() {
    return Row(
      children: <Widget>[
        Text("Hi Sang! Make sure you are safe covid 19 ",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.black45, fontWeight: FontWeight.bold)),
        Spacer(),
        IconButton(
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TrackingLocationScreen()))
          },
          icon: Icon(Icons.add_moderator),
          color: kPrimaryColor,
        )
      ],
    );
  }

  Widget _buildHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: Text(
                      "recommended to you".toUpperCase(),
                      style: kTextStyleHeading,
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                      onPressed: () => {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: kPrimaryColor,
                      child: Text(
                        "More",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTourForYou() {
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
}
