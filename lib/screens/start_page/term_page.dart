import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/auth/register_screen.dart';
import 'package:safetravel/screens/start_page/widget.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

class TermScreen extends StatefulWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  void _declineTerms() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Xác nhận', style: h3),
          ],
        ),
        content: Text(
            'Quý khách cần đồng ý điều khoản sử dụng để tiếp tục.\nQuý khách có muốn thoát?',
            style: h4),
        actions: <Widget>[
          buildOutlinedButton(
            'Huỷ bỏ',
            () => Navigator.pop(context, 'Cancel'),
          ),
          buildOutlinedButton(
            'Thoát',
            () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/terms.png',
                    width: 75.w,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Điều khoản sử dụng', style: h2b),
                      Text(
                        'Cập nhật ngày 21/10/2021',
                        style: h3.copyWith(color: goodGray),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Để có thể tiếp tục, quý khách cần đảm bảo đã đọc rõ và đồng ý với các nội dung dưới đây:',
                      style: h3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '   \u{25B6} Quý khách đồng ý rằng ứng dụng này sẽ có quyền sử dụng định vị GPS, và Bluetooth.',
                      style: h3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '   \u{25B6} Trong quá trình đăng kí quý ứng dụng sẽ yêu cầu quý khách quét QR Code xác nhận 2 mũi tiêm vacxin covid (QR Code ở ứng dụng "Sổ sức khoẻ điện tử").',
                      style: h3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '   \u{25B6} Các điều khoản nếu được cập nhật sẽ được thông báo đến quý khách thông qua ứng dụng.',
                      style: h3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200.w,
              child: buildSecondaryButton('Từ chối', () {
                _declineTerms();
              }),
            ),
            SizedBox(
              width: 200.w,
              child: buildPrimaryButton('Đồng ý', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegiterScreen()),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
