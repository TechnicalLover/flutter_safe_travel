import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:safetravel/utilities/constants.dart';

import 'confirm/confirm.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class TourDateStartScreen extends StatefulWidget {
  TourDateStartScreen({Key? key}) : super(key: key);

  @override
  _TourDateStartScreenState createState() => _TourDateStartScreenState();
}

var _isSelected = [
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

var _isSelectedDay = [
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
var _days = [1, 4, 7, 10, 13, 16, 19, 22, 25];

var _months = [10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9];
var _year = [2021, 2022];
var _yearIndex = [0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1];
var selectMonth = 10;
var selectYear = 2021;

void setSelectedItem(int index) {
  for (int i = 0; i < 12; i++) {
    _isSelected[i] = false;
  }
  _isSelected[index] = true;
  selectMonth = _months[index];
  selectYear = _year[_yearIndex[index]];
}

void setSelectedDay(int index) {
  for (int i = 0; i < 9; i++) {
    _isSelectedDay[i] = false;
  }
  _isSelectedDay[index] = true;
}

class _TourDateStartScreenState extends State<TourDateStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            title: Text("TOUR DATE"),
            backgroundColor: kPrimaryColor,
          ),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                      width: double.infinity,
                      height: 1000,
                      margin: const EdgeInsets.only(right: 5, left: 5),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Chọn tháng khởi hành",
                                style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 26,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Divider(
                            height: 40,
                            thickness: 1,
                            color: kSecondaryColor,
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(0);
                                            });
                                          },
                                          child: Text(
                                            _months[0].toString() +
                                                "/" +
                                                _year[0].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[0]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(1);
                                            });
                                          },
                                          child: Text(
                                            _months[1].toString() +
                                                "/" +
                                                _year[0].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[1]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(2);
                                            });
                                          },
                                          child: Text(
                                            _months[2].toString() +
                                                "/" +
                                                _year[0].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[2]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(3);
                                            });
                                          },
                                          child: Text(
                                            _months[3].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[3]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer()
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(4);
                                            });
                                          },
                                          child: Text(
                                            _months[4].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[4]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(5);
                                            });
                                          },
                                          child: Text(
                                            _months[5].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[5]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(6);
                                            });
                                          },
                                          child: Text(
                                            _months[6].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[6]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(7);
                                            });
                                          },
                                          child: Text(
                                            _months[7].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[7]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer()
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(8);
                                            });
                                          },
                                          child: Text(
                                            _months[8].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[8]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(9);
                                            });
                                          },
                                          child: Text(
                                            _months[9].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[9]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(10);
                                            });
                                          },
                                          child: Text(
                                            _months[10].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[10]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer(),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              setSelectedItem(11);
                                            });
                                          },
                                          child: Text(
                                            _months[11].toString() +
                                                "/" +
                                                _year[1].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: _isSelected[11]
                                                    ? kSecondaryColor
                                                    : Colors.black),
                                          )),
                                      Spacer()
                                    ],
                                  ),
                                ],
                              )),
                          Divider(
                            height: 50,
                            thickness: 20,
                            color: Color(0x1D1DADB0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Lịch khởi hành sắp tới",
                                style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 26,
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Divider(
                            height: 40,
                            thickness: 1,
                            color: kSecondaryColor,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(0);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[0].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[0] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[0]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(1);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[1].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[1] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[1]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(2);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[2].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[2] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[2]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(3);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[3].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[3] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[3]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(4);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[4].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[4] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[4]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(5);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[5].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[5] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[5]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(6);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[6].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[6] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[6]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(7);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[7].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[7] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[7]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      setSelectedDay(8);
                                    });
                                  },
                                  child: Text(
                                    "Khởi hành " +
                                        _days[8].toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString() +
                                        "----- Kết thúc " +
                                        (_days[8] + 3).toString() +
                                        "/" +
                                        selectMonth.toString() +
                                        "/" +
                                        selectYear.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: _isSelectedDay[8]
                                            ? kSecondaryColor
                                            : Colors.black),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Confirm()))
                            },
                            child: Text(
                              "Tiếp tục",
                              style: TextStyle(fontSize: 30),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              elevation: 0,
                              minimumSize: Size(150, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)),
                              ),
                            ), // double.infinity is the width and 30 is the height
                          ),
                        ],
                      ))))
        ],
      ),
    );
  }
}
