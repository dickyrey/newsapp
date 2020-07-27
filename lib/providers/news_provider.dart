import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:dio/dio.dart' as http_dio;

class NewsProvider with ChangeNotifier {
  http_dio.Dio dio = http_dio.Dio();
  NewsModel _newsModel;
  List<NewsModel> _newsModelList = [];

  NewsModel get newsModel => _newsModel;
  List<NewsModel> get newsModelList => _newsModelList;

  Future<List<NewsModel>> fetchNews() async {
    http_dio.Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55');
    List news = response.data['articles'];
    for (var i = 0; i < news.length; i++) {
      final newsData = NewsModel.fromJson(news[i]);
      _newsModelList.add(newsData);
    }
    return _newsModelList;
  }
}
