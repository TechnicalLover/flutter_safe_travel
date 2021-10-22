import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:safetravel/screens/page/data.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/details_screen/my_tour_detail.dart';
import 'dart:math';

import 'package:safetravel/utilities/constants.dart';

class Transaction {
  String name;
  double point;
  int createdMillis;

  Transaction(
      {required this.name, required this.point, required this.createdMillis});
}

List<Transaction> transactions = List.generate(20, (index) {
  Random random = new Random();
  bool isRedeem = random.nextBool();
  int index = random.nextInt(10);
  String name = tourData[index].title;
  double point = tourData[index].price;
  return Transaction(
      name: name,
      point: point,
      createdMillis: DateTime.now()
          .add(Duration(
            days: -random.nextInt(365),
            hours: -random.nextInt(23),
            minutes: -random.nextInt(59),
          ))
          .millisecondsSinceEpoch);
})
  ..sort((v1, v2) => v2.createdMillis - v1.createdMillis);

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({Key? key}) : super(key: key);

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  bool groupValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: buildListView(),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TravelDetailPage(),
        )),
      ),
    );
  }

  ListView buildListView() {
    String? prevDay;

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        Transaction transaction = transactions[index];
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(transaction.createdMillis);
        //String dateString = DateFormat("EEE, MMM d, y").format(date);
        initializeDateFormatting();
        var format = DateFormat.yMd('vi');
        var dateString = format.format(date);
        String today = format.format(DateTime.now());
        String yesterday =
            format.format(DateTime.now().add(const Duration(days: -1)));

        if (today == dateString) {
          dateString = "Hôm nay";
        } else if (yesterday == dateString) {
          dateString = "Hôm qua";
        }

        bool showHeader = prevDay != dateString;
        prevDay = dateString;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            showHeader
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      dateString,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                : Offstage(),
            buildItem(index, context, date, transaction),
          ],
        );
      },
    );
  }

  Widget buildItem(
      int index, BuildContext context, DateTime date, Transaction transaction) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(width: 20),
          buildLine(index, context),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            // color: Theme.of(context).accentColor,
            child: Text(
              DateFormat("hh:mm a").format(date),
              style: TextStyle(
                // color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: buildItemInfo(index, transaction, context),
          ),
        ],
      ),
    );
  }

  void _cancel() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Text('Lý do huỷ', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quý khách vui lòng chọn lí do muốn huỷ tour'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: groupValue,
                  onChanged: (value) => {},
                ),
                Text('Tìm được tour khác ưng ý hơn'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: groupValue,
                  onChanged: (value) => {},
                ),
                Text('Thay đổi lịch'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: false,
                  groupValue: groupValue,
                  onChanged: (value) => {},
                ),
                Text('Khác'),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Nhập lí do khác',
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text('Huỷ', style: h4),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              _pushSuccess();
            },
            child: Text('Đồng ý', style: h4),
          ),
        ],
      ),
    );
  }

  void _pushSuccess() async {
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
            Text('Huỷ thành công'),
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

  Card buildItemInfo(int index, Transaction transaction, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10.h, 10.w, 10.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: index > 2
                  ? [goodGray, goodGray]
                  : [Colors.green, Colors.teal]),
        ),
        child: Row(
          children: <Widget>[
            Wrap(
              children: [
                IconButton(
                    onPressed: () => {print("press")},
                    icon: Icon(
                      Icons.qr_code,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    NumberFormat("###,###,### đ").format(transaction.point),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            index <= 2
                ? Container(
                    child: buildSecondaryButton('Huỷ', () {
                      _cancel();
                    }),
                  )
                : SizedBox(
                    width: 100.w,
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildSecondaryButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Text(
          text,
          style: h5.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 2.0, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  Container buildLine(int index, BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 2,
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor, shape: BoxShape.circle),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 2,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
