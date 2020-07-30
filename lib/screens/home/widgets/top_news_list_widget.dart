import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../models/news_model.dart';
import '../../../utils/constants.dart';

class TopNewsListWidget extends StatelessWidget {
  final Future<List<NewsModel>> future;
  const TopNewsListWidget({
    Key key,
    @required this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230.0,
      child: FutureBuilder<List<NewsModel>>(
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
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var news = snapshot.data[index];
              return newsCard(news);
            },
          );
        },
      ),
    );
  }

  Container newsCard(NewsModel news) {
    return Container(
      width: 180.0,
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                news.urlToImage ??
                    'https://bitsofco.de/content/images/2018/12/broken-1.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            news.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: subtitle1.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      child: Text(
                        news.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: subtitle2.copyWith(
                          color: kBlueDeepColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      timeago.format(news.publishedAt),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitle3,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
