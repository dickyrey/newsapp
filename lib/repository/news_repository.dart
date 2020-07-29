import 'package:dio/dio.dart' as http_dio;

import '../models/news_model.dart';

Future<List<NewsModel>> fetchNews(String url) async {
  http_dio.Dio dio = http_dio.Dio();

  http_dio.Response response = await dio.get(url);
  List news = response.data['articles'];

  List<NewsModel> _news = [];
  for (var i = 0; i < news.length; i++) {
    final newsData = NewsModel.fromJson(news[i]);
    _news.add(newsData);
  }
  return _news;
}
