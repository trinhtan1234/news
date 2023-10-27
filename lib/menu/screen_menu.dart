import 'package:flutter/material.dart';
import 'package:news/home/components/textbuttom.dart';
import 'package:news/menu/login/screen_login.dart';

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
                // fillColor: Colors.grey,
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (text) {},
            ),
            AppTextButtom(
              iconLeft: const Icon(Icons.person),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Login/Sign',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenLogin(),
                  ),
                );
              },
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.settings),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Setting',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.menu),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Sort, hide, show categories',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.timeline),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Watch it later',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.widgets),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Widgets',
              onPressed: () {},
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
            AppTextButtom(
              iconLeft: const Icon(Icons.location_on),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Viet Nam',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.location_on),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'World',
              onPressed: () {},
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
            AppTextButtom(
              iconLeft: const Icon(Icons.fiber_new),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Home',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.fiber_new),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Finance',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.fiber_new),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'Business',
              onPressed: () {},
            ),
            const Divider(),
            AppTextButtom(
              iconLeft: const Icon(Icons.fiber_new),
              iconRight: const Icon(Icons.arrow_forward_ios),
              labelTitle: 'World',
              onPressed: () {},
            ),
            const Divider(),
            const Row(
              children: [
                Text('Follow'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tiktok),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cast_for_education),
                ),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.brown,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Text(
                        'Respond to news',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
