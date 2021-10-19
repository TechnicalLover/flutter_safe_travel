import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/page/constants.dart';
import 'package:safetravel/screens/profile/profile_screen.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

class AccountPage extends StatefulWidget {
  const AccountPage(this.setVisibleAppbar, {Key? key}) : super(key: key);

  final Function setVisibleAppbar;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final ScrollController _scrollController = ScrollController();

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
        child: Container(
          margin: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 30.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/images/av1.png'),
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
                              'Đào Phương Nam',
                              style: h2b,
                            ),
                            Text(
                              'Xem thông tin của bạn',
                              style: h4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                      child: squareButton(const Icon(Icons.people), 'Bạn bè')),
                  Expanded(
                      child: squareButton(const Icon(Icons.groups), 'Nhóm')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child:
                          squareButton(const Icon(Icons.favorite), 'Đã thích')),
                  Expanded(
                      child:
                          squareButton(const Icon(Icons.reviews), 'Đánh giá')),
                ],
              ),
              moreButton('Xem thêm', () {}),
              const Divider(),
              logoutButton('Đăng xuất', () {}),
            ],
          ),
        ),
      ),
    );
  }

  Container squareButton(Icon icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        boxShadow: [boxShadowDetail],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            width: 15.w,
          ),
          Text(title, style: h3b),
        ],
      ),
    );
  }

  Widget logoutButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      child: RawMaterialButton(
        fillColor: Colors.white70,
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
}
