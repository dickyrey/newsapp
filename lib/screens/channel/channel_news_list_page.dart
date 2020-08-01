import 'package:flutter/material.dart';
import 'package:newsapp/models/channel_model.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/screens/collection/widgets/tab_collection_widget.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:provider/provider.dart';

class ChannelNewsListPage extends StatelessWidget {
  final ChannelModel channel;
  ChannelNewsListPage({this.channel});

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(channel.name, style: headline2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: TabCollectionWidget(
          future: newsProv.fetchNewsfromChannel(domain: channel.website)),
    );
  }
}
