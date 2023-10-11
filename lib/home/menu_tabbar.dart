import 'package:flutter/material.dart';
import 'package:news/home/myhompage.dart';

class ScreenTabBar extends StatefulWidget {
  const ScreenTabBar({super.key});

  @override
  State<ScreenTabBar> createState() => _ScreenTabBarState();
}

class _ScreenTabBarState extends State<ScreenTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(Icons.notifications_none_outlined),
              Text(
                '20',
                style: TextStyle(color: Colors.red),
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
              text: 'Finance',
              // icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              text: 'Business',
              // icon: Icon(Icons.brightness_5_sharp),
            ),
            Tab(
              text: 'World',
              // icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: MyHomePage(),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}