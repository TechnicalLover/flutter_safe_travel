// import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/screens/home/components/carousel_slider.dart';
import 'package:safetravel/screens/home/search_screen.dart';
import 'package:safetravel/screens/page/model.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/tour_detail_screen.dart';
import 'package:safetravel/screens/tour/tour_screen.dart';
import 'package:safetravel/screens/home/components/categories.dart';
// import 'package:safetravel/screens/home/components/discount_banner.dart';
// import 'package:safetravel/widget/blog_card.dart';
import 'package:safetravel/widget/inspiration_card.dart';
import 'package:safetravel/widget/nearby_card.dart';
import 'package:safetravel/screens/location/tracking_location_screen.dart';
import 'package:safetravel/utilities/constants.dart';
// import 'package:intl/intl.dart';
// import 'package:safetravel/widget/weather_card.dart';

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
                //_buildHeaderCovid(),
                // WeatherCard(),
                // DiscountBanner(),
                SizedBox(
                  height: 10,
                ),
                _buildSearch(),
                // Categories(),
                _buildHeading(),
              ],
            ),
          ),
          _buildTourForYou(),
          Center(
            child: Text(
              "Tour nổi bật",
              style: shadownText,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          CarouselSliderTour(),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text("Tour phổ biến", style: shadownText),
          ),
          _buildTourPopulate(),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
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
          hintText: "Bạn muốn đi đâu?",
          hintStyle: TextStyle(
            color: kPrimaryColor.withOpacity(0.5),
            fontFamily: mainFont,
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
                    MaterialPageRoute(builder: (context) => SearchScreen())),
              )
            ],
          ),
        ),
      ),
    );
  }

  /* Widget _buildHeaderCovid() {
    return Row(
      children: <Widget>[
        Text("Hi Sang! đảm bảo bạn an toàn với covid 19 ",
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
  }*/

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
                      "Tour an toàn",
                      style: shadownText,
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TourScreen()))
                          },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: kPrimaryColor,
                      child: Text(
                        "Tất cả",
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
              image: "assets/tours/tour4.jpg",
              title: "Luxury",
              address: "Đà nẵng",
              price: 1000,
              press: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TourDetail(TourModel())))
                  }),
          NearByYouCard(
              image: "assets/tours/tour1.jpg",
              title: "Classic",
              address: "Huế",
              price: 1000,
              press: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TourDetail(TourModel())))
                  }),
          NearByYouCard(
              image: "assets/tours/tour2.jpg",
              title: "Business",
              address: "Phú Quốc",
              price: 1000,
              press: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TourDetail(TourModel())))
                  }),
          NearByYouCard(
              image: "assets/tours/tour4.jpg",
              title: "Business",
              address: "Hà Tiên",
              price: 1000,
              press: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TourDetail(TourModel())))
                  }),
          NearByYouCard(
              image: "assets/tours/tour4.jpg",
              title: "Luxury",
              address: "Đà nẵng",
              price: 1000,
              press: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TourDetail(TourModel())))
                  })
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
                  image: "assets/tours/tour1.jpg",
                  description:
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.",
                  title: "Top 10 chuyến đi nội địa nhiều nhất ",
                  press: () => {print("top10 1")},
                ),
                SizedBox(
                  height: 20.0,
                ),
                InspirationCard(
                  image: "assets/tours/tour2.jpg",
                  description:
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit,",
                  title: "Top 5 chuyến đi gần bạn ",
                  press: () => {print("top10 2")},
                ),
                SizedBox(
                  height: 20.0,
                ),
                InspirationCard(
                  image: "assets/tours/tour4.jpg",
                  description:
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit,",
                  title: "Top 5 nơi phổ biến ",
                  press: () => {print("top10 3")},
                ),
              ],
            )));
  }
}
