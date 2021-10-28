import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:safetravel/screens/page/qr_scan.dart';
import 'package:safetravel/screens/start_page/widget.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

import '../main_screen.dart';

class CovidConfirmPage extends StatefulWidget {
  final bool status;
  const CovidConfirmPage({Key? key, this.status = false}) : super(key: key);

  @override
  _CovidConfirmPageState createState() => _CovidConfirmPageState();
}

class _CovidConfirmPageState extends State<CovidConfirmPage> {
  late bool status;
  bool isLoading = true;

  setStatus(bool value) {
    setState(() {
      status = value;
    });
  }

  @override
  void initState() {
    status = widget.status;
    if (status) {
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setState(
            () {
              isLoading =
                  false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
            },
          );
        }
      });
    }
    super.initState();
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
                    'assets/images/shield.png',
                    width: 100.w,
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Expanded(
                    child: Text(
                        'Xác nhận tiêm 2 mũi vacxin covid để hoàn tất quá trình đăng kí',
                        style: h2b),
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
                      'Quý khách cần xác nhận đã tiêm 2 mũi vacxin covid để có thể hoàn tất quá trình đăng kí.',
                      style: h3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: h3,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'QR Code',
                            style: h3b,
                          ),
                          TextSpan(
                            text: ' sẽ được cấp ở ứng dụng ',
                            style: h3,
                          ),
                          TextSpan(
                            text: 'Sổ sức khoẻ điện tử',
                            style: h3b,
                          ),
                          TextSpan(
                            text:
                                ' nếu quý khách đã tiêm đủ 2 mũi vacxin covid.',
                            style: h3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Visibility(
                      visible: !status,
                      child: Column(
                        children: [
                          buildQRButton(
                            Icon(
                              Icons.camera_alt,
                              color: goodBlack,
                            ),
                            'Mở máy ảnh',
                            () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const QRScan()));
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          buildQRButton(
                            Icon(
                              Icons.image,
                              color: goodBlack,
                            ),
                            'Chọn từ tệp',
                            () {},
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Quét QR Code từ máy ảnh, hoặc mở từ tệp hình ảnh để xác nhận',
                            textAlign: TextAlign.center,
                            style: h4,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: status,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 150.h,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: isLoading,
                                  child: Lottie.asset(
                                    'assets/icons/world-locations.json',
                                    height: 150.h,
                                    repeat: true,
                                  ),
                                ),
                                Visibility(
                                  visible: !isLoading,
                                  child: Lottie.asset(
                                    'assets/icons/success-animation.json',
                                    height: 120.h,
                                    repeat: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !isLoading,
                            child: Text(
                              'Xác nhận đã tiêm 2 mũi vacxin covid',
                              style: h3,
                            ),
                          ),
                          Visibility(
                            visible: isLoading,
                            child: Text(
                              'Đang xác nhận...',
                              style: h3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 140.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: !isLoading,
              child: buildPrimaryButton('Tiếp tục', () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => MainScreen(
                      register: true,
                    ),
                  ),
                  (route) =>
                      false, //if you want to disable back feature set to false
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQRButton(Icon icon, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style: h4b.copyWith(
                color: goodBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: goodBlack,
          ),
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
