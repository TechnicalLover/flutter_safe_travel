import 'package:flutter/material.dart';
import 'package:safetravel/screens/main_screen.dart';
import 'package:safetravel/utilities/constants.dart';

class QRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Code'),
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
          child: Column(
            children: [
              Image.network(
                  'https://vi.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png'),
              RaisedButton(
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ))
                },
                child: Text(
                  'Trở về trang chủ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                color: Colors.blueAccent,
              )
            ],
          ),
        ));
  }
}
