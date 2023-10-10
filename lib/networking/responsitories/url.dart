class UrlApp {
  static String getNews =
      // 'https://newsapi.org/v2/everything?q=apple&from=2023-10-09&to=2023-10-09&sortBy=popularity&apiKey=a5a1a22554264836a4ef956b1554df0a';
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a5a1a22554264836a4ef956b1554df0a';
}

// ignore: constant_identifier_names
enum APIMethod { Get, Post, Put, Delete }
