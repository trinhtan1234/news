import 'package:flutter/material.dart';
import 'package:news/components/textbuttom.dart';

class ScreenMenu extends StatelessWidget {
  const ScreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.fiber_new,
          size: 40,
          color: Colors.brown,
        ),
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.brown,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                filled: true,
                fillColor: Colors.grey,
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (text) {},
            ),
            const AppTextButtom(
              iconLeft: Icon(Icons.person),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Login/Sign',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.settings),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Setting',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.menu),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Sort, hide, show categories',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.timeline),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Watch it later',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.widgets),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Widgets',
            ),
            const Divider(),
            const Row(
              children: [
                Text(
                  'News by region',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.location_on),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Viet Nam',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.location_on),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'World',
            ),
            const Divider(),
            const Row(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.fiber_new),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Home',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.fiber_new),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Finance',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.fiber_new),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'Business',
            ),
            const Divider(),
            const AppTextButtom(
              iconLeft: Icon(Icons.fiber_new),
              iconRight: Icon(Icons.arrow_forward_ios),
              labelTitle: 'World',
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
