
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatefulWidget {
  WeatherCard({Key? key}) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
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
}
