import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safetravel/utilities/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool selected = false;
  bool selected2 = false;
  bool ngay1 = false;
  bool ngay2 = false;
  bool ngay3 = false;
  bool ngay4 = false;
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    void _presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      });
      print('...');
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Bạn muốn đi đâu?'),
        actions: <Widget>[
          Center(
            child: Text(
              'Tạo lại',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.tour),
                    border: InputBorder.none,
                    hintText: 'Tên tour hoặc Nơi khỏi hành'),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _presentDatePicker(),
                    ),
                    border: InputBorder.none,
                    hintText: _selectedDate == null
                        ? 'Ngày khởi hành'
                        : '${DateFormat.yMd().format(_selectedDate!)}'),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mode_standby_sharp),
                    border: InputBorder.none,
                    hintText: 'Nơi khỏi hành'),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    border: InputBorder.none,
                    hintText: 'Nơi đến'),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.filter_alt_outlined),
                    border: InputBorder.none,
                    hintText: 'Tất cả'),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.travel_explore_outlined),
                    border: InputBorder.none,
                    hintText: 'Chủ đề'),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Loại tour",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FilterChip(
                      label: Text("Tour nội địa"),
                      selected: selected,
                      onSelected: (bool value) {
                        selected = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    FilterChip(
                      label: Text("Tour quốc tế"),
                      selected: selected2,
                      onSelected: (bool value) {
                        selected2 = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tổng số ngày đi tour",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FilterChip(
                      label: Text("1 ngày"),
                      selected: ngay1,
                      onSelected: (bool value) {
                        ngay1 = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FilterChip(
                      label: Text("2 ngày"),
                      selected: ngay2,
                      onSelected: (bool value) {
                        ngay2 = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FilterChip(
                      label: Text("3 ngày"),
                      selected: ngay3,
                      onSelected: (bool value) {
                        ngay3 = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 15),
                    FilterChip(
                      label: Text("4 ngày"),
                      selected: ngay4,
                      onSelected: (bool value) {
                        ngay4 = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Nhập số ngày đi",
                            fillColor: Colors.grey[200]),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              ElevatedButton(
                  onPressed: ()=> {},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Tìm kiếm tour')),
            ],
          ),
        ),
      ),
    );
  }
}
