import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:haberApp/models/data/article.dart";
import "package:haberApp/models/haberVeri.dart";

class HaberService {
  static HaberService _singleton = HaberService._internal();
  HaberService._internal();

  factory HaberService() {
    return _singleton;
  }

  static Future<List<Article>> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=573e267a1ccf406da8fba4299e4e8731';

    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      Haber news = Haber.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
