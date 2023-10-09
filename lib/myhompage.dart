import 'package:flutter/material.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/networking/models/newsmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    _newsBloc.getListNews();
  }

  @override
  void dispose() {
    _newsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<NewsModel?>(
            stream: _newsBloc.newsStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final newsData = snapshot.data;
              final listNews = newsData?.articles;
              if (listNews != null && listNews.isNotEmpty) {
                return ListView.builder(
                    itemCount: listNews.length,
                    itemBuilder: ((context, index) {
                      final news = listNews[index];
                      return Text('${news.title}');
                    }));
              } else {
                return const Text('data');
              }
            },
          ),
        ),
      ),
    );
  }
}
