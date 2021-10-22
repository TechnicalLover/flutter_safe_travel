import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/page/model.dart';
import 'package:safetravel/utilities/constants.dart';
import 'confirm/confirm.dart';
import 'confirm/confirm_constants.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class TourDateStartScreen extends StatefulWidget {
  final TourModel model;
  TourDateStartScreen(this.model, {Key? key}) : super(key: key);

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
  late TourModel model;
  var selectTime = 0;

  void setSelectedTime(int index) {
    setState(() {
      selectTime = index;
    });
  }

  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn ngày", style: h2b.copyWith(color: Colors.white)),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 5, left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [cardShadow],
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Chọn giờ khởi hành",
                                      style: h3b.copyWith(color: kPrimaryColor),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 40,
                                  thickness: 1,
                                ),
                                Card(
                                    elevation: 0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  setSelectedTime(0);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    minimumSize: Size(110, 35)),
                                                child: Text(
                                                  '07:00',
                                                  style: h4.copyWith(
                                                    color: selectTime == 0
                                                        ? kPrimaryColor
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  setSelectedTime(1);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    minimumSize: Size(110, 35)),
                                                child: Text(
                                                  '10:00',
                                                  style: h4.copyWith(
                                                    color: selectTime == 1
                                                        ? kPrimaryColor
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  setSelectedTime(2);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    minimumSize: Size(110, 35)),
                                                child: Text(
                                                  '15:00',
                                                  style: h4.copyWith(
                                                    color: selectTime == 2
                                                        ? kPrimaryColor
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  setSelectedTime(3);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    minimumSize: Size(110, 35)),
                                                child: Text(
                                                  '18:00',
                                                  style: h4.copyWith(
                                                    color: selectTime == 3
                                                        ? kPrimaryColor
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [cardShadow],
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Chọn tháng khởi hành",
                                      style: h3b.copyWith(color: kPrimaryColor),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 40,
                                  thickness: 1,
                                ),
                                Card(
                                    elevation: 0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(0);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(100, 35)),
                                                  child: monthSelect(0, 0)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    setSelectedItem(1);
                                                  });
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    minimumSize: Size(100, 35)),
                                                child: monthSelect(1, 0),
                                              ),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(2);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(100, 35)),
                                                  child: monthSelect(2, 0)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(3);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(3, 1)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(4);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(4, 1)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(5);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(5, 1)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(6);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(6, 1)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(7);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(7, 1)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(8);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(8, 1)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(9);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(9, 1)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(10);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(10, 1)),
                                            ),
                                            Expanded(
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      setSelectedItem(11);
                                                    });
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          minimumSize:
                                                              Size(110, 35)),
                                                  child: monthSelect(11, 1)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [cardShadow],
                            ),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lịch khởi hành sắp tới",
                                      style: h3b.copyWith(color: kPrimaryColor),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 40,
                                  thickness: 1,
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
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(0)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(1);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(1)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(2);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(2)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(3);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(3)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(4);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(4)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(5);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(5)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(6);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(6)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(7);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(7)),
                                    OutlinedButton(
                                        onPressed: () {
                                          setState(() {
                                            setSelectedDay(8);
                                          });
                                        },
                                        style: OutlinedButton.styleFrom(
                                            minimumSize: Size(460, 35)),
                                        child: daySelect(8)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          nextButton(
                            'Tiếp tục',
                            () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Confirm(model)));
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ))))
        ],
      ),
    );
  }

  Widget daySelect(index) {
    String start = "Khởi hành " +
        _days[index].toString().padLeft(2, '0') +
        "/" +
        selectMonth.toString().padLeft(2, '0') +
        "/" +
        selectYear.toString();
    String end = "Kết thúc " +
        (_days[index] + 3).toString().padLeft(2, '0') +
        "/" +
        selectMonth.toString().padLeft(2, '0') +
        "/" +
        selectYear.toString();
    Color color = _isSelectedDay[index] ? kSecondaryColor : Colors.black;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 41,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              start,
              style: h2.copyWith(
                color: color,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Icon(Icons.arrow_forward_ios_rounded, color: color, size: 15),
        ),
        Expanded(
          flex: 39,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              end,
              style: h2.copyWith(
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget monthSelect(indexMonth, indexYear) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        _months[indexMonth].toString().padLeft(2, '0') +
            "/" +
            _year[indexYear].toString().padLeft(2, '0'),
        style: h2.copyWith(
          color: _isSelected[indexMonth] ? kSecondaryColor : Colors.black,
        ),
      ),
    );
  }

  BoxShadow cardShadow = BoxShadow(
    color: goodGray.withOpacity(0.2),
    offset: const Offset(-1, 8),
    blurRadius: 20,
  );

  Widget nextButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      width: 115.h,
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
}
