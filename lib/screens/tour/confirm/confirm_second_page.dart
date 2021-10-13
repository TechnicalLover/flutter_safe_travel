import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safetravel/utilities/constants.dart';

import 'confirm_constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
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
                    Row(
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
                        Text('2 550 000 VNĐ', style: h3),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
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
                        Text('1 400 000 VNĐ', style: h3),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
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
                        Text('500 000 VNĐ', style: h3),
                      ],
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
                      '4 450 000 VNĐ',
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
                  '$value',
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
}
