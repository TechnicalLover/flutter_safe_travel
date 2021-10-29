import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/start_page/widget.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/confirm/member_accounts_page.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'member_search_page.dart';

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
  void initState() {
    super.initState();
  }

  List<String> _memberImages = [];
  List<String> _members = [];

  Future<void> loadMembers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> memberImages = prefs.getStringList('memberImages') ?? [];
    List<String> members = prefs.getStringList('members') ?? [];
    setState(() {
      _members = members;
      _memberImages = memberImages;
    });
  }

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

  selectMethod() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Thêm thành viên', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: buildPrimaryButton('Đã có tài khoản', () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberSearchPage(addMember),
                  ),
                );
              }),
            ),
            SizedBox(
              width: double.infinity,
              child: buildSecondaryButton('Không có tài khoản', () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberAccountsPage(addMember),
                  ),
                );
              }),
            ),
          ],
        ),
        actions: <Widget>[
          buildOutlinedButton(
            'Huỷ',
            () {
              Navigator.pop(context, 'Cancel');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    loadMembers();

    List<Widget> memberCards = [];

    for (int i = 0; i < _members.length; i++) {
      Widget item = buildMemberCard(
        i < _memberImages.length
            ? _memberImages[i]
            : 'assets/images/person.png',
        _members[i],
      );
      memberCards.add(item);
    }
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
                InkWell(
                  onTap: () {
                    loadMembers();
                  },
                  child: Text('Thành viên', style: h3b),
                ),
                moreButton('Thêm thành viên', () {
                  selectMethod();
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemberPage(),
                    ),
                  );
                  */
                }),
              ],
            ),
            Column(
              children: memberCards,
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
              child: buildSecondaryButton('Huỷ bỏ', () {
                Navigator.pop(context);
              }),
            ),
            SizedBox(
              width: 200.w,
              child: buildPrimaryButton('Lưu', () {
                _pushMessage();
              }),
            ),
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
