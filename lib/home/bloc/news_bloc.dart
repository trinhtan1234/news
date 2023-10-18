import 'dart:async';

import 'package:news/networking/models/image_model.dart';
import 'package:news/networking/models/newsmodel.dart';
import 'package:news/networking/models/newsmodel1.dart';
import 'package:news/networking/responsitories/news_responsitory.dart';

class NewsBloc {
  final _newsRepo = NewsRepository();

  NewsModel? news;

  final StreamController<NewsModel?> _newsStreamController =
      StreamController<NewsModel>();
  Stream<NewsModel?> get newsStream => _newsStreamController.stream;

  Future<void> getListNews() async {
    news = await _newsRepo.getNews();
    print(news);
    _newsStreamController.sink.add(news);
  }

  void dispose() {
    _newsStreamController.close();
  }
}
