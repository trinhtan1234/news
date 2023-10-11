import 'dart:async';

import 'package:news/networking/models/newsmodel.dart';
import 'package:news/networking/models/newsmodel1.dart';
import 'package:news/networking/responsitories/news_responsitory.dart';

class NewsBloc {
  final _newsRepo = NewsRepository();

  NewsModel? news;
  NewsModel1? news1;

  final StreamController<NewsModel?> _newsStreamController =
      StreamController<NewsModel>();
  Stream<NewsModel?> get newsStream => _newsStreamController.stream;

  final StreamController<NewsModel1?> _news1StreamController =
      StreamController<NewsModel1>();
  Stream<NewsModel1?> get news1Stream => _news1StreamController.stream;

  Future getListNews() async {
    news = await _newsRepo.getNews();
    _newsStreamController.sink.add(news);
  }

  Future getListNews1() async {
    news1 = await _newsRepo.getNews1();
    _news1StreamController.sink.add(news1);
  }

  void dispose() {
    _newsStreamController.close();
  }
}
