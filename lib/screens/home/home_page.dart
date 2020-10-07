import 'package:flutter/material.dart';
import 'package:newsapp/models/channel_model.dart';
import 'package:newsapp/screens/channel/browse_channel_page.dart';
import 'package:newsapp/screens/channel/channel_page.dart';
import 'package:newsapp/screens/collection/search_news_page.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import 'widgets/browse_news_home_widget.dart';
import 'widgets/custom_carousel_widget.dart';
import 'widgets/program_list_widget.dart';
import 'widgets/top_news_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: Text('BacaKita', style: headline2),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchNewsPage());
            },
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
              subHead(
                title: 'Top News from BBC News',
                onTap: () {
                  ChannelModel channel = channelList[0];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BrowseChannelPage(
                        programModel: channel,
                      ),
                    ),
                  );
                },
              ),
              TopNewsListWidget(future: newsProv.fetchTopNews()),
              SizedBox(height: 15.0),
              subHead(
                title: 'Top Channel',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ChannelPage(),
                    ),
                  );
                },
              ),
              ProgramListWidget(),
              BrowseNewsInHome(newsProv: newsProv),
            ],
          ),
        ),
      ),
    );
  }

  ListTile subHead({String title, Function onTap}) {
    return ListTile(
      title: Text(
        title,
        style: headline2,
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Text(
          'See all',
          style: subtitle2,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
