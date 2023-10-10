import 'package:flutter/material.dart';

import 'menu/screen_menu.dart';
import 'menu_tabbar.dart';
import 'your_news/screen_your_news.dart';

class ScreenNavigationBottom extends StatefulWidget {
  const ScreenNavigationBottom({super.key});

  @override
  State<ScreenNavigationBottom> createState() => _ScreenNavigationBottomState();
}

class _ScreenNavigationBottomState extends State<ScreenNavigationBottom> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ScreenTabBar(),
    const ScreenYourNews(),
    const ScreenMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: 'Your news'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
