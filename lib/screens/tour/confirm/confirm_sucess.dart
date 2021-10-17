import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:safetravel/utilities/constants.dart';

import 'confirm_constants.dart';

class ConfirmSucess extends StatefulWidget {
  Function setStatus;
  ConfirmSucess(this.setStatus, {Key? key}) : super(key: key);

  @override
  _ConfirmSucessState createState() => _ConfirmSucessState();
}

class _ConfirmSucessState extends State<ConfirmSucess> {
  var _isSuccess = true;
  String qrUrl =
      'https://vi.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png';
  @override
  void initState() {
    super.initState(); //when this route starts, it will execute this code
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        setState(
          () {
            _isSuccess =
                false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
          },
        );
        widget.setStatus(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.15),
                      offset: const Offset(-2, 2),
                      blurRadius: 50,
                    )
                  ],
                  shape: BoxShape.circle,
                ),
              ),
              Visibility(
                visible: _isSuccess,
                child: Lottie.asset(
                  'assets/icons/world-locations.json',
                  repeat: true,
                ),
              ),
              Visibility(
                visible: !_isSuccess,
                child: Lottie.asset(
                  'assets/icons/success-animation.json',
                  height: 130,
                  repeat: false,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isSuccess,
          child: Text(
            'Đang thực hiện thanh toán...',
            style: h2,
          ),
        ),
        Visibility(
          visible: !_isSuccess,
          child: Text(
            'Thanh toán thành công!',
            style: h2b,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: !_isSuccess,
          child: Column(
            children: [
              SizedBox(
                width: size.width / 2.5,
                child: Image.network(qrUrl),
              ),
              Text(
                'Checkin QR Code',
                style: h3.copyWith(color: goodGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
