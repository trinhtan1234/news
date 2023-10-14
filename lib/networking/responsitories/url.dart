import 'package:dio/dio.dart';

class UrlApp {
  static String imageapi = 'https://dog.ceo/api/breeds/image/random';
  static String getNews =
      // 'https://newsapi.org/v2/everything?q=apple&from=2023-10-09&to=2023-10-09&sortBy=popularity&apiKey=a5a1a22554264836a4ef956b1554df0a';
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a5a1a22554264836a4ef956b1554df0a';
  static String getNews1 = 'https://google-news13.p.rapidapi.com/latest';

  static Future<void> fetchNews1() async {
    Dio dio = Dio();

    dio.options.headers = {
      'X-RapidAPI-Key': 'a19e248718msh692f4ef2f71d042p12715bjsn9c8188da969a',
      'X-RapidAPI-Host': 'google-news13.p.rapidapi.com',
    };
  }
}

// ignore: constant_identifier_names
enum APIMethod { Get, Post, Put, Delete }
