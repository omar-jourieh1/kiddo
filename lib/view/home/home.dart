import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../controller/controller.dart';
import '../../core/widgets/floatbottonnav/float_bottom_nav.dart';
import '../colorgame/colorgame.dart';
import '../settings/settingspage.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedItem = 1;
  final List<Widget> _pages = [
    const ColorGame(),
    const HomePage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(25.0.r),
        child: FloatBottomAppBar(
          itemBuilder: (ctx, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = index;
                  _pageController.animateToPage(selectedItem,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInCirc);
                  pageTrainstionAudio();
                });
              },
              child: AnimatedContainer(
                duration: const Duration(microseconds: 250),
                width: 60.w,
                decoration: BoxDecoration(
                    border: index == selectedItem
                        ? Border(
                            top: BorderSide(
                                width: 3.w,
                                color: const Color.fromARGB(255, 253, 23, 23)))
                        : null),
                child: LottieBuilder.asset(
                  data[index],
                  height: 1.h,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: (index) {
                setState(() {
                  selectedItem = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
