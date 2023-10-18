import 'package:flutter/material.dart';
import 'package:news/home/bloc/news_bloc.dart';
import 'package:news/networking/models/model_newstech.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletons/skeletons.dart';

class ScreenNewsTech extends StatefulWidget {
  const ScreenNewsTech({super.key});

  @override
  State<ScreenNewsTech> createState() => _ScreenNewsTechState();
}

class _ScreenNewsTechState extends State<ScreenNewsTech> {
  final NewsBloc _newsBloc = NewsBloc();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    _newsBloc.getListNewsTech();
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
          child: StreamBuilder<ModelNewsTech?>(
            stream: _newsBloc.newsTechStream,
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
              final newsTechData = snapshot.data;
              final listNewsTech = newsTechData?.articles;
              if (listNewsTech != null && listNewsTech.isNotEmpty) {
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
                      itemCount: listNewsTech.length,
                      itemBuilder: ((context, index) {
                        final newsTech = listNewsTech[index];
                        return _ListNewsTech(newsTech: newsTech);
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

class _ListNewsTech extends StatelessWidget {
  const _ListNewsTech({
    required this.newsTech,
  });

  final Article newsTech;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                        '${newsTech.title}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: Colors.brown,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.add),
                          Text(
                            'Follow',
                            style: TextStyle(
                                // color: Color.fromARGB(255, 63, 66, 69),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${newsTech.description}',
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
                              '${newsTech.publishedAt}',
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
            if (newsTech.urlToImage != null && newsTech.urlToImage!.isNotEmpty)
              const Padding(padding: EdgeInsets.only(top: 10)),
            // ignore: prefer_const_constructors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Row(
                  children: [
                    Text(
                      'News',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.mark_chat_read_outlined),
                    Padding(padding: EdgeInsets.only(right: 15)),
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
