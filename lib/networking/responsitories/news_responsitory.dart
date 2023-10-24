import 'package:news/networking/models/model_newstech.dart';
import 'package:news/networking/models/model_yournews.dart';
import 'package:news/networking/models/newsmodel.dart';
import 'package:news/networking/responsitories/http_service.dart';
import 'package:news/networking/responsitories/url.dart';

class NewsRepository {
  final HttpService _server = HttpService();

  Future<NewsModel?> getNews() async {
    try {
      final response = await _server.request(UrlApp.getNews);
      final dataResponse = response?.data;
      if (dataResponse != null) {
        return NewsModel.fromJson(dataResponse);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<ModelNewsTech?> getNewsTech() async {
    try {
      final response = await _server.request(UrlApp.getTech);
      final dataResponse = response?.data;
      if (dataResponse != null) {
        return ModelNewsTech.fromJson(dataResponse);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<ModelYourNews?> getYourNews() async {
    try {
      final response = await _server.request(UrlApp.getYourNews);
      final dataResponse = response?.data;
      if (dataResponse != null) {
        return ModelYourNews.fromJson(dataResponse);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
