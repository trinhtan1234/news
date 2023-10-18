import 'package:flutter/material.dart';
import 'package:news/home/myhompage.dart';
import 'package:news/home/technology/screen_technology.dart';

class ScreenTabBar extends StatefulWidget {
  const ScreenTabBar({super.key});

  @override
  State<ScreenTabBar> createState() => _ScreenTabBarState();
}

class _ScreenTabBarState extends State<ScreenTabBar>
    with SingleTickerProviderStateMixin {
  final int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const ScreenNewsTech(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'News',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.notifications_none_outlined,
              ),
              Text(
                '20',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings_outlined,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'News',

              // icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Technology',
              // icon: Icon(Icons.beach_access_sharp),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          TabBarView(
            controller: _tabController,
            children: _pages,
          )
        ],
        // child: TabBarView(
        //   controller: _tabController,
        //   children: const <Widget>[
        //     Center(
        //       child: MyHomePage(),
        //     ),
        //     Center(
        //       child: ScreenNewsTech(),
        //     ),

        //   ],
        // ),
      ),
    );
  }
}
