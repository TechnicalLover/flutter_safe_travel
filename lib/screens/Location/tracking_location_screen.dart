import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetravel/screens/Location/water_ripple.dart';

import 'package:safetravel/utilities/constants.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: public_member_api_docs

class TrackingLocationScreen extends StatefulWidget {
  TrackingLocationScreen({Key? key}) : super(key: key);

  @override
  _TrackingLocationScreenState createState() => _TrackingLocationScreenState();
}

class _TrackingLocationScreenState extends State<TrackingLocationScreen> {
  bool isSwitched = false;
  Color waterRippleColor = Colors.blueGrey;
  String status = "Turn on for check";
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        waterRippleColor = kPrimaryColor;
        status = "You are safe";
        startTimer();
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        waterRippleColor = Colors.blueGrey;
        status = "Turn on for check";
        _timer.cancel();
      });

      print('Switch Button is OFF');
    }
  }

  late Timer _timer;
  int _start = 5;
  bool statusSafe = true;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          if (statusSafe) {
            waterRippleColor = Colors.red;
            status = "There is danger near you";
          } else {
            waterRippleColor = kPrimaryColor;
            status = "You are safe";
          }
          statusSafe = !statusSafe;
          _start = 5;
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  bool bluetoothStatus = true;
  bool locationStatus = true;

  Widget _buildHeaderTrackingLocation() {
    return AppBar(
      leading: BackButton(
          onPressed: () => {Navigator.pop(context)}, color: kPrimaryColor),
      title: Text("Kiểm tra vùng an toàn"),
      elevation: 0,
      actions: [
        Switch(
          activeColor: kPrimaryColor,
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.blueGrey,
          inactiveTrackColor: Colors.grey,
          value: isSwitched,
          onChanged: toggleSwitch,
        )
      ],
      backgroundColor: Colors.white,
      foregroundColor: kPrimaryColor,
    );
  }

  Widget _buildFooterTrackingLocation() {
    return Card(
        elevation: 0,
        child: AbsorbPointer(
            absorbing: !isSwitched,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        bluetoothStatus = !bluetoothStatus;
                      });
                    },
                    icon: Icon(
                        bluetoothStatus
                            ? Icons.bluetooth
                            : Icons.bluetooth_disabled,
                        size: 50,
                        color: waterRippleColor)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        locationStatus = !locationStatus;
                      });
                    },
                    icon: Icon(
                      locationStatus ? Icons.location_on : Icons.location_off,
                      size: 50,
                      color: waterRippleColor,
                    )),
                Spacer()
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildHeaderTrackingLocation(),
              Spacer(),
              Container(
                  height: 300,
                  width: 300,
                  child: WaterRipple(3, waterRippleColor),
                  key: Key("test")),
              Spacer(),
              Text(status,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: waterRippleColor, fontSize: 30)),
              Spacer(),
              _buildFooterTrackingLocation(),
              Spacer()
            ]));
  }
}
