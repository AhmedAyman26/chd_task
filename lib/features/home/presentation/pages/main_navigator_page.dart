import 'package:chd_task_ahmed_ayman/features/home/presentation/pages/home_page.dart';
import 'package:chd_task_ahmed_ayman/features/me/presentation/pages/me_page.dart';
import 'package:flutter/material.dart';

class MainNavigatorPage extends StatefulWidget {
  const MainNavigatorPage({super.key});

  @override
  State<MainNavigatorPage> createState() => _MainNavigatorPageState();
}

class _MainNavigatorPageState extends State<MainNavigatorPage> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {

          });
        },
        items:
        [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Me'),
        ],
      ),
      body: appPages[currentIndex],
    );
  }
}

List<Widget> appPages=
[
  HomePage(),
  MePage(),
];
