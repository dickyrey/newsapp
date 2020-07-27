import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import 'widgets/browse_news_home_widget.dart';
import 'widgets/custom_carousel_widget.dart';
import 'widgets/program_list_widget.dart';
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
              BrowseNewsInHome(newsProv: newsProv),
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
