import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import '../../../models/news_model.dart';
import '../../../providers/news_provider.dart';
import '../../../utils/constants.dart';

class CustomCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return FutureBuilder<List<NewsModel>>(
        future: newsProv.fetchNews(),
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
                return _image_carousel(news);
              },
            ),
          );
        });
  }

  Stack _image_carousel(NewsModel news) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 25.0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  news.urlToImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
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
                      'Imint: the Swedish firm that gives Chinese smartphones an edge in video production',
                      style: headline2.copyWith(color: Colors.white),
                    ),
                    Text(
                      '1 hour ago',
                      style: subtitle2.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
