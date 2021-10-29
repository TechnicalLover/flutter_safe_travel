import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:safetravel/screens/start_page/widget.dart';
import 'package:safetravel/screens/tour/confirm/qr_scan_2.dart';
import 'package:safetravel/utilities/constants.dart';

import 'confirm_constants.dart';

class MemberAccountsPage extends StatefulWidget {
  final Function addMember;
  const MemberAccountsPage(this.addMember, {Key? key}) : super(key: key);

  @override
  _MemberAccountsPageState createState() => _MemberAccountsPageState();
}

class _MemberAccountsPageState extends State<MemberAccountsPage> {
  int _genderValue = 0;
  bool status = false;

  setStatus(bool value) {
    setState(() {
      status = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm thành viên'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              child: Column(
                children: [
                  textFiled(const Icon(Icons.account_circle), 'Họ và tên',
                      'Trịnh Anh Tài'),
                  const SizedBox(
                    height: 15,
                  ),
                  genderRadio(),
                  textFiled(const Icon(Icons.mail_outline), 'Email',
                      'ealflm@gmail.com'),
                  textFiled(
                      const Icon(Icons.phone), 'Số điện thoại', '0369085855'),
                  textFiled(const Icon(Icons.home), 'Địa chỉ',
                      'Quận 9, Thành Phố Hồ Chí Minh'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Visibility(
                    visible: !status,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Xác nhận tiêm 2 mũi covid',
                              style: h3,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Column(
                          children: [
                            buildQRButton(
                              Icon(
                                Icons.camera_alt,
                                color: goodBlack,
                              ),
                              'Mở máy ảnh',
                              () {
                                //Navigator.of(context).push(MaterialPageRoute(
                                //    builder: (context) => const QRScan()));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QRScan2(setStatus),
                                  ),
                                );
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
                              'Quét QR Code từ máy ảnh, hoặc mở từ tệp hình ảnh để xác nhận (QR Code được cấp ở ứng dụng Sổ sức khoẻ y tế)',
                              textAlign: TextAlign.center,
                              style: h4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: status,
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/icons/success-animation.json',
                          height: 120.h,
                          repeat: false,
                        ),
                        Text('Xác nhận thành công'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: status,
        child: SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200.w,
                child: buildPrimaryButton('Thêm', () {
                  widget.addMember('assets/images/av11.jpeg', 'Trịnh Anh Tài');
                  Navigator.pop(context);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFiled(Icon icon, String text, String init) {
    return TextFormField(
      initialValue: init,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: text,
        //labelStyle: formStyle,
      ),
    );
  }

  Row genderRadio() {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset('assets/icons/gender.svg', color: goodGray),
        ),
        Text(
          'Giới tính',
          style: formStyle.copyWith(fontSize: 16),
        ),
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: _genderValue,
              onChanged: (value) {
                setState(() {
                  _genderValue = value as int;
                });
              },
            ),
            Text(
              "Nam",
              style: formStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _genderValue,
              onChanged: (value) {
                setState(() {
                  _genderValue = value as int;
                });
              },
            ),
            Text(
              "Nữ",
              style: formStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ],
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
