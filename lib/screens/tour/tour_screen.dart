import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/screens/home/search_screen.dart';
import 'package:safetravel/widget/inspiration_card.dart';
import 'package:safetravel/widget/list_tour_card.dart';
import 'package:safetravel/widget/nearby_card.dart';
import 'package:safetravel/screens/location/tracking_location_screen.dart';

import 'package:safetravel/utilities/constants.dart';

import 'tour_detail_screen.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class TourScreen extends StatefulWidget {
  TourScreen({Key? key}) : super(key: key);
  @override
  _TourScreenState createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  Widget _buildHeaderSearchBox() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: <Widget>[
            //     Text("Hi Sang! Make sure you are safe covid 19 ",
            //         style: Theme.of(context).textTheme.subtitle2?.copyWith(
            //             color: Colors.black45, fontWeight: FontWeight.bold)),
            //     Spacer(),
            //     IconButton(
            //       onPressed: () => {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => TrackingLocationScreen()))
            //       },
            //       icon: Icon(Icons.add_moderator),
            //       color: kPrimaryColor,
            //     )
            //   ],
            // ),
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
                  hintText: "Country, City, Tourist Place...",
                  hintStyle: TextStyle(
                    color: kPrimaryColor.withOpacity(0.5),
                    fontFamily: GoogleFonts.allura().fontFamily,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.search,
                        color: kPrimaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.filter_alt_rounded),
                        color: kPrimaryColor,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SearchScreen())),
                      )
                    ],
                  ),
                ),
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
            height: 30,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding / 4),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "List Tour For You ", style: shadownText),
                        WidgetSpan(
                          child: Icon(
                            Icons.person_pin_circle_outlined,
                            size: 30,
                            color: kPrimaryColor,
                          ),
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
        // Spacer(),
        // Container(
        //   margin: EdgeInsets.only(right: kDefaultPadding),
        //   child: RaisedButton(
        //       onPressed: () => {},
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20)),
        //       color: kPrimaryColor,
        //       child: Text(
        //         "More",
        //         style: TextStyle(color: Colors.white),
        //       )),
        // )
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
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Wrap(children: [
            ListTourCard(
                image: "assets/tours/tour1.jpg",
                title: "Classic",
                address: "Huế",
                price: 5000000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour2.jpg",
                title: "Business",
                address: "Phú Quốc",
                price: 998000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour4.jpg",
                title: "Business",
                address: "Hà Tiên",
                price: 800000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour1.jpg",
                title: "Luxury",
                address: "Đà nẵng",
                price: 1890000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour1.jpg",
                title: "Luxury",
                address: "Hội an",
                price: 189000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour4.jpg",
                title: "Luxury",
                address: "Đà nẵng",
                price: 1900000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour4.jpg",
                title: "Luxury",
                address: "Vũng Tàu",
                price: 1900000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    }),
            ListTourCard(
                image: "assets/tours/tour4.jpg",
                title: "Luxury",
                address: "Ninh Bình",
                price: 189760000,
                press: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TourDetail()))
                    })
          ]),
        ],
      ),
    );
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
          // _buildHeadingPopulate(),
          // _buildTourPopulate()
        ],
      ),
    );
  }
}
