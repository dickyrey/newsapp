import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category_model.dart';
import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import 'category_card.dart';
import 'widgets/tab_collection_widget.dart';

class CollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Text('Collections', style: headline2),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
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
                  Tab(text: 'All Collection'),
                  Tab(text: 'Bitcoin'),
                  Tab(text: 'Business'),
                  Tab(text: 'Tech'),
                  Tab(text: 'Health'),
                  Tab(text: 'Music'),
                  Tab(text: 'Economy'),
                  Tab(text: 'Food'),
                  Tab(text: 'Sport'),
                  Tab(text: 'Travel'),
                  Tab(text: 'Politic'),
                  Tab(text: 'Astronomy'),
                  Tab(text: 'Movie'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            allCategories(),
            TabCollectionWidget(future: newsProv.fetchBitcoinCollection()),
            TabCollectionWidget(future: newsProv.fetchBusinessCollection()),
            TabCollectionWidget(future: newsProv.fetchTechCollection()),
            TabCollectionWidget(future: newsProv.fetchHealthCollection()),
            TabCollectionWidget(future: newsProv.fetchMusicCollection()),
            TabCollectionWidget(future: newsProv.fetchEconomyCollection()),
            TabCollectionWidget(future: newsProv.fetchFoodCollection()),
            TabCollectionWidget(future: newsProv.fetchSportCollection()),
            TabCollectionWidget(future: newsProv.fetchTravelCollection()),
            TabCollectionWidget(future: newsProv.fetchPoliticCollection()),
            TabCollectionWidget(future: newsProv.fetchAstronomyCollection()),
            TabCollectionWidget(future: newsProv.fetchMovieCollection()),
          ],
        ),
      ),
    );
  }

  GridView allCategories() {
    return GridView.builder(
      itemCount: categoryList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 2.2 / 3.2,
      ),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 15.0,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var category = categoryList[index];
        return CategoryCard(category: category);
      },
    );
  }
}
