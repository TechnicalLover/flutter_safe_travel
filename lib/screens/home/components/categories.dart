import 'package:flutter/material.dart';
import 'package:safetravel/screens/Location/tracking_location_screen.dart';
import 'package:safetravel/screens/tour/details_screen/my_tour_detail.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CategoryCard(
                icon: "assets/icons/flash.png",
                text: "Khuyến mãi",
                press: () => {}),
            CategoryCard(
                icon: "assets/icons/ticket.png",
                text: "Tour đã đặt",
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TravelDetailPage()))),
            CategoryCard(
                icon: "assets/icons/shield.png",
                text: "Quét Covid",
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrackingLocationScreen()))),
            CategoryCard(
                icon: "assets/icons/more.png",
                text: "Xem thêm",
                press: () => {})
          ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.32),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(icon!,
                  color: kSecondaryColor,
                  height: 5,
                  width: 5,
                  fit: BoxFit.scaleDown),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
