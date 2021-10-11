import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:safetravel/utilities/constants.dart';

import 'confirm_constants.dart';

class ConfirmSucess extends StatefulWidget {
  const ConfirmSucess({Key? key}) : super(key: key);

  @override
  _ConfirmSucessState createState() => _ConfirmSucessState();
}

class _ConfirmSucessState extends State<ConfirmSucess> {
  var _isSuccess = true;
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
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
            style: h2nor,
          ),
        ),
        Visibility(
          visible: !_isSuccess,
          child: Text(
            'Thanh toán thành công!',
            style: h2,
          ),
        )
      ],
    );
  }
}
