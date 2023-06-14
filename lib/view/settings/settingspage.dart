import 'package:flutter/material.dart';
import 'package:kiddo/core/assets/assets.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF5BE),
        centerTitle: true,
        elevation: 2,
        shadowColor: const Color(0xffFFED8C),
        title: const Text('الإعدادات'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              Assets.settingsRollJson,
              width: 200,
            ),
            const Text('الإعدادات')
          ],
        ),
      ),
    );
  }
}
