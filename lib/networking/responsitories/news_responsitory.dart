import 'package:news/networking/models/image_model.dart';
import 'package:news/networking/models/newsmodel.dart';
import 'package:news/networking/responsitories/http_service.dart';
import 'package:news/networking/responsitories/url.dart';

import '../models/newsmodel1.dart';

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

  Future<ImageModel?> getImageAPI() async {
    try {
      final response = await _server.request(UrlApp.imageapi);
      final dataResponse = response?.data;

      if (dataResponse != null) {
        return ImageModel.fromJson(dataResponse);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsModel1?> getNews1() async {
    try {
      final response = await _server.request(UrlApp.getNews1);
      final dataResponse = response?.data;
      if (dataResponse != null) {
        return NewsModel1.fromJson(dataResponse);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
