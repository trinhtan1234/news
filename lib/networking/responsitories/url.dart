class UrlApp {
  static String getNews =
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a5a1a22554264836a4ef956b1554df0a';
  static String getTech =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a5a1a22554264836a4ef956b1554df0a';
  static String getYourNews =
      'https://64fc7845605a026163ae88c0.mockapi.io/news';

  static String getNewGoogle = 'https://google-news13.p.rapidapi.com/latest';
}

// ignore: constant_identifier_names
enum APIMethod { Get, Post, Put, Delete }
