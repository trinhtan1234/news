import 'dart:async';

import 'package:news/home/networking/models/model_googlenews.dart';
import 'package:news/home/networking/models/model_newstech.dart';
import 'package:news/home/networking/models/model_yournews.dart';
import 'package:news/home/networking/models/newsmodel.dart';
import 'package:news/home/networking/responsitories/news_responsitory.dart';

class NewsBloc {
  final _newsRepo = NewsRepository();

  NewsModel? news;
  ModelNewsTech? newsTech;
  List<ModelYourNews>? yourNews;
  ModelGoogleNews? googlenews;

  final StreamController<NewsModel?> _newsStreamController =
      StreamController<NewsModel>();
  Stream<NewsModel?> get newsStream => _newsStreamController.stream;

  final StreamController<ModelNewsTech?> _newsTechStreamController =
      StreamController<ModelNewsTech>();
  Stream<ModelNewsTech?> get newsTechStream => _newsTechStreamController.stream;

  final StreamController<List<ModelYourNews>?> _newsYourStreamController =
      StreamController<List<ModelYourNews>?>();
  Stream<List<ModelYourNews>?> get newsYourStream =>
      _newsYourStreamController.stream;

  final StreamController<ModelGoogleNews?> _googleNewStreamController =
      StreamController<ModelGoogleNews>();
  Stream<ModelGoogleNews?> get googleNews => _googleNewStreamController.stream;

  Future<void> getListNews() async {
    news = await _newsRepo.getNews();
    _newsStreamController.sink.add(news);
  }

  Future<void> getListNewsTech() async {
    newsTech = await _newsRepo.getNewsTech();
    _newsTechStreamController.sink.add(newsTech);
  }

  Future<void> getListYourNew() async {
    yourNews = (await _newsRepo.getYourNews());
    _newsYourStreamController.sink.add(yourNews);
  }

  Future<void> getListGoogleNews() async {
    googlenews = (await _newsRepo.getGoogleNews());
    _googleNewStreamController.sink.add(googlenews);
  }

  void dispose() {
    _newsStreamController.close();
    _newsTechStreamController.close();
    _newsYourStreamController.close();
    _googleNewStreamController.close();
  }
}
