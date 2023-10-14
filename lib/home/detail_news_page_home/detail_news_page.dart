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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title ?? 'No Title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              news.description ?? 'No Description',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            Text(
              'Published at: ${news.publishedAt ?? 'Unknown data'}',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            if (news.urlToImage != null && news.urlToImage!.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  news.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            Row(
              children: [
                Flexible(
                  child: Text(news.content ?? 'No content'),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  news.url ?? 'No url',
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
