import 'package:flutter/material.dart';

import '../screens/ForumScreen.dart';
import '../screens/telepon_page.dart';

class NavBarGuest extends StatefulWidget {
  @override
  _NavBarGuestState createState() => _NavBarGuestState();
}

class _NavBarGuestState extends State<NavBarGuest> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ForumScreen(),
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
            icon: Icon(Icons.question_answer),
            label: 'Forum',
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
