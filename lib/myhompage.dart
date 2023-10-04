import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_sharp),
        ),
        title: const Text(
          'Tin tức mới',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_2_sharp),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: const Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Tin dành cho bạn'),
                ),
                Icon(Icons.web_asset_off_rounded),
              ],
            )
          ],
        ),
      ),
    );
  }
}
