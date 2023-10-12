import 'package:flutter/material.dart';

class ScreenMenu extends StatelessWidget {
  const ScreenMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.abc,
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
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Đăng nhập/Tạo tài khoản'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Thiết lập ứngn dụng'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sắp xếp, ẩn, hiện chuyên mục'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.watch_later),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Xem sau'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.widgets),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Tiện ích'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Tin theo khu vực'),
                      ),
                    ],
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.arrow_forward_ios,
                //   ),
                // ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Hà Nội',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Hồ Chí Minh',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Chuyên mục',
                          // style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Trang chủ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Mới nhất',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.settings),
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Podcasts',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
