import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/confirm/widget.dart';
import 'package:safetravel/utilities/constants.dart';

class ConfirmGroupPage extends StatefulWidget {
  const ConfirmGroupPage({Key? key}) : super(key: key);

  @override
  _ConfirmGroupPageState createState() => _ConfirmGroupPageState();
}

class _ConfirmGroupPageState extends State<ConfirmGroupPage> {
  void _pushMessage() {
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
            Text('Thêm nhóm thành công'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              Navigator.pop(context);
            },
            child: Text('OK', style: h4),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm nhóm'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          children: [
            textFiled(const Icon(Icons.groups), 'Tên nhóm', ''),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Thành viên', style: h3b),
                moreButton('Thêm thành viên', () {}),
              ],
            ),
            buildMemberCard('assets/images/av1.png', 'Đào Phương Nam'),
            buildMemberCard('assets/images/av2.jpeg', 'Dương Thanh Sang'),
            buildMemberCard('assets/images/av3.jpeg', 'Trần Lê Minh Đức'),
            buildMemberCard('assets/images/av4.jpeg', 'Trần Gia Nguyên'),
            buildMemberCard('assets/images/av5.jpeg', 'Nguyễn Lê Mẫn Đạt'),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSecondaryButton('Huỷ bỏ', () {
              Navigator.pop(context);
            }),
            buildPrimaryButton('Lưu', () {
              _pushMessage();
            }),
          ],
        ),
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
            ],
          ),
          const Icon(Icons.clear, size: 20),
        ],
      ),
    );
  }

  Widget moreButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      width: 220.w,
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
            Icon(
              Icons.add,
              size: 20,
              color: goodGray,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
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
}
