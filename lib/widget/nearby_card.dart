import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class NearByYouCard extends StatefulWidget {
  final String image, title, address;
  final double price;
  final Function() press;
  const NearByYouCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.address,
      required this.price,
      required this.press})
      : super(key: key);

  @override
  State<NearByYouCard> createState() => _NearByYouCardState();
}

class _NearByYouCardState extends State<NearByYouCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _ratingValue;

    return Container(
      margin: EdgeInsets.all(10.0),
      width: size.width * 0.9,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: widget.press,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(widget.image),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: _buildIcon(context),
                ),
              )
            ],
          ),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: widget.press,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 5.0,
                        color: kPrimaryColor.withOpacity(0.20))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "${widget.title}\n".toUpperCase(),
                          style: TextStyle(
                              fontFamily: fontHeading,
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: "${widget.address}".toUpperCase(),
                            style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5))),
                        WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.location_pin,
                            color: kPrimaryColor,
                          ),
                        ))
                      ]),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingBar(
                              itemSize: 20,
                              initialRating: 4.5,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                  full: Icon(Icons.star, color: Colors.orange),
                                  half: Icon(
                                    Icons.star_half,
                                    color: Colors.orange,
                                  ),
                                  empty: Icon(
                                    Icons.star_outline,
                                    color: Colors.orange,
                                  )),
                              onRatingUpdate: (value) {}),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("2 000 000 VND",
                                  style: TextStyle(
                                      fontSize: 19,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "1 325 000 VND",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isPress = true;
  Widget _buildIcon(BuildContext context) {
    return IconButton(
      icon: Icon(
        isPress ? Icons.favorite_border_outlined : Icons.favorite_sharp,
        color: Colors.pink.shade400,
        size: 30,
      ),
      onPressed: () {
        setState(() {
          isPress = !isPress;
        });
      },
    );
  }
}
