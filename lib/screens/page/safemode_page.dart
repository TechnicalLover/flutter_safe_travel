import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:safetravel/screens/page/constants.dart';
import 'package:safetravel/screens/page/notification.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SafeModePage extends StatefulWidget {
  final Function loadShield;
  const SafeModePage(this.loadShield, this.setVisibleAppbar, {Key? key})
      : super(key: key);

  final Function setVisibleAppbar;

  @override
  State<SafeModePage> createState() => _SafeModeState();
}

class _SafeModeState extends State<SafeModePage> {
  final ScrollController _scrollController = ScrollController();
  bool _status = true;

  _setSafeMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('safeModeOn', value);
  }

  @override
  void initState() {
    super.initState();
  }

  void pushNotification() {
    Future.delayed(
        const Duration(milliseconds: 10000),
        () => NotificationApi.showNotification(
              title: 'Đào Phương Nam - HCI201 Nhóm 5',
              body: 'Tiếp xúc gần với bạn',
              payload: 'namdp',
            ));

    Future.delayed(
        const Duration(milliseconds: 30000),
        () => NotificationApi.showNotification(
              title: 'Dương Thanh Sang - HCI201 Nhóm 5',
              body: 'Đi vào khu vực có tỉ lệ móc túi cao',
              payload: 'sangdt',
            ));

    Future.delayed(
        const Duration(milliseconds: 50000),
        () => NotificationApi.showNotification(
              title: 'Trần Lê Minh Đức - HCI201 Nhóm 5',
              body: 'Đi quá xa với đoàn',
              payload: 'ductlm',
            ));
  }

  Future<void> loadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool safeModeOn = prefs.getBool('safeModeOn') ?? false;
    setState(() {
      if (safeModeOn) {
        _status = true;
      } else {
        _status = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loadStatus();
    return NotificationListener(
      onNotification: (t) {
        if (t is ScrollEndNotification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            widget.setVisibleAppbar(true);
          }
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            widget.setVisibleAppbar(false);
          }
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            /* Remove Switch Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(
                  value: _status,
                  onChanged: (value) {
                    _setSafeMode(value);
                    widget.loadShield();
                    setState(() {
                      _status = value;
                    });
                    if (value) pushNotification();
                    if (value) {
                      Fluttertoast.showToast(
                        msg: "Kích hoạt thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                  activeTrackColor: kPrimaryColor05,
                  activeColor: kPrimaryColor,
                ),
              ],
            ),
            */
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 0.8.sw,
              width: 0.8.sw,
              child: Stack(
                children: [
                  Visibility(
                    visible: _status,
                    child: Lottie.asset(
                      'assets/images/radar2.json',
                      width: 0.8.sw,
                      repeat: true,
                    ),
                  ),
                  Visibility(
                    visible: !_status,
                    child: Container(
                      alignment: Alignment.center,
                      height: 0.8.sw,
                      width: 0.8.sw,
                      child: activeButton('Nhấn để kích hoạt', () {
                        Fluttertoast.showToast(
                          msg: "Kích hoạt thành công",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                        setState(() {
                          _status = true;
                        });
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [boxShadowImage],
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text('Lịch sử thông báo', style: h3),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  buildNotificationCard('assets/images/av1.png',
                      'Đào Phương Nam', 'Tiếp xúc gần với bạn'),
                  buildNotificationCard(
                      'assets/images/av2.jpeg',
                      'Dương Thanh Sang',
                      'Đi vào khu vực có tỉ lệ móc túi cao'),
                  buildNotificationCard('assets/images/av3.jpeg',
                      'Trần Lê Minh Đức', 'Đi quá xa với đoàn'),
                  buildNotificationCard('assets/images/av4.jpeg',
                      'Trần Gia Nguyên', 'Đi vào khu vực vắng vẻ'),
                  buildNotificationCard('assets/images/av5.jpeg',
                      'Nguyễn Lê Mẫn Đạt', 'Tiếp xúc gần với bạn'),
                  moreButton('Xem thêm', () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildNotificationCard(String img, String name, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [boxShadowDetail],
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(img),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: h4b,
                      ),
                      Text(
                        'HCI201 Nhóm 5',
                        style: h5,
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.error_outline),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description,
                style: h4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget moreButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      width: 150.w,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h4.copyWith(
                color: goodGray,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget activeButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      width: 250.w,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h4.copyWith(
                color: goodGray,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
