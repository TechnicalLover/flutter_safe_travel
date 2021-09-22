import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/widget/nearby_card.dart';
import 'package:safetravel/screens/location/tracking_location_screen.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:intl/intl.dart';
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
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
            child: Column(
              children: <Widget>[
                _buildHeaderCovid(),
                _buildWeather(),
                _buildHeading(),
              ],
            ),
          ),
          _buildTourForYou()
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

  Widget _buildWeather() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment(0.0, 1.0),
          child: SizedBox(
            height: 200,
            width: 10,
            child: OverflowBox(
              minWidth: 0.0,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: 0.0,
              maxHeight: (MediaQuery.of(context).size.height / 4),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: double.infinity,
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding:
                                EdgeInsets.only(top: 15, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Hồ Chí Minh City",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    DateFormat()
                                        .add_MMMMEEEEd()
                                        .format(DateTime.now()),
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 50),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Nhiều mây",
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "29\u2103",
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.black45),
                                    ),
                                    Text(
                                      "min: 27\u2103/max: 32\u2103 ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 120,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/weather-icon.jpg"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        'wind 0.98m/s',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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
                      "TOUR FOR YOU",
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
