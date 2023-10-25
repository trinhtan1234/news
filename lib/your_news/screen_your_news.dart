import 'package:flutter/material.dart';
import 'package:news/home/bloc/news_bloc.dart';
import 'package:news/networking/models/model_yournews.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletons/skeletons.dart';

class ScreenYourNews extends StatefulWidget {
  const ScreenYourNews({Key? key}) : super(key: key);

  @override
  State<ScreenYourNews> createState() => _ScreenYourNewsState();
}

class _ScreenYourNewsState extends State<ScreenYourNews> {
  final NewsBloc _newBloc = NewsBloc();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    _newBloc.getListYourNew();
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
    _newBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tin tiếng việt',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        leading: const Icon(Icons.newspaper),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Row(
              children: [
                Text('Tuỳ chọn'),
                Icon(Icons.menu_sharp),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<List<ModelYourNews>?>(
            stream: _newBloc.newsYourStream,
            // initialData: initialData,
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
              final listNews = newsData ?? [];
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
                    return Column(
                      children: [
                        Container(
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
                                          '${listNews[index].tieuDe}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${listNews[index].tinhThanhPho}'),
                                          Flexible(
                                            child: Text(
                                              '${listNews[index].content}',
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 5)),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.public,
                                            size: 15,
                                          ),
                                          Text(
                                            '${listNews[index].tieuDe}',
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (listNews[index].imageTieuDe != null &&
                                  listNews[index].imageTieuDe!.isNotEmpty)
                                Expanded(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: ClipRect(
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Image(
                                          image: NetworkImage(
                                              listNews[index].imageTieuDe ??
                                                  ''),
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              // ignore: prefer_const_constructors
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        builder: (context) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  // margin: const EdgeInsets.only(),
                                                  height: 50,
                                                  child: Flexible(
                                                    child: Text(
                                                      '${listNews[index].content}',
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      // overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Ý Kiến',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.person_3),
                                                        Flexible(
                                                          child: Text(
                                                            '${listNews[index].content}',
                                                            softWrap: true,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        '${listNews[index].content}'),
                                                    const Divider(),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.person_3),
                                                        Flexible(
                                                          child: Text(
                                                            '${listNews[index].content}',
                                                            softWrap: true,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        '${listNews[index].content}'),
                                                  ],
                                                ),
                                                const Divider(),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.person_3),
                                                        Flexible(
                                                          child: Text(
                                                            '${listNews[index].content}',
                                                            softWrap: true,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        '${listNews[index].content}'),
                                                    const Divider(),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.person_3),
                                                        Flexible(
                                                          child: Text(
                                                            '${listNews[index].content}',
                                                            softWrap: true,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        '${listNews[index].content}'),
                                                  ],
                                                ),
                                                const Divider(),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.mark_chat_read_outlined),
                                        Padding(
                                            padding: EdgeInsets.only(right: 5)),
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
                      ],
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
