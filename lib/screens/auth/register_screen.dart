import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/auth/login_screen.dart';
import 'package:safetravel/screens/main_screen.dart';
import 'package:safetravel/screens/page/qr_scan.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class RegiterScreen extends StatefulWidget {
  RegiterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegiterScreen> {
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Bạn đã có tài khoản? ',
              style: h3,
            ),
            TextSpan(
              text: 'Đăng nhập',
              style: h3b,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tài khoản',
          style: h3,
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: h3,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.h),
              prefixIcon: Icon(
                Icons.people,
                color: goodBlack,
              ),
              hintText: 'Nhập tài khoản',
              hintStyle: h3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: h3,
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: h3,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.h),
              prefixIcon: Icon(
                Icons.email,
                color: goodBlack,
              ),
              hintText: 'Nhập Email',
              hintStyle: h3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mật khẩu',
          style: h3,
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.h,
          child: TextField(
            obscureText: true,
            style: h3,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: goodBlack,
              ),
              hintText: 'Nhập mật khẩu',
              hintStyle: h3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Xác nhận mật khẩu',
          style: h3,
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.h,
          child: TextField(
            obscureText: true,
            style: h3,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.h),
              prefixIcon: Icon(
                Icons.lock,
                color: goodBlack,
              ),
              hintText: 'Xác nhận mật khẩu',
              hintStyle: h3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    ButtonStyle style = ElevatedButton.styleFrom(
      elevation: 5.0,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      primary: kPrimaryColor,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _continue(),
        style: style,
        child: Text(
          'TIẾP TỤC',
          style: h3b.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void _fail() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Đăng kí thất bại', style: h3),
          ],
        ),
        content: Text('Không thể hoàn tất quá trình đăng kí.', style: h4),
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

  void _continue() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Xác nhận', style: h3),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Quý khách cần xác nhận đã tiêm 2 mũi vacxin covid để có thể hoàn tất quá trình đăng kí.',
                style: h4),
            SizedBox(
              height: 2.h,
            ),
            RichText(
              text: TextSpan(
                text: '',
                style: h4,
                children: <TextSpan>[
                  TextSpan(
                    text: 'QR Code',
                    style: h4b,
                  ),
                  TextSpan(
                    text: ' sẽ được cấp ở ứng dụng ',
                    style: h4,
                  ),
                  TextSpan(
                    text: 'Sổ sức khoẻ điện tử',
                    style: h4b,
                  ),
                  TextSpan(
                    text: ' nếu quý khách đã tiêm đủ 2 mũi vacxin covid.',
                    style: h4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text('Cho phép ứng dụng mở camera để quét QR Code?', style: h4b),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              _fail();
            },
            child: Text('Không đồng ý', style: h4),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => QRScan()));
            },
            child: Text('Đồng ý', style: h4),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/safe-travel-register.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Đăng Ký Tài Khoản',
                        style: h1b.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 20.h),
                      _buildUsernameTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildConfirmPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildRegisterBtn(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
