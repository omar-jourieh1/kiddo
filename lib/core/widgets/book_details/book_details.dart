 import 'package:flutter/material.dart';

Widget bottomNavWidget({  final GestureTapCallback? onTap}) {
    final widget = Container(
      decoration: const BoxDecoration(color: Color(0xffFFF5BE), boxShadow: [
        BoxShadow(color: Color(0xffFFED8C), offset: Offset(1, 2))
      ]),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'تصفح الكتاب',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
    return InkWell(
      onTap:onTap,
      child: widget
    );
  }