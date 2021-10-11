import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safetravel/utilities/constants.dart';

import 'confirm_constants.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  final PageController _pageController = PageController();
  final int steps = 3;
  final title = [
    'Thông tin liên hệ',
    'Số lượng hành khách',
    'Hóa đơn',
  ];

  int _genderValue = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(size),
            body(size),
          ],
        ),
      ),
    );
  }

  SafeArea appBar(Size size) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.12,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: steps,
          itemBuilder: (context, index) {
            if (index < _currentIndex) {
              return indicator(index, 0);
            } else if (index == _currentIndex) {
              return indicator(index, 1);
            } else {
              return indicator(index, 2);
            }
          },
        ),
      ),
    );
  }

  Container body(Size size) {
    return Container(
      height: size.height * 0.83,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [boxShadow],
      ),
      child: Column(
        children: [
          header(),
          mainContent(),
          footer(),
        ],
      ),
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 100,
        alignment: Alignment.centerLeft,
        child: Text(
          title[_currentIndex],
          style: h1,
        ),
      ),
    );
  }

  Expanded mainContent() {
    Widget pageContent = const SizedBox();
    switch (_currentIndex) {
      case 0:
        pageContent = firstPage();
        break;
      case 1:
        pageContent = secondPage();
        break;
      case 2:
        pageContent = thirdPage();
        break;
    }
    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: steps,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: pageContent,
          );
        },
      ),
    );
  }

  SizedBox footer() {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentIndex > 0
                ? previousButton(
                    'Trở lại',
                    () {
                      setState(() {
                        if (_currentIndex > 0) _currentIndex--;
                      });
                    },
                  )
                : const SizedBox(),
            nextButton(
              'Tiếp tục',
              () {
                setState(() {
                  if (_currentIndex < steps - 1) _currentIndex++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding firstPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        child: Column(
          children: [
            textFiled(Icon(Icons.account_circle), 'Họ và tên'),
            const SizedBox(
              height: 15,
            ),
            genderRadio(),
            textFiled(Icon(Icons.mail_outline), 'Email'),
            textFiled(Icon(Icons.phone), 'Số điện thoại'),
            textFiled(Icon(Icons.home), 'Địa chỉ'),
          ],
        ),
      ),
    );
  }

  Row genderRadio() {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Image.asset('assets/icons/gender.png'),
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

  TextFormField textFiled(Icon icon, String text) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: text,
        //labelStyle: formStyle,
      ),
    );
  }

  Padding secondPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          peopleCounterContainer(),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Chi tiết giá',
                  style: h2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Người lớn ',
                              style: h3nor,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'x 2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Text('200 000 VNĐ', style: h3),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Trẻ con ',
                              style: h3nor,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'x 2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Text('100 000 VNĐ', style: h3),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Trẻ sơ sinh ',
                              style: h3nor,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'x 1',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Text('50 000 VNĐ', style: h3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 1,
                color: goodBlack,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tạm tính',
                      style: h2,
                    ),
                    Text(
                      '350 000 VNĐ',
                      style: h2.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
        ),
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
        ),
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
        ),
      ],
    );
  }

  Padding thirdPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text('Hello world'),
    );
  }

  Widget peopleCounter(Widget icon, String title, String hint) {
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
                    style: h3nor,
                  ),
                  Text(
                    hint,
                    style: h4nor.copyWith(
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
                  '1',
                  style: h2,
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

  Widget previousButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      width: 125,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chevron_left,
              size: 15,
              color: goodGray,
            ),
            Text(
              text,
              style: h3.copyWith(
                color: goodGray,
                fontWeight: FontWeight.w500,
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

  Widget nextButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      width: 125,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.chevron_right, size: 15),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget indicator(int hasTail, int status) {
    var checkedContainer = Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
        boxShadow: [boxShadow],
      ),
      child: const Icon(
        Icons.done,
        size: 10,
        color: Colors.white,
      ),
    );
    var currentContainer = Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [boxShadow],
        color: Colors.white,
        border: Border.all(width: 2, color: kPrimaryColor),
      ),
    );
    var uncheckedContainer = Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [boxShadow],
        color: whiteColor05,
        border: Border.all(width: 2, color: kPrimaryColor05),
      ),
    );
    Container container;
    switch (status) {
      case 0:
        container = checkedContainer;
        break;
      case 1:
        container = currentContainer;
        break;
      default:
        container = uncheckedContainer;
    }
    if (hasTail > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: status != 0 && status != 1 ? 40 : 35,
            height: 2,
            decoration: BoxDecoration(
              color:
                  status != 0 && status != 1 ? kPrimaryColor05 : kPrimaryColor,
              boxShadow: [boxShadow],
            ),
          ),
          container,
        ],
      );
    } else {
      return container;
    }
  }
  //end
}
