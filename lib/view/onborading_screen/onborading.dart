import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/controller.dart';
import '../../core/style/colors.dart';
import '../../core/widgets/onborading/onborading.dart';
import '../../model/onborad/onborad.dart';

class OnBorading extends StatefulWidget {
  const OnBorading({super.key});

  @override
  State<OnBorading> createState() => _OnBoradingState();
}

class _OnBoradingState extends State<OnBorading> {
  late PageController _pageController;
  bool visibleSkipButton = false;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.readbackground,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    if (value >= 1) {
                      visibleSkipButton = true;
                    } else {
                      visibleSkipButton = false;
                    }
                  });
                },
                itemCount: onborading_data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboradContent(
                  image: onborading_data[index].image,
                  title: onborading_data[index].title,
                  description: onborading_data[index].description,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimatedContainer(
                height: visibleSkipButton ? 160.h : 80.h,
                duration: const Duration(milliseconds: 250),
                curve: Curves.bounceIn,
                child: Row(
                  children: [
                    Visibility(
                      visible: visibleSkipButton,
                      child: ElevatedButton(
                        child: const Text(
                          'تخطي',
                          style: TextStyle(),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                          homeAudio();
                        },
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 50.h,
                      ),
                      onPressed: () {
                        if (_pageController.page == 2) {
                          Navigator.pushReplacementNamed(context, '/home');
                          homeAudio();
                        } else {
                          if (_pageController.page! >= 1) {
                            visibleSkipButton = true;
                          } else {
                            visibleSkipButton = false;
                          }
                          _pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInCubic);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ));
  }
}
