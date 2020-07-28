import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCollectionCard extends StatelessWidget {
  const NewsCollectionCard({
    Key key,
    @required this.news,
  }) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 280.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  news.urlToImage ??
                      'https://bitsofco.de/content/images/2018/12/broken-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 5.0,
              ),
              child: Text(
                news.title,
                style: headline2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    timeago.format(news.publishedAt),
                    style: subtitle2,
                  ),
                  Icon(Icons.bookmark_border),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
