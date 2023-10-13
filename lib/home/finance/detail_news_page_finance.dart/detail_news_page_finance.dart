import 'package:flutter/material.dart';
import 'package:news/networking/models/newsmodel1.dart';

class ScreenDetailNews1 extends StatelessWidget {
  final Item news1;

  const ScreenDetailNews1({super.key, required this.news1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news1.title ?? 'No Title',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news1.title ?? 'No Title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              news1.snippet ?? 'No Snippet',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            Text(
              'Published at: ${news1.publisher ?? 'No Publisher'}',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Text(news1.publisher ?? 'No content'),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  news1.newsUrl ?? 'No url',
                  style: const TextStyle(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
