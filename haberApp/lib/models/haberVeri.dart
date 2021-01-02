import 'package:haberApp/models/data/article.dart';
import 'dart:convert';

Haber haberFromJson(String str) => Haber.fromJson(json.decode(str));

String haberToJson(Haber data) => json.encode(data.toJson());

class Haber {
  Haber({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory Haber.fromJson(Map<String, dynamic> json) => Haber(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
