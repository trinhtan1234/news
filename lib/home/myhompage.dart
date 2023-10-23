import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/home/bloc/news_bloc.dart';
import 'package:news/networking/models/newsmodel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletons/skeletons.dart';

import 'detail_news_page_home/detail_news_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NewsBloc _newsBloc = NewsBloc();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    _newsBloc.getListNews();
  }

  void _onRefresh() {
    Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    Future.delayed(const Duration(milliseconds: 1000));
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
                return const Column(
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(height: 20, width: 160),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(height: 150),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(height: 40),
                    )
                  ],
                );
              }
              final newsData = snapshot.data;
              final listNews = newsData?.articles;
              if (listNews != null && listNews.isNotEmpty) {
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const ClassicHeader(
                    idleText: '',
                    releaseText: '',
                    refreshingText: '',
                    completeText: '',
                  ),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView.builder(
                      itemCount: listNews.length,
                      itemBuilder: ((context, index) {
                        final news = listNews[index];
                        return _ListNews(news: news);
                      })),
                );
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

class _ListNews extends StatelessWidget {
  const _ListNews({
    required this.news,
  });

  final Article news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenDetailNews(
              news: news,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white60,
          border: Border(
            top: BorderSide(width: 0.5),
          ),
        ),
        margin: const EdgeInsets.all(10),
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: ListTile(
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${news.title}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: Colors.brown,
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Row(
                    //     children: [
                    //       Icon(Icons.add),
                    //       Text(
                    //         'Follow',
                    //         style: TextStyle(
                    //             // color: Color.fromARGB(255, 63, 66, 69),
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${news.content}',
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
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
            ),
            if (news.urlToImage != null && news.urlToImage!.isNotEmpty)
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: ClipRect(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image(
                        image: NetworkImage(news.urlToImage ?? ''),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 20,
                      ),
                    ),
                  ),
                ),
              ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            // ignore: prefer_const_constructors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'News',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      builder: ((context) {
                        return LayoutBuilder(
                          builder: (context, Constraints) {
                              double screenHeight = MediaQuery.of(context).size.height;
                              double textHeight = 20 * 4;
                              double minHeight = 
                          },
                        )
                       
                        return SingleChildScrollView(
                          child: Container(
                            height: bottomSheetHeight,
                            margin: const EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Scaffold(
                                appBar: AppBar(
                                  title: const Text('a'),
                                ),
                                body: const SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text('abc'),
                                      Text('abc'),
                                      Text('abc'),
                                      Text('abc'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.mark_chat_read_outlined),
                      Padding(padding: EdgeInsets.only(right: 15)),
                      Text(
                        '22',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
