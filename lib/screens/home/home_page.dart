import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import 'widgets/custom_carousel_widget.dart';
import 'widgets/top_news_list_widget.dart';

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
              subHead('Top News'),
              TopNewsListWidget(future: newsProv.fetchTopNews()),
              SizedBox(height: 40.0),
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
