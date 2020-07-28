import 'package:dio/dio.dart' as http_dio;
import 'package:flutter/foundation.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:newsapp/utils/url.dart';

import '../models/news_model.dart';

class NewsProvider with ChangeNotifier {
  http_dio.Dio dio = http_dio.Dio();
  NewsModel _newsModel;

  NewsModel get newsModel => _newsModel;

  Future<List<NewsModel>> fetchCarouselNews() async {
    return fetchNews(carouselNews);
  }

  Future<List<NewsModel>> fetchTopNews() async {
    return fetchNews(topNews);
  }

  Future<List<NewsModel>> fetchEnglishLanguage() async {
    return fetchNews(englishLanguageNews);
  }

  Future<List<NewsModel>> fetchBitcoinCollection() async {
    return fetchNews(bitcoinCollection);
  }

  Future<List<NewsModel>> fetchBusinessCollection() async {
    return fetchNews(businessCollection);
  }

  Future<List<NewsModel>> fetchTechCollection() async {
    return fetchNews(techCollection);
  }

  Future<List<NewsModel>> fetchHealthCollection() async {
    return fetchNews(healthCollection);
  }

  Future<List<NewsModel>> fetchMusicCollection() async {
    return fetchNews(musicCollection);
  }

  Future<List<NewsModel>> fetchEconomyCollection() async {
    return fetchNews(economyCollection);
  }

  Future<List<NewsModel>> fetchFoodCollection() async {
    return fetchNews(foodCollection);
  }

  Future<List<NewsModel>> fetchSportCollection() async {
    return fetchNews(sportCollection);
  }

  Future<List<NewsModel>> fetchTravelCollection() async {
    return fetchNews(travelCollection);
  }

  Future<List<NewsModel>> fetchPoliticCollection() async {
    return fetchNews(politicCollection);
  }

  Future<List<NewsModel>> fetchAstronomyCollection() async {
    return fetchNews(astronomyCollection);
  }

  Future<List<NewsModel>> fetchMovieCollection() async {
    return fetchNews(movieCollection);
  }
}
