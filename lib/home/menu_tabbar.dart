import 'package:flutter/material.dart';
import 'package:news/home/myhompage.dart';
import 'package:news/home/screen_business.dart';
import 'package:news/home/screen_sport.dart';
import 'package:news/home/technology/screen_technology.dart';

class ScreenTabBar extends StatefulWidget {
  const ScreenTabBar({Key? key}) : super(key: key);

  @override
  State<ScreenTabBar> createState() => _ScreenTabBarState();
}

class _ScreenTabBarState extends State<ScreenTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
            Tab(
              text: 'Business',
              // icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              text: 'Sport',
              // icon: Icon(Icons.beach_access_sharp),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: 0,
        children: [
          TabBarView(
            controller: _tabController,
            children: const <Widget>[
              Center(
                child: MyHomePage(),
              ),
              Center(
                child: ScreenNewsTech(),
              ),
              Center(
                child: ScreenBusiness(),
              ),
              Center(child: ScreenSport()),
            ],
          ),
        ],
      ),
    );
  }
}
