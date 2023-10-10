import 'package:flutter/material.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/networking/models/newsmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NewsBloc _newsBloc = NewsBloc();

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
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 400,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${news.title}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${news.description}',
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.public,
                                            size: 15,
                                          ),
                                          Text(
                                            '${news.publishedAt}',
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (news.urlToImage != null &&
                                news.urlToImage!.isNotEmpty)
                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  child: ClipRect(
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Image(
                                        image:
                                            NetworkImage(news.urlToImage ?? ''),
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            // ignore: prefer_const_constructors
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Row(
                                  children: [
                                    Icon(Icons.star_outline_outlined),
                                    Text(
                                      'Follow',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.comment_outlined),
                                    Text(
                                      '22',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
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
