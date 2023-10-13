import 'dart:convert';

NewsModel1 newsModel1FromJson(Map<String, dynamic> data) =>
    NewsModel1.fromJson(data);

String newsModel1ToJson(NewsModel1 data) => json.encode(data.toJson());

class NewsModel1 {
  String? status;
  List<Item>? items;

  NewsModel1({
    this.status,
    this.items,
  });

  factory NewsModel1.fromJson(Map<String, dynamic> json) => NewsModel1(
        status: json["status"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  String? title;
  String? snippet;
  String? publisher;
  String? timestamp;
  String? newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item>? subnews;

  Item({
    this.title,
    this.snippet,
    this.publisher,
    this.timestamp,
    this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        snippet: json["snippet"],
        publisher: json["publisher"],
        timestamp: json["timestamp"],
        newsUrl: json["newsUrl"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        hasSubnews: json["hasSubnews"],
        subnews: json["subnews"] == null
            ? []
            : List<Item>.from(json["subnews"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "snippet": snippet,
        "publisher": publisher,
        "timestamp": timestamp,
        "newsUrl": newsUrl,
        "images": images?.toJson(),
        "hasSubnews": hasSubnews,
        "subnews": subnews == null
            ? []
            : List<dynamic>.from(subnews!.map((x) => x.toJson())),
      };
}

class Images {
  String? thumbnail;
  String? original;

  Images({
    this.thumbnail,
    this.original,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: json["thumbnail"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "original": original,
      };
}
