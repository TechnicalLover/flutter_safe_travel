import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';
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
  bool _status = false;

  _setSafeMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('safeModeOn', value);
  }

  @override
  Widget build(BuildContext context) {
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
                  },
                  activeTrackColor: kPrimaryColor05,
                  activeColor: kPrimaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
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
                  setState(() {
                    _status = true;
                  });
                }),
              ),
            ),
          ],
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
