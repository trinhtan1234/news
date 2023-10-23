import 'package:flutter/material.dart';
import 'package:news/networking/models/newsmodel.dart';

class ScreenDetailNews extends StatelessWidget {
  final Article news;

  const ScreenDetailNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title ?? 'No Title',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${news.publishedAt ?? 'Unknown data'}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      news.title ?? 'No Title',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
              if (news.urlToImage != null && news.urlToImage!.isNotEmpty)
                SizedBox(
                  height: 300,
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(
                      news.urlToImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                news.description ?? 'No Description',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Text(news.content ?? 'No content'),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    news.author ?? 'No author',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  filled: true,
                  // fillColor: Colors.grey,
                  hintText: 'Your idea...',
                  // prefixIcon: Icon(Icons.voice_chat_sharp),

                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
                onChanged: (text) {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              label: ''),
          // icon: Expanded(child: Icon(Icons.arrow_back)), label: ''),
          BottomNavigationBarItem(
              icon: Expanded(
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Aa'),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.watch_later_outlined))
                  ],
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
