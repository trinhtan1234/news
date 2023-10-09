import 'dart:async';

import 'package:news/networking/models/newsmodel.dart';
import 'package:news/networking/responsitories/news_responsitory.dart';

class NewsBloc {
  final _newsRepo = NewsRepository();

  NewsModel? news;

  final StreamController<NewsModel?> _newsStreamController =
      StreamController<NewsModel>();
  Stream<NewsModel?> get newsStream => _newsStreamController.stream;

  Future getListNews() async {
    news = await _newsRepo.getNews();
    _newsStreamController.sink.add(news);
  }

  void dispose() {
    _newsStreamController.close();
  }
}
