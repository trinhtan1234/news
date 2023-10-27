import 'package:flutter/material.dart';
import 'package:news/home/networking/models/newsmodel.dart';

class ScreenInputComment extends StatelessWidget {
  final Article news;
  const ScreenInputComment({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title ?? 'No Title',
        ),
      ),
    );
  }
}
