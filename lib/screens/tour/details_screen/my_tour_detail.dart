import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

import '../qr_code.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs
class TravelDetailPage extends StatefulWidget {
  @override
  _TravelDetailPageState createState() => _TravelDetailPageState();
}

class _TravelDetailPageState extends State<TravelDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage("assets/tours/tour1.jpg"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                        left: 16,
                        top: 16,
                      ),
                    ],
                  ),
                ),
              ),
              flex: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Đà Nẵng",
                            style: h2b,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => QRCode()));
                            },
                            icon: Icon(Icons.qr_code),
                          )
                        ],
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
                              "Hội An - Đà nẵng , Viet Nam",
                              style: h3,
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
                            style: h3.copyWith(color: goodGray),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'HCI 201 Nhóm 5',
                            style: h3b,
                          ),
                          Text(
                            "5 325 000 VND",
                            style: h3b.copyWith(color: kPrimaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ngày 1: Hội An \n 13h00: Bọn mình xuống sân bay rồi di chuyển về nơi nghỉ ở Hội An \n Những điểm nhất định cần check-in: Phố cổ, dọc sông Thu Bồn, nước Mót, Faifo Coffe (130 Trần Phú, Hội An), hẻm tường vàng (đối diện Faifo Coffee)\n18h00: Về nghỉ ngơi rồi tối đi ăn Mỳ Quảng, Cao Lầu, tham quan chợ đêm bên kia sông và ngắm đèn lồng (các bạn có thể thuê thuyền thả hoa đăng)\n\nNgày 2: Rừng dừa Bảy Mẫu (Hội An) – Đà Nẵng\n06h00: Bọn mình dậy sớm để chuẩn bị, ăn sáng Bún Mắm bà Trung, trở lại Chùa Cầu vì hôm qua đông quá, sáng sớm ít người hơn.",
                        overflow: TextOverflow.fade,
                        style: h4,
                      ),
                    ],
                  ),
                ),
                flex: 7,
              ),
            ),
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Column(
            //         children: [
            //           CircleAvatar(
            //             backgroundColor: Colors.white,
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             "Safety",
            //             style: TextStyle(
            //               fontSize: 12,
            //             ),
            //           )
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           CircleAvatar(
            //             backgroundColor: Colors.white,
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             "WiFi",
            //             style: TextStyle(
            //               fontSize: 12,
            //             ),
            //           )
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           CircleAvatar(
            //             backgroundColor: Colors.white,
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             "Lunch",
            //             style: TextStyle(
            //               fontSize: 12,
            //             ),
            //           )
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           CircleAvatar(
            //             backgroundColor: Colors.white,
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             "Spa",
            //             style: TextStyle(
            //               fontSize: 12,
            //             ),
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            //   flex: 3,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 72,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: kPrimaryColor,
                              ),
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                            ),
                          ),
                          Text(
                            "Tp. Hồ Chí Minh",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                      Container(
                        color: goodGray,
                        height: 1.h,
                        width: 100.w,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: kPrimaryColor),
                            ),
                            child: Icon(
                              Icons.assistant_photo,
                              color: kPrimaryColor,
                            ),
                          ),
                          Text(
                            "Đà Nẵng",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            "Ngày khởi hành:",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            "12/05/2021",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Wrap(
                        children: [
                          Text(
                            "Ngày kết thúc:",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            "18/05/2021",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
