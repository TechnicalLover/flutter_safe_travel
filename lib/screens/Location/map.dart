import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapCovid extends StatelessWidget {
  const MapCovid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://bando.tphcm.gov.vn/ogis',
        ),
      ),
    );
  }
}
