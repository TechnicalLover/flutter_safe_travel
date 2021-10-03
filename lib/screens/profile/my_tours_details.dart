import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:safetravel/utilities/constants.dart';

class MyTourDetail extends StatelessWidget {
  final List<String> imageList = [
    "https://dulichkhatvongviet.com/wp-content/uploads/2015/03/huong-dan-du-lich-ha-long.jpg",
    "https://dulichviet.net.vn/wp-content/uploads/2019/06/du-lich-ha-long-1.jpg",
    "https://www.wyndhamhalong.com/uploads/blog/2017/T8/kinh-nghiem-lan-dau-du-lich-ha-long1.jpg",
    "https://www.wyndhamhalong.com/uploads/blog/2017/T8/kinh-nghiem-du-lich-ha-long1.jpg",
    "https://file.hstatic.net/1000169629/file/quan_ao_di_du_lich_ha_long_60daaba65dd74e5e80e0871c063756b8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAILS"),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              autoplay: true,
              images: [
                Image.asset(
                  'assets/images/1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/3.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/4.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/5.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Nha Trang",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        "🇻🇳",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Khanh Hoa, Viet Nam",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "⭐",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "4.5/5 (1250)",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("\$1299.00",
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\$999.00",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                  ],
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, "
                  "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                  " Ut enim ad minim veniam,"
                  " quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
