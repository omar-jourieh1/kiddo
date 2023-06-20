import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiddo/providers/cart_prodvider.dart';
import 'package:kiddo/providers/home_provider.dart';
import 'package:kiddo/view/home/home.dart';
import 'package:kiddo/view/onborading_screen/onborading.dart';
import 'package:kiddo/view/splash_screen/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (create) => CartProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(540, 960),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            routes: {
              '/': (context) => const Splash(),
              '/onBoradingScreen': (context) => const OnBorading(),
              '/home': (context) => const Home(),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: child,
          );
        });
  }
}
