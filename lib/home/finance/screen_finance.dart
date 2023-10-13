import 'package:flutter/material.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/networking/models/newsmodel1.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletons/skeletons.dart';

import 'detail_news_page_finance.dart/detail_news_page_finance.dart';

class ScreenFinance extends StatefulWidget {
  const ScreenFinance({super.key});

  @override
  State<ScreenFinance> createState() => _ScreenFinanceState();
}

class _ScreenFinanceState extends State<ScreenFinance> {
  final NewsBloc _newsBloc = NewsBloc();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    loadData1();
    super.initState();
  }

  void loadData1() async {
    _newsBloc.getListNews1();
  }

  void _onRefresh1() {
    Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading1() {
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
          child: StreamBuilder<NewsModel1?>(
            stream: _newsBloc.news1Stream,
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
                    )
                  ],
                );
              }
              final newsData1 = snapshot.data;
              final listNews1 = newsData1?.items;
              if (listNews1 != null && listNews1.isNotEmpty) {
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
                  onRefresh: _onRefresh1,
                  onLoading: _onLoading1,
                  child: ListView.builder(
                      itemCount: listNews1.length,
                      itemBuilder: ((context, index) {
                        final news1 = listNews1[index];
                        return _ListNews1(
                          news1: news1,
                        );
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

class _ListNews1 extends StatelessWidget {
  const _ListNews1({
    required this.news1,
  });

  final Item news1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenDetailNews1(news1: news1),
          ),
        );
      },
      child: Container(
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
                      '${news1.title}',
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
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
                          '${news1.snippet}',
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
                            '${news1.publisher}',
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
            if (news1.newsUrl != null && news1.newsUrl!.isNotEmpty)
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: ClipRect(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image(
                        image: NetworkImage(news1.newsUrl ?? ''),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 20,
                      ),
                    ),
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'News',
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
      ),
    );
  }
}
