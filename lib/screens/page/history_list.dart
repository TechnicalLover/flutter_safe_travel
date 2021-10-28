import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/page/data.dart';
import 'package:safetravel/screens/start_page/widget.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/confirm/confirm_third_page.dart';
import 'package:safetravel/screens/tour/confirm/dotted_line.dart';
import 'package:safetravel/screens/tour/tour_detail_screen_2.dart';

import 'constants.dart';
import 'model.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  bool groupValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHistoryCard(tourData[0]),
        buildHistoryCard(tourData[1]),
      ],
    );
  }

  void _cancel() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Lý do huỷ', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quý khách vui lòng chọn lí do muốn huỷ tour'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: groupValue,
                  onChanged: (value) => {},
                ),
                Text('Tìm được tour khác ưng ý hơn'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: groupValue,
                  onChanged: (value) => {},
                ),
                Text('Thay đổi lịch'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: false,
                  groupValue: groupValue,
                  onChanged: (value) => {},
                ),
                Text('Khác'),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập lí do khác',
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text('Huỷ', style: h4),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              _pushSuccess();
            },
            child: Text('Đồng ý', style: h4),
          ),
        ],
      ),
    );
  }

  void _pushSuccess() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Thành công', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Huỷ thành công'),
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

  Container buildHistoryCard(TourModel model) {
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
                      Text('Thời gian đặt', style: h3),
                      Text('17:05, 30/10/2021', style: h3),
                      0.h,
                    ),
                    customLine(
                      Text('Thời gian tour diễn ra', style: h3),
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
                    customLine(
                      Text('Phương tiện', style: h3),
                      Text('Máy bay', style: h3),
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
                    Text('Thành viên: ', style: h3b),
                    SizedBox(
                      height: 8.h,
                    ),
                    buildMemberCard(
                      'assets/images/av1.png',
                      'Đào Phương Nam',
                      'Người đăng kí',
                    ),
                    buildMemberCard(
                      'assets/images/av2.jpeg',
                      'Dương Thanh Sang',
                      'Thành viên',
                    ),
                    buildMemberCard(
                      'assets/images/av3.jpeg',
                      'Trần Lê Minh Đức',
                      'Thành viên',
                    ),
                    buildMemberCard(
                      'assets/images/av4.jpeg',
                      'Trần Gia Nguyên',
                      'Thành viên',
                    ),
                    buildMemberCard(
                      'assets/images/av5.jpeg',
                      'Nguyễn Lê Mẫn Đạt',
                      'Thành viên',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    itemLine('Số người', 5, model.priceVND,
                        numberFormat.format(model.price * 5), 0.h),
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: DottedLine(
                        dashColor: goodGray,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildPrimaryButton('Xem tour', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TourDetailRaw(model),
                            ),
                          );
                        }),
                        buildSecondaryButton('Huỷ', () {
                          _cancel();
                        }),
                      ],
                    )
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

  Widget itemLine(String text, int quantity, String priceX, String price,
      double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('Tổng: ', style: h3),
            ],
          ),
          Column(
            children: [
              Text("x " + priceX, style: h3),
              Text(price, style: h3),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMemberCard(String img, String title, String subtitle) {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: h4b),
                  Text(subtitle, style: h4),
                ],
              ),
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
}
