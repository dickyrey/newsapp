import 'package:flutter/material.dart';
import 'package:newsapp/screens/core/news_webview_page.dart';
import '../../../models/news_model.dart';
import '../../../providers/news_provider.dart';
import '../../../utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class BrowseNewsInHome extends StatelessWidget {
  const BrowseNewsInHome({
    Key key,
    @required this.newsProv,
  }) : super(key: key);

  final NewsProvider newsProv;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: newsProv.fetchEnglishLanguage(),
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
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              var news = snapshot.data[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsWebViewPage(
                          url: news.url,
                        ),
                      ));
                },
                child: Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 8.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            news.urlToImage ??
                                'https://bitsofco.de/content/images/2018/12/broken-1.png',
                            fit: BoxFit.cover,
                            width: 120.0,
                            height: 100.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  news.title,
                                  style: headline3,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  timeago.format(news.publishedAt),
                                  style: subtitle2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
