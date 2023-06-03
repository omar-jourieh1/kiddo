import 'package:flutter/material.dart';

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
                onPageChanged: (vlaue) {
                  setState(() {});
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
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                child: const Icon(
                  Icons.arrow_forward,
                  size: 21,
                ),
                onPressed: () {
                  if (_pageController.page == 2) {
                    Navigator.pushReplacementNamed(context, '/home');
                    homeAudio();
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInCubic);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
