import 'package:flutter/material.dart';
import 'package:safetravel/screens/page/model.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

import 'dotted_line.dart';

class ThirdPage extends StatefulWidget {
  final TourModel model;
  const ThirdPage(this.model, {Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late TourModel model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: goodGray.withOpacity(0.3),
            offset: const Offset(-4, 4),
            blurRadius: 20,
          ),
        ],
      ),
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            alignment: Alignment.topLeft,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        model.imgUrl[0],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            style: h2b,
                          ),
                          // Text(
                          //   '08:00AM 26/12/2021',
                          //   style: h3b.copyWith(
                          //     fontWeight: FontWeight.normal,
                          //     color: goodGray,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customLine(
                      Text('Người đặt', style: h3),
                      Text('Đào Phương Nam', style: h3),
                      0,
                    ),
                    customLine(
                      Text('Thời gian', style: h3),
                      Text(model.duration.toString() + ' ngày', style: h3),
                      0,
                    ),
                    customLine(
                      Text('Giờ khởi hành', style: h3),
                      Text('8:00 20/12/2021', style: h3),
                      0,
                    ),
                    customLine(
                      Text('Điểm khởi hành', style: h3),
                      Text(model.location2, style: h3),
                      0,
                    ),
                    customLine(
                      Text('Điểm đến', style: h3),
                      Text(model.location, style: h3),
                      0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: DottedLine(
                        dashColor: goodGray,
                      ),
                    ),
                    itemLine('Số người', 2, '2 550 000 VNĐ', 10),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: DottedLine(
                        dashColor: goodGray,
                      ),
                    ),
                    /*
                    customLine(
                      Text('Tạm tính', style: h3b),
                      Text('2 500 000 VNĐ', style: h3b),
                      10,
                    ),
                    customLine(
                      Text('Phí dịch vụ', style: h3),
                      Text('200 000 VNĐ', style: h3),
                      3,
                    ),
                    customLine(
                      Text('Khuyến mãi', style: h3ita),
                      Text('100 000 VNĐ', style: h3ita),
                      3,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: DottedLine(
                        dashColor: goodGray,
                      ),
                    ),
                    customLine(
                      Text('Tổng cộng', style: h2b),
                      Text('4 555 000 VNĐ', style: h2b),
                      10,
                    )
                    */
                  ],
                )
              ],
            ),
          ),
          ClipPath(
            clipper: PointsClipper(),
            child: Container(
              height: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemLine(String text, int quantity, String price, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: text,
              style: h3,
              children: <TextSpan>[
                TextSpan(
                    text: ': $quantity',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(price, style: h3),
        ],
      ),
    );
  }
}

Widget customLine(Widget first, Widget second, double marginTop) {
  return Container(
    margin: EdgeInsets.only(top: marginTop),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        first,
        second,
      ],
    ),
  );
}

class PointsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / 39;

    while (x < size.width) {
      x += increment;
      y = (y == size.height) ? size.height * .60 : size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
