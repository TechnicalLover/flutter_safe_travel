import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safetravel/screens/page/constants.dart';
import 'package:safetravel/utilities/constants.dart';

import 'confirm_constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectIndex = 0;
  bool isSingle = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isSingle,
                      onChanged: (value) {
                        setState(() {
                          isSingle = value as bool;
                        });
                      },
                    ),
                    Text(
                      'Đi 1 mình',
                      style: h3b,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: isSingle,
                      onChanged: (value) {
                        setState(() {
                          isSingle = value as bool;
                        });
                      },
                    ),
                    Text('Đi theo nhóm', style: h3b),
                  ],
                ),
              ),
              Visibility(
                visible: !isSingle,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 0;
                        });
                      },
                      child: buildGroupCard(selectIndex == 0,
                          'assets/images/gr1.png', 'Hội bạn cấp 3', [
                        buildCircleAvatar('assets/images/av6.jpeg'),
                        buildCircleAvatar('assets/images/av7.jpeg'),
                        buildCircleAvatar('assets/images/av8.jpeg'),
                        buildCircleAvatar('assets/images/av9.jpeg'),
                        buildCircleAvatar('assets/images/av10.jpeg'),
                        buildCircleAvatar('assets/images/av11.jpeg'),
                        buildAddCircle(),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 1;
                        });
                      },
                      child: buildGroupCard(selectIndex == 1,
                          'assets/images/gr2.jpeg', 'HCI201 - Nhóm 5', [
                        buildCircleAvatar('assets/images/av1.png'),
                        buildCircleAvatar('assets/images/av2.jpeg'),
                        buildCircleAvatar('assets/images/av3.jpeg'),
                        buildCircleAvatar('assets/images/av4.jpeg'),
                        buildCircleAvatar('assets/images/av5.jpeg'),
                        buildAddCircle(),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 2;
                        });
                      },
                      child: buildGroupCard(selectIndex == 2,
                          'assets/images/gr3.jpeg', 'Nhóm siêu cấp vô địch', [
                        buildCircleAvatar('assets/images/av17.jpeg'),
                        buildCircleAvatar('assets/images/av16.jpeg'),
                        buildCircleAvatar('assets/images/av15.jpeg'),
                        buildCircleAvatar('assets/images/av14.jpeg'),
                        buildCircleAvatar('assets/images/av13.jpeg'),
                        buildAddCircle(),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 3;
                        });
                      },
                      child: buildGroupCard(selectIndex == 3,
                          'assets/images/gr4.jpeg', 'Đam mê đá bóng', [
                        buildCircleAvatar('assets/images/av3.jpeg'),
                        buildCircleAvatar('assets/images/av11.jpeg'),
                        buildCircleAvatar('assets/images/av9.jpeg'),
                        buildCircleAvatar('assets/images/av5.jpeg'),
                        buildCircleAvatar('assets/images/av8.jpeg'),
                        buildCircleAvatar('assets/images/av10.jpeg'),
                        buildCircleAvatar('assets/images/av12.jpeg'),
                        buildCircleAvatar('assets/images/av6.jpeg'),
                        buildAddCircle(),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 4;
                        });
                      },
                      child: buildGroupCard(selectIndex == 4,
                          'assets/images/gr5.png', 'Yêu thích cây cảnh', [
                        buildCircleAvatar('assets/images/av4.jpeg'),
                        buildCircleAvatar('assets/images/av14.jpeg'),
                        buildCircleAvatar('assets/images/av16.jpeg'),
                        buildCircleAvatar('assets/images/av1.png'),
                        buildAddCircle(),
                      ]),
                    ),
                    moreButton('Tạo nhóm mới', () {}),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGroupCard(
      bool isSelected, String groupImg, String title, List<Widget> list) {
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
                border: isSelected
                    ? Border.all(
                        width: 2,
                        color: kPrimaryColor,
                      )
                    : null,
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

  Widget peopleCounterContainer() {
    return Column(
      children: [
        peopleCounter(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: SvgPicture.asset(
                'assets/icons/adult.svg',
                allowDrawingOutsideViewBox: true,
              ),
            ),
            'Người lớn',
            '16+ tuổi',
            2),
        peopleCounter(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: SvgPicture.asset(
                'assets/icons/child.svg',
                allowDrawingOutsideViewBox: true,
              ),
            ),
            'Trẻ con',
            '2-15 tuổi',
            2),
        peopleCounter(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                'assets/icons/baby.svg',
                allowDrawingOutsideViewBox: true,
              ),
            ),
            'Trẻ sơ sinh',
            'Dưới 2 tuổi',
            1),
      ],
    );
  }

  Widget peopleCounter(Widget icon, String title, String hint, int value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: 30,
                child: icon,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: h3,
                  ),
                  Text(
                    hint,
                    style: h4.copyWith(
                      color: goodGray,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              roundButton(
                Icon(
                  Icons.remove_outlined,
                  size: 15,
                  color: goodGray,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 50,
                child: Text(
                  '$value',
                  style: h2b,
                ),
              ),
              roundButton(
                Icon(
                  Icons.add_outlined,
                  size: 15,
                  color: goodGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundButton(Icon icon) {
    return SizedBox(
      width: 30,
      height: 30,
      child: RawMaterialButton(
        onPressed: () {},
        fillColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon],
        ),
        shape: const CircleBorder(),
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
