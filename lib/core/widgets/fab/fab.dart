import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../assets/assets.dart';

Widget floatingActionWidget({final VoidCallback? onPressed}) {
  return RawMaterialButton(
    shape: const CircleBorder(),
    padding: const EdgeInsets.all(16),
    elevation: 2,
    fillColor: const Color(0xffFFED8C),
    onPressed: onPressed,
    child: LottieBuilder.asset(
      Assets.searchJson,
      width: 35.w,
    ),
  );
}
