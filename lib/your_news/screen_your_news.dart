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
      body: SafeArea(
        child: Center(
          child: StreamBuilder<ModelYourNews?>(
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
              final listNews = newsData?.tieuDe ?? '';
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
                        Row(
                          children: [
                            Title(
                              color: Colors.blue,
                              child: Text('${newsData?.tieuDe}'),
                            ),
                          ],
                        )
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
