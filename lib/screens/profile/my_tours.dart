import 'package:flutter/material.dart';
import 'package:safetravel/utilities/constants.dart';

import 'package:safetravel/widget/list_tour_card.dart';

class MyTour extends StatelessWidget {
  const MyTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY TOURS"),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Wrap(children: [
            ListTourCard(
                image: "assets/yachts/yacht1.jpg",
                title: "Classic",
                address: "Hòn Tiên",
                price: 5000,
                press: () => {print("Hon Tien")}),
            ListTourCard(
                image: "assets/yachts/yacht2.jpg",
                title: "Business",
                address: "Phú Quốc",
                price: 998,
                press: () => {print("Hon Ba")}),
            ListTourCard(
                image: "assets/yachts/yacht3.jpg",
                title: "Business",
                address: "Hà Tiên",
                price: 800,
                press: () => {print("Phu Quoc")}),
            ListTourCard(
                image: "assets/yachts/yacht4.jpg",
                title: "Luxury",
                address: "Resort Vin",
                price: 18976,
                press: () => {print("Test")}),
            ListTourCard(
                image: "assets/yachts/yacht4.jpg",
                title: "Luxury",
                address: "Resort Vin",
                price: 18976,
                press: () => {print("Test")}),
            ListTourCard(
                image: "assets/yachts/yacht4.jpg",
                title: "Luxury",
                address: "Resort Vin",
                price: 18976,
                press: () => {print("Test")})
          ]),
        ],
      ),
    );
  }
}
