import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:safetravel/utilities/constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class ListTourCard extends StatefulWidget {
  final String image, title, address;
  final double price;
  final Function() press;
  const ListTourCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.address,
      required this.price,
      required this.press})
      : super(key: key);

  @override
  State<ListTourCard> createState() => _ListTourCardState();
}

class _ListTourCardState extends State<ListTourCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _ratingValue;

    return Container(
      margin: EdgeInsets.all(8),
      width: size.width * 0.45,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: widget.press,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(widget.image),
                  )),
            ],
          ),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: widget.press,
            child: Container(
              width: size.width * 0.45,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 5.0,
                        color: kPrimaryColor.withOpacity(0.20))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 5),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "${widget.title}\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                            text: "${widget.price} VND".toUpperCase(),
                            style: kTextPrice),
                      ]),
                    ),
                    Spacer(),
                    Text("${widget.address}".toUpperCase(),
                        style:
                            TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                    Container(
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
