import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItem = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          currentIndex: selectedItem,
          onTap: (value) {
            setState(() {
              selectedItem = value;
              print(value);
            });
          },
          backgroundColor: const Color(0xffFFF5BE),
          fixedColor: const Color(0xffEF3349),
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    color: const Color(0xffEF3349),
                    child: const Icon(Icons.abc)),
                label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
          ]),
    );
  }
}
