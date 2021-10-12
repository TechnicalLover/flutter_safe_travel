import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/utilities/constants.dart';

class TicketScreen extends StatefulWidget {
  TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreen createState() => _TicketScreen();
}

class _TicketScreen extends State<TicketScreen> {
  String result = "Please scan the QR code or Barcode";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan().toString();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Vé & Chứng nhận ngừa Covid",
            style: h1.copyWith(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
          actions: [
            IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: _scanQR,
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 500,
              decoration: kBoxDecorationStyle,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.airplane_ticket,
                    size: 100,
                    color: kSecondaryColor,
                  ),
                  SizedBox(height: 30),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: kSecondaryColor,
                  ),
                  Text(
                    "QUÉT MÃ NÀY ĐỂ CHECKIN",
                    style: h1.copyWith(fontSize: 30, color: kSecondaryColor),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: kSecondaryColor,
                  ),
                  Container(
                    height: 220,
                    width: 220,
                    child: Image.network(
                        'https://vi.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png'),
                  ),
                  SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Thông tin vé",
                        style: h1.copyWith(color: kSecondaryColor),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Họ tên",
                              style: h2.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              "Dương Thanh Sang",
                              style: h2,
                            ),
                            Divider(
                              height: 40,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              "Mã tour",
                              style: h2.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              "T-052539050121-MZ1BGJ",
                              style: h2,
                            ),
                            Divider(
                              height: 40,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              "Ngày khởi hành",
                              style: h2.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              "27/10/2021",
                              style: h2,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 500,
              color: Colors.teal,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 30),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.white,
                  ),
                  Text(
                    "ĐÃ TIÊM 02 MŨI VẮC XIN",
                    style: h1.copyWith(fontSize: 30, color: Colors.white),
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                    color: Colors.white,
                  ),
                  Container(
                    height: 220,
                    width: 220,
                    child: Image.network(
                        'https://vi.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png'),
                  ),
                  SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Thông tin cá nhân",
                        style: h1.copyWith(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Họ tên",
                              style: h2.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              "Dương Thanh Sang",
                              style: h2,
                            ),
                            Divider(
                              height: 40,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              "Ngày sinh",
                              style: h2.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              "01/01/2000",
                              style: h2,
                            ),
                            Divider(
                              height: 40,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              "Số hộ chiếu/CMND/CCCD",
                              style: h2.copyWith(color: Colors.blueGrey),
                            ),
                            Text(
                              "323421653",
                              style: h2,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
