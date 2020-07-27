import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import 'widgets/custom_carousel_widget.dart';
import 'widgets/program_list_widget.dart';
import 'widgets/top_news_list_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: Text('BacaKita', style: headline2),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomCarouselWidget(future: newsProv.fetchCarouselNews()),
              subHead('Top News from BBC News'),
              TopNewsListWidget(future: newsProv.fetchTopNews()),
              SizedBox(height: 15.0),
              subHead('Top Program'),
              ProgramListWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Card(
                    child: IconButton(
                      icon: Icon(FlutterIcons.list_ent),
                      onPressed: () {},
                    ),
                  ),
                  Card(
                    child: IconButton(
                      icon: Icon(FlutterIcons.grid_ent),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 40.0),
              FutureBuilder<List<NewsModel>>(
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
                        return Card(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  ListTile subHead(String title) {
    return ListTile(
      title: Text(
        title,
        style: headline2,
      ),
      trailing: Text(
        'See all',
        style: subtitle2,
      ),
    );
  }
}
