import 'package:flutter/material.dart';

import '../screens/HomeScreen.dart';
import '../screens/ForumScreen.dart';
import '../screens/telepon_page.dart';
import '../screens/test.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ForumScreen(),
    testPage(),
    TeleponPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the current active index
        onTap: _onTabTapped, // Register the callback function
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Forum',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Lapor',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Kontak',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
