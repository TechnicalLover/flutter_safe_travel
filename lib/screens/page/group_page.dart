import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/page/constants.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Nhóm', style: h3.copyWith(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            buildGroupCard('assets/images/gr1.png', 'Hội bạn cấp 3', [
              buildCircleAvatar('assets/images/av6.jpeg'),
              buildCircleAvatar('assets/images/av7.jpeg'),
              buildCircleAvatar('assets/images/av8.jpeg'),
              buildCircleAvatar('assets/images/av9.jpeg'),
              buildCircleAvatar('assets/images/av10.jpeg'),
              buildCircleAvatar('assets/images/av11.jpeg'),
              buildAddCircle(),
            ]),
            buildGroupCard('assets/images/gr2.jpeg', 'HCI201 - Nhóm 5', [
              buildCircleAvatar('assets/images/av1.png'),
              buildCircleAvatar('assets/images/av2.jpeg'),
              buildCircleAvatar('assets/images/av3.jpeg'),
              buildCircleAvatar('assets/images/av4.jpeg'),
              buildCircleAvatar('assets/images/av5.jpeg'),
              buildAddCircle(),
            ]),
            buildGroupCard('assets/images/gr3.jpeg', 'Nhóm siêu cấp vô địch', [
              buildCircleAvatar('assets/images/av17.jpeg'),
              buildCircleAvatar('assets/images/av16.jpeg'),
              buildCircleAvatar('assets/images/av15.jpeg'),
              buildCircleAvatar('assets/images/av14.jpeg'),
              buildCircleAvatar('assets/images/av13.jpeg'),
              buildAddCircle(),
            ]),
            buildGroupCard('assets/images/gr4.jpeg', 'Đam mê đá bóng', [
              buildCircleAvatar('assets/images/av3.jpeg'),
              buildCircleAvatar('assets/images/av11.jpeg'),
              buildCircleAvatar('assets/images/av9.jpeg'),
              buildCircleAvatar('assets/images/av5.jpeg'),
              buildCircleAvatar('assets/images/av8.jpeg'),
              buildCircleAvatar('assets/images/av9.jpeg'),
              buildCircleAvatar('assets/images/av12.jpeg'),
              buildCircleAvatar('assets/images/av6.jpeg'),
              buildAddCircle(),
            ]),
            buildGroupCard('assets/images/gr5.png', 'Yêu thích cây cảnh', [
              buildCircleAvatar('assets/images/av4.jpeg'),
              buildCircleAvatar('assets/images/av14.jpeg'),
              buildCircleAvatar('assets/images/av16.jpeg'),
              buildCircleAvatar('assets/images/av1.png'),
              buildAddCircle(),
            ]),
            moreButton('Tạo nhóm mới', () {}),
          ],
        ),
      ),
    );
  }

  Widget buildGroupCard(String groupImg, String title, List<Widget> list) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 10.h),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
                boxShadow: [boxShadowDetail],
              ),
              child: Column(
                children: [
                  Row(
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
                                image: AssetImage(groupImg),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(title, style: h4b),
                        ],
                      ),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                  Row(
                    children: list,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCircleAvatar(String img) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [boxShadowAvatar],
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(img),
        ),
      ),
    );
  }

  Container buildAddCircle() {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [boxShadowAvatar],
        color: Colors.white,
      ),
      child: const Icon(
        Icons.add,
        size: 15,
      ),
    );
  }

  Widget moreButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      width: 200.w,
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
