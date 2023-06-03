import 'package:flutter/material.dart';
import 'package:kiddo/view/home/home.dart';
import 'package:kiddo/view/onborading_screen/onborading.dart';
import 'package:kiddo/view/splash_screen/splash.dart';

void main() {
  runApp(const MyApp());
}

git init
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/': (context) => const Splash(),
          '/onBoradingScreen': (context) => const OnBorading(),
          '/home': (context) => const Home(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ));
  }
}
