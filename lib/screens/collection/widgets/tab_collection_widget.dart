import 'package:flutter/material.dart';

import '../../../models/news_model.dart';
import 'news_collection_card.dart';

class TabCollectionWidget extends StatelessWidget {
  final Future<List<NewsModel>> future;

  const TabCollectionWidget({Key key, @required this.future}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Something error'));
              }
              if (!snapshot.hasData) {
                return Center(child: Text('No Data'));
              }
              break;

            default:
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            itemBuilder: (context, index) {
              var news = snapshot.data[index];
              return NewsCollectionCard(news: news);
            },
          );
        });
  }
}
