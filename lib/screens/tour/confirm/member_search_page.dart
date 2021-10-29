import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/start_page/widget.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberSearchPage extends StatefulWidget {
  final Function addMember;
  const MemberSearchPage(this.addMember, {Key? key}) : super(key: key);

  @override
  _MemberSearchPageState createState() => _MemberSearchPageState();
}

class _MemberSearchPageState extends State<MemberSearchPage> {
  List<bool> buttonState = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  addMember(String image, String member) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> memberImages = prefs.getStringList('memberImages') ?? [];
    List<String> members = prefs.getStringList('members') ?? [];
    memberImages.add(image);
    members.add(member);
    await prefs.setStringList('memberImages', memberImages);
    await prefs.setStringList('members', members);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tìm theo tên hoặc id',
                //labelStyle: formStyle,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildPrimaryButton('Tìm kiếm', () {}),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                buildMemberCard(
                  'assets/images/av6.jpeg',
                  'Trần Minh Tấn',
                  1,
                ),
                buildMemberCard(
                  'assets/images/av7.jpeg',
                  'Lê Tiến Đạt',
                  2,
                ),
                buildMemberCard(
                  'assets/images/av8.jpeg',
                  'Nguyễn Huy Hoàng',
                  3,
                ),
                buildMemberCard(
                  'assets/images/av9.jpeg',
                  'Trần Nguyễn Thăng',
                  4,
                ),
              ],
            )
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
              child: buildSecondaryButton('Trở lại', () {
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMemberCard(String img, String title, int id) {
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
          !buttonState[id]
              ? buildAddButton('Thêm', () {
                  widget.addMember(img, title);
                  setState(() {
                    buttonState[id] = true;
                  });
                })
              : buildAddButton2('Đã thêm', () {})
        ],
      ),
    );
  }

  Widget buildAddButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Container(
        width: 100.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Text(
          text,
          style: h4.copyWith(
            color: kPrimaryColor,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 2.0, color: kPrimaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  Widget buildAddButton2(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Container(
        width: 100.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Text(
          text,
          style: h4.copyWith(
            color: goodGray,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.0, color: goodGray),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
