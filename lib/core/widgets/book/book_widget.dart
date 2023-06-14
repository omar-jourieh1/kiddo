import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookWidget extends StatelessWidget {
  final String? _title, _thumbnail;

  const BookWidget(this._title, this._thumbnail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffFFF5BE),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      elevation: 2,
      shadowColor: const Color(0xffFFED8C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _thumbnail!.isEmpty
              ? const CircularProgressIndicator()
              : Image.network(
                  _thumbnail!,
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              _title ?? "-",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
