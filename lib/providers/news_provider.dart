import 'package:dio/dio.dart' as http_dio;
import 'package:flutter/foundation.dart';

import '../models/news_model.dart';
import '../repository/news_repository.dart';

class NewsProvider with ChangeNotifier {
  http_dio.Dio dio = http_dio.Dio();
  NewsModel _newsModel;
  String _urlEverything = "http://newsapi.org/v2/everything?";
  String _urlTopHeadline = "https://newsapi.org/v2/top-headlines?";
  String _apiKey = "89647919638e4ee9a4898ab826e3d7f2";

  NewsModel get newsModel => _newsModel;

  Future<List<NewsModel>> fetchCarouselNews() async {
    return fetchNews(_urlTopHeadline + "country=us&apiKey=" + _apiKey);
  }

  Future<List<NewsModel>> fetchTopNews() async {
    return fetchNews(_urlTopHeadline + "sources=bbc-news&apiKey=" + _apiKey);
  }

  Future<List<NewsModel>> fetchEnglishLanguage() async {
    return fetchNews(_urlTopHeadline + "language=en&apiKey=" + _apiKey);
  }

  Future<List<NewsModel>> fetchCollection(String collection) async {
    return fetchNews(_urlTopHeadline +
        "country=us&category=" +
        collection +
        "&sortBy=publishedAt&apiKey=" +
        _apiKey);
  }

  Future<List<NewsModel>> fetchNewsbyCountryCollection(
      {String countryCode, String category}) async {
    var urlNews = fetchNews(_urlTopHeadline +
        "country=" +
        countryCode +
        "&category=" +
        category +
        "&apiKey=" +
        _apiKey);
    return urlNews;
  }

  Future<List<NewsModel>> fetchNewsfromChannel({
    @required String domain,
  }) async {
    return fetchNews(_urlEverything +
        "domains=" +
        domain +
        "&language=en&apiKey=" +
        _apiKey);
  }
}
