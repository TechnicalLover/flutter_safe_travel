import 'package:flutter/material.dart';
import 'package:safetravel/utilities/constants.dart';

class QRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
              'https://vi.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png'),
          Text('Your QR code to check-in'),
        ],
      ),
    );
  }
}
