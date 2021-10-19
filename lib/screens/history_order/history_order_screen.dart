import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:safetravel/screens/page/data.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/details_screen/my_tour_detail.dart';
import 'dart:math';

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

  Card buildItemInfo(int index, Transaction transaction, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
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
              child: Container(
                child: Text(
                  transaction.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                NumberFormat("###,###,### đ").format(transaction.point),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
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
