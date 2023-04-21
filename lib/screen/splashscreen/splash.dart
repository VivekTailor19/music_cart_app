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

    Future.delayed(Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, "home");

    },);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splashmusic.png",height: 270,width: 360,fit: BoxFit.contain,),
              SizedBox(height: 10),
              LinearProgressIndicator(
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
