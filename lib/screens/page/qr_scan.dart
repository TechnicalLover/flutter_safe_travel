import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/main_screen.dart';
import 'package:safetravel/screens/start_page/covid_confirm_page.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/covid-cert.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();

/*
    Future.delayed(const Duration(milliseconds: 5000), () {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/shield.png',
                height: 20.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text('Xác nhận thành công', style: h3),
            ],
          ),
          content: Text('Xác nhận tiêm 2 mũi thành công', style: h4),
          actions: <Widget>[
            TextButton(
              onPressed: () => _continue(),
              child: Text('Tiếp tục', style: h4),
            ),
          ],
        ),
      );
    });
    */

    super.initState();
  }

  _setSafe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSafe', true);
  }

  _continue() {
    _setSafe();
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => MainScreen(
          register: true,
        ),
      ),
      (route) => false, //if you want to disable back feature set to false
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Column(
            children: [
              Expanded(
                flex: 28,
                child: Container(
                  width: 1.sw,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Expanded(
                flex: 32,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    Container(
                      width: 0.28.sh,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/scan.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 40,
                child: Container(
                  width: 1.sw,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45.h,
                width: 45.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/2.3.jpeg'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const CovidConfirmPage(
                        status: true,
                      ),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
                child: Container(
                  height: 65.h,
                  width: 65.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
