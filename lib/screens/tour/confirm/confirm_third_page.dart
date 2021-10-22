import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/page/constants.dart';
import 'package:safetravel/screens/page/model.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

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
            blurRadius: 20.r,
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(40.w, 20.h, 40.w, 25.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40.w, 25.h, 40.w, 25.h),
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
                    SizedBox(width: 10.h),
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
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customLine(
                      Text('Người đặt', style: h3),
                      Text('Đào Phương Nam', style: h3),
                      0.h,
                    ),
                    customLine(
                      Text('Thời gian', style: h3),
                      Text(model.duration.toString() + ' ngày', style: h3),
                      0.h,
                    ),
                    customLine(
                      Text('Giờ khởi hành', style: h3),
                      Text('8:00 20/12/2021', style: h3),
                      0.h,
                    ),
                    customLine(
                      Text('Điểm khởi hành', style: h3),
                      Text(model.location2, style: h3),
                      0.h,
                    ),
                    customLine(
                      Text('Điểm đến', style: h3),
                      Text(model.location, style: h3),
                      0.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: DottedLine(
                        dashColor: goodGray,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text('Hội bạn cấp 3', style: h3b),
                    SizedBox(
                      height: 8.h,
                    ),
                    buildMemberCard('assets/images/av1.png', 'Đào Phương Nam'),
                    buildMemberCard(
                        'assets/images/av2.jpeg', 'Dương Thanh Sang'),
                    buildMemberCard(
                        'assets/images/av3.jpeg', 'Trần Lê Minh Đức'),
                    buildMemberCard(
                        'assets/images/av4.jpeg', 'Trần Gia Nguyên'),
                    buildMemberCard(
                        'assets/images/av5.jpeg', 'Nguyễn Lê Mẫn Đạt'),
                    SizedBox(
                      height: 8.h,
                    ),
                    itemLine('Số người', 5,
                        numberFormat.format(model.price * 5), 0.h),
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
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
              height: 15.h,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toolTip() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Image.asset(
              'assets/images/shield.png',
              height: 20.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text('Gợi ý', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Người này đã xác nhận tiêm 2 mũi vacxin covid',
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: Text('OK', style: h4),
          ),
        ],
      ),
    );
  }

  Widget buildMemberCard(String img, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(img),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(title, style: h4b),
              SizedBox(
                width: 8.w,
              ),
              /*
              InkWell(
                onTap: () => _toolTip(),
                child:
                    const Icon(Icons.gpp_good, size: 20, color: kPrimaryColor),
              ),
              */
            ],
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
