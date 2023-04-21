import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, "home");
    },);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splashmusic.png",height: 200),
              SizedBox(height: 60),
              CircularProgressIndicator(
                backgroundColor: Colors.black12,

                color: Color(0xff131313),
              )
            ],
          ),
        ),
      ),
    );
  }
}
