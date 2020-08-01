import 'package:flutter/material.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/screens/collection/widgets/news_collection_card.dart';
import 'package:newsapp/screens/core/news_webview_page.dart';
import 'package:newsapp/utils/constants.dart';

class SearchNewsPage extends SearchDelegate {
  final newsProv = NewsProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showResults(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: newsProv.fetchNewsbyQuery(query: query),
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
        // List results = snapshot.data;
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/search_illu.png'),
              Text('Search Something',style:headline2),
            ],
          ),
        ),
      );
    }
    return FutureBuilder(
      future: newsProv.fetchNewsbyQuery(query: query),
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
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              var news = snapshot.data[index];
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          news.urlToImage ??
                              'https://bitsofco.de/content/images/2018/12/broken-1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      news.title ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => NewsWebViewPage(url: news.url),)
                       );
                    },
                  ),
                  Divider(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
