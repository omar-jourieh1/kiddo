import 'package:flutter/material.dart';
import 'package:kiddo/core/style/colors.dart';
import 'package:lottie/lottie.dart';

class OnboradContent extends StatelessWidget {
  const OnboradContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Lottie.asset(image, height: 350),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 28,
              fontFamily: 'Cairo',
              color: Styles.fontColorWhite,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Cairo',
              color: Styles.fontColorWhite,
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
      ],
    );
  }
}
