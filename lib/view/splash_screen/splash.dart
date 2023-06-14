import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../controller/controller.dart';
import '../../core/assets/assets.dart';
import '../../core/style/colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    splashAudio();
    Future.delayed(const Duration(seconds: 7))
        .then((value) => {Navigator.pushReplacementNamed(context, '/onBoradingScreen')});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.colorPrimary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Assets.animatedSplashIcon, repeat: false),
               SizedBox(
                height: 10.h,
              ),
              Text(
                'Kiddo - كيدو',
                style: TextStyle(
                    color: Styles.fontColorSecondary,
                    fontSize: 42.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
