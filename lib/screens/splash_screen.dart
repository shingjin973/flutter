import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(76, 116, 139, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOMEBREW",
                style: TextStyle(
                    fontFamily: 'Norwester',
                    color: Colors.white,
                    fontSize: 48.0,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 3.0)),
            Text(
              "Great Coffee at Home",
              style: TextStyle(
                  fontFamily: 'Kollektif',
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 3.0),
            )
          ],
        ),
      ),
    );
  }
}
