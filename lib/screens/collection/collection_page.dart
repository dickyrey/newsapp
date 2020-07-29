import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category_model.dart';
import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import 'widgets/category_card.dart';
import 'widgets/tab_collection_widget.dart';

class CollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return DefaultTabController(
      length: 8,
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
                  Tab(text: 'Daily'),
                  Tab(text: 'Business'),
                  Tab(text: 'Entertainment'),
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
            allCategories(),
            TabCollectionWidget(future: newsProv.fetchCollection('general')),
            TabCollectionWidget(future: newsProv.fetchCollection('business')),
            TabCollectionWidget(
                future: newsProv.fetchCollection('entertainment')),
            TabCollectionWidget(future: newsProv.fetchCollection('health')),
            TabCollectionWidget(future: newsProv.fetchCollection('science')),
            TabCollectionWidget(future: newsProv.fetchCollection('sports')),
            TabCollectionWidget(future: newsProv.fetchCollection('technology')),
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
