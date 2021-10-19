import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/page/explorer_page.dart';
import 'package:safetravel/screens/page/group_page.dart';
import 'package:safetravel/screens/page/safemode_page.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/confirm/salomon_bottom_bar.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class MainScreen extends StatefulWidget {
  final int pageIndex;

  MainScreen({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int pageIndex;
  late List<Widget> pageList;
  late double _logoHeight;
  late Widget iconShield;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.pageIndex;
    pageList = <Widget>[
      ExplorerPage(setVisibleAppbar),
      SafeModePage(loadShield, setVisibleAppbar),
      GroupPage(setVisibleAppbar),
      GroupPage(setVisibleAppbar),
    ];
    _logoHeight = 40.h;
    iconShield = Icon(Icons.shield_outlined);
    _confirm();
  }

  Future<void> loadShield() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool safeModeOn = prefs.getBool('safeModeOn') ?? false;
    setState(() {
      if (safeModeOn) {
        iconShield = Icon(Icons.verified_user, color: kPrimaryColor);
      } else {
        iconShield = Icon(Icons.shield_outlined);
      }
    });
  }

  void setVisibleAppbar(bool isVisible) {
    if (mounted) {
      setState(() {
        if (isVisible) {
          _logoHeight = 40.h;
        } else {
          _logoHeight = 0;
        }
      });
    }
  }

  void setPageIndex(int index) {
    if (mounted) {
      setState(() {
        pageIndex = index;
      });
    }
    if (pageIndex == 0) {
      setVisibleAppbar(true);
    } else {
      setVisibleAppbar(false);
    }
  }

  _setSafeMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('safeModeOn', value);
  }

  void _success() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Image.asset(
              'assets/images/shield.png',
              height: 20.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text('Thành công', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kích hoạt thành công'),
          ],
        ),
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

  Future<void> _confirm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool safeModeOn = prefs.getBool('safeModeOn') ?? false;
    bool recommend = prefs.getBool('recommend') ?? false;

    if (!safeModeOn && recommend) {
      await prefs.setBool('recommend', false);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/shield.png',
                height: 20.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text('Gợi ý', style: h3),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Bạn vừa đặt tour, bạn có muốn bật ',
                  style: h4,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Chế độ an toàn',
                      style: h4b,
                    ),
                    TextSpan(text: ' không?'),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'Chế độ an toàn: ',
                  style: h4.copyWith(color: goodGray),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Các thành viên trong tour sẽ được thông báo khi: \n   - Đi quá xa nhau.\n   - Tiếp xúc quá gần với người lạ xung quanh.\n   - Đi đến khu vực quá vắng vẻ.\n   - Đi đến khu vực nguy hiểm, thường xuyên bị cướp giật, móc túi. \nSẽ được nhắc nhở đeo khẩu trang, khử khuẩn tay thường xuyên.'),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Từ chối', style: h4),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                _setSafeMode(true);
                setState(() {});
                _success();
              },
              child: Text('Đồng ý', style: h4),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    loadShield();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [boxShadow],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(top: 5.h, left: 10.w),
                      duration: Duration(milliseconds: 100),
                      height: _logoHeight,
                      child: Image.asset(
                        'assets/images/safe-travel.png',
                      ),
                    ),
                  ),
                  SalomonBottomBar(
                    currentIndex: pageIndex,
                    onTap: (i) => setPageIndex(i),
                    items: [
                      /// Home
                      SalomonBottomBarItem(
                        icon: Icon(Icons.explore_outlined),
                        title: Text("Khám phá"),
                        selectedColor: kPrimaryColor,
                      ),

                      /// Likes
                      SalomonBottomBarItem(
                        icon: iconShield,
                        title: Text("Chế độ an toàn"),
                        selectedColor: kPrimaryColor,
                      ),

                      /// Search
                      SalomonBottomBarItem(
                        icon: Icon(Icons.history),
                        title: Text("Lịch sử đặt tour"),
                        selectedColor: kPrimaryColor,
                      ),

                      /// Profile
                      SalomonBottomBarItem(
                        icon: Icon(Icons.person_outline),
                        title: Text("Tài khoản"),
                        selectedColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: pageList[pageIndex],
              // IndexedStack(
              // children: pageList,
              // index: pageIndex,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
