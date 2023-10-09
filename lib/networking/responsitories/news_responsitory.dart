import 'package:news/networking/models/newsmodel.dart';
import 'package:news/networking/responsitories/url.dart';
import 'package:news/networking/responsitories/http_service.dart';

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
}
