// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safetravel/utilities/constants.dart';

class ListCarouselTour {
  late String image;
  late String tittle;
  ListCarouselTour({required this.image, required this.tittle});
}

class CarouselSliderTour extends StatelessWidget {
  List<ListCarouselTour> items = [
    ListCarouselTour(
        image: 'assets/tours/tour1.jpg', tittle: 'Tour đà nẵng 3 ngày 2 đêm'),
    ListCarouselTour(
        image: 'assets/tours/tour2.jpg', tittle: 'Tour Huế 3 ngày 2 đêm'),
    ListCarouselTour(
        image: 'assets/tours/tour4.jpg', tittle: 'Tour hội an 3 ngày 2 đêm'),
  ];
  CarouselSliderTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        viewportFraction: 0.8,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(
                    '${item.image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              width: 1000,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: kPrimaryColor.withOpacity(0.43),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        '${item.tittle}'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
