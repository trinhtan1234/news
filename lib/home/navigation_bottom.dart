import 'package:flutter/material.dart';
import 'package:news/networking/models/newsmodel.dart';

import '../menu/screen_menu.dart';
import '../your_news/screen_your_news.dart';
import 'menu_tabbar.dart';

class ScreenNavigationBottom extends StatefulWidget {
  const ScreenNavigationBottom({super.key});

  @override
  State<ScreenNavigationBottom> createState() => _ScreenNavigationBottomState();
}

class _ScreenNavigationBottomState extends State<ScreenNavigationBottom> {
  int _selectedIndex = 0;

  late final Article news;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    news = Article();
    _pages = [
      const ScreenTabBar(),
      const ScreenYourNews(),
      const ScreenMenu(),
    ];
  }

  List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
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
