import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/auth/login_screen.dart';
import 'package:safetravel/screens/start_page/term_page.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 75,
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                    child: Image.asset('assets/images/safe-travel.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset('assets/images/van.png'),
                          SizedBox(
                            height: 20.h,
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  'Tận hưởng những chuyến du lịch an toàn cùng với ',
                              style: h3,
                              children: <TextSpan>[
                                TextSpan(text: 'SafeTravel.', style: h3b),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Là ứng dụng giúp bạn tìm kiếm các tour du lịch an toàn một cách dễ dàng và cung cấp những công cụ để bạn có một chuyến du lịch an toàn.',
                            style: h3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 25,
              child: Column(
                children: [
                  SizedBox(
                    width: 250.w,
                    child: buildLoginButton('Đăng nhập', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: buildRegisterButton('Đăng kí', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermScreen()));
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h3b.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }

  Widget buildRegisterButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h3b.copyWith(
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
