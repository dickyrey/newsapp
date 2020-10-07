import 'package:flutter/material.dart';
import 'package:newsapp/screens/collection/search_news_page.dart';
import 'package:provider/provider.dart';

import '../../models/country_model.dart';
import '../../models/news_model.dart';
import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import '../collection/widgets/news_collection_card.dart';

class BrowseNewsByCountryPage extends StatelessWidget {
  final Country country;

  const BrowseNewsByCountryPage({Key key, @required this.country})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: kBlueDeepColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: kBackgroundColor,
          title: Text(country.name, style: headline2),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchNewsPage());
              },
              color: Colors.black,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: TabBar(
                isScrollable: true,
                indicatorColor: kBlueDeepColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0.9,
                unselectedLabelColor: Colors.black45,
                indicator: BoxDecoration(
                  color: kBlueDeepColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                tabs: [
                  Tab(text: 'Daily'),
                  Tab(text: 'Business'),
                  Tab(text: 'Entertainment'),
                  Tab(text: 'General'),
                  Tab(text: 'Health'),
                  Tab(text: 'Science'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Technology'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                  countryCode: country.countryCode, category: ""),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "business",
              ),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "entertainment",
              ),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "general",
              ),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "health",
              ),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "science",
              ),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "sports",
              ),
            ),
            CountryNewsDailyTab(
              future: newsProv.fetchNewsbyCountryCollection(
                countryCode: country.countryCode,
                category: "technology",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryNewsDailyTab extends StatelessWidget {
  final Future<List<NewsModel>> future;

  const CountryNewsDailyTab({Key key, @required this.future}) : super(key: key);
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
                return Center(
                    child: Text(
                  'Something error',
                  style: headline2,
                ));
              }
              if (!snapshot.hasData) {
                return Center(
                    child: Text(
                  'No Data',
                  style: headline2,
                ));
              }
              break;

            default:
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            itemBuilder: (context, index) {
              var news = snapshot.data[index];
              return NewsCollectionCard(news: news);
            },
          );
        });
  }
}
