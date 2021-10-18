import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safetravel/screens/tour/confirm/confirm_second_page.dart';
import 'package:safetravel/screens/tour/confirm/confirm_sucess.dart';
import 'package:safetravel/screens/tour/confirm/confirm_third_page.dart';
import 'package:safetravel/screens/tour/confirm/credit_cards_page.dart';
import 'package:safetravel/utilities/constants.dart';

import '../../main_screen.dart';
import 'confirm_constants.dart';
import 'confirm_first_page.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  final PageController _pageController = PageController();
  final int steps = 4;
  final title = [
    'Thông tin liên hệ',
    'Hành khách',
    'Hóa đơn',
    'Thanh toán',
    'Thanh toán',
  ];
  final indicators = [false, false, false, false];

  int _currentIndex = 0;
  int _status = 0;
  bool _isSuccess = false;

  late FirstPage firstPage;
  late SecondPage secondPage;
  late ThirdPage thirdPage;
  late CreditCardsPage creditCardsPage;

  void setStatus(int status) {
    if (status == 2) _isSuccess = true;
    setState(() {
      _status = status;
    });
  }

  @override
  void initState() {
    super.initState();
    firstPage = const FirstPage();
    secondPage = const SecondPage();
    thirdPage = const ThirdPage();
    creditCardsPage = const CreditCardsPage();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    // const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
        height: 85,
        alignment: Alignment.center,
        child: Text(
          title[_currentIndex],
          style: h2b,
        ),
      ),
    );
  }

  Expanded mainContent() {
    Widget pageContent = const SizedBox();
    switch (_currentIndex) {
      case 0:
        pageContent = firstPage;
        break;
      case 1:
        pageContent = secondPage;
        break;
      case 2:
        pageContent = thirdPage;
        break;
      case 3:
        pageContent = creditCardsPage;
        break;
      case 4:
        pageContent = successPage();
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

  ConfirmSucess successPage() {
    if (!_isSuccess) setStatus(1);
    return ConfirmSucess(setStatus);
  }

  Widget footer() {
    Widget result = const SizedBox();
    if (_status == 0) {
      result = Row(
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
                if (_currentIndex < steps) _currentIndex++;
                if (_currentIndex > 0) indicators[_currentIndex - 1] = true;
              });
            },
          ),
        ],
      );
    } else if (_status == 2) {
      result = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          homeButton(
            'Trở về trang chủ',
            () {
              setState(
                () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => MainScreen(),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
              );
            },
          ),
        ],
      );
    }
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: result,
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
              style: h3b.copyWith(
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
              style: h3b.copyWith(
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

  Widget homeButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h3b.copyWith(
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

  Widget indicator(int index, int status) {
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
      width: 15,
      height: 15,
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
    if (indicators[index]) status = 0;
    Widget container;
    switch (status) {
      case 0:
        container = checkedContainer;
        break;
      case 1:
        container = currentContainer;
        break;
      case 2:
        container = uncheckedContainer;
        break;
      default:
        container = checkedContainer;
    }
    Widget result;
    if (index == _currentIndex) {
      result = Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 17,
            width: 17,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          container,
        ],
      );
    } else {
      result = container;
    }
    if (index > 0) {
      double tailWidth = 40;
      if (status == 0 || status == 1) tailWidth = 35;
      //if (index == steps - 1 && _currentIndex == steps) tailWidth = 30;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: tailWidth,
            height: 2,
            decoration: BoxDecoration(
              color:
                  status != 0 && status != 1 ? kPrimaryColor05 : kPrimaryColor,
              boxShadow: [boxShadow],
            ),
          ),
          result,
        ],
      );
    } else {
      return result;
    }
  }
  //end
}
