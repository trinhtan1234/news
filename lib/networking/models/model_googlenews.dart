import 'dart:convert';

ModelGoogleNews modelGoogleNewsFromJson(String str) =>
    ModelGoogleNews.fromJson(json.decode(str));

String modelGoogleNewsToJson(ModelGoogleNews data) =>
    json.encode(data.toJson());

class ModelGoogleNews {
  final String? status;
  final List<Item>? items;

  ModelGoogleNews({
    this.status,
    this.items,
  });

  factory ModelGoogleNews.fromJson(Map<String, dynamic> json) =>
      ModelGoogleNews(
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
  final String? title;
  final String? snippet;
  final String? publisher;
  final String? timestamp;
  final String? newsUrl;
  final Images? images;
  final bool? hasSubnews;
  final List<Item>? subnews;

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
  final String? thumbnail;
  final String? original;

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
