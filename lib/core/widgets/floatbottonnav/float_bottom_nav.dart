import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../assets/assets.dart';

List<String> data = [Assets.welcomeJson,Assets.homeJson, Assets.settingsJson];

Material FloatBottomAppBar(
    {required Widget? Function(BuildContext, int) itemBuilder}) {
  return Material(
      color: const Color(0xffFFF5BE),
      elevation: 2,
      shadowColor: const Color(0xffFFED8C),
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
          height: 70.h,
          child: ListView.builder(
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            itemBuilder: itemBuilder,
            scrollDirection: Axis.horizontal,
          )));
}
