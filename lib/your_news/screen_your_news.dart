import 'package:flutter/material.dart';
import 'package:news/components/custom_container.dart';
import 'package:news/networking/models/newsmodel.dart';

class ScreenYourNews extends StatelessWidget {
  final Article news;

  const ScreenYourNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        title: news.title,
        content: news.content,
        publishedAt: news.publishedAt?.toString(),
        newstype: 'news',
        urlToImage: news.urlToImage ?? '',
      ),
    );
  }
}
