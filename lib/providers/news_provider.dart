import 'package:dio/dio.dart' as http_dio;
import 'package:flutter/foundation.dart';
import 'package:newsapp/repository/news_repository.dart';

import '../models/news_model.dart';

class NewsProvider with ChangeNotifier {
  http_dio.Dio dio = http_dio.Dio();
  NewsModel _newsModel;

  NewsModel get newsModel => _newsModel;

  String carouselNews =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55';
  String topNews =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55";

  String englishLanguageNews =
      "https://newsapi.org/v2/top-headlines?language=en&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55";

  Future<List<NewsModel>> fetchCarouselNews() async {
    return fetchNews(carouselNews);
  }

  Future<List<NewsModel>> fetchTopNews() async {
    return fetchNews(topNews);
  }

  Future<List<NewsModel>> fetchEnglishLanguage() async {
    return fetchNews(englishLanguageNews);
  }
}
