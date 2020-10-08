import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:newsapp/screens/core/news_webview_page.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../models/news_model.dart';
import '../../../utils/constants.dart';

class CustomCarouselWidget extends StatelessWidget {
  final Future<List<NewsModel>> future;

  const CustomCarouselWidget({
    Key key,
    @required this.future,
  }) : super(key: key);

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
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 230.0,
            child: Swiper(
              itemCount: snapshot.data.length = 7,
              autoplay: true,
              autoplayDelay: 5000,
              pagination: SwiperPagination(
                margin: new EdgeInsets.all(5.0),
                alignment: Alignment.bottomLeft,
                builder: new DotSwiperPaginationBuilder(
                  color: Theme.of(context).primaryColor.withOpacity(.3),
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              itemBuilder: (context, index) {
                final news = snapshot.data[index];
                return _imageCarousel(news, context);
              },
            ),
          );
        });
  }

  Stack _imageCarousel(NewsModel news, BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 25.0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsWebViewPage(
                    url: news.url,
                  ),
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                    imageUrl: news.urlToImage ??
                        'https://bitsofco.de/content/images/2018/12/broken-1.png'),
                Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black26,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Text(
                          news.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: headline2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          timeago.format(news.publishedAt),
                          style: subtitle2.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
