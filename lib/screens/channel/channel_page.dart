import 'package:flutter/material.dart';
import 'package:newsapp/models/channel_model.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/screens/channel/browse_channel_page.dart';
import 'package:newsapp/screens/home/widgets/top_news_list_widget.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:provider/provider.dart';

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: channelList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var channel = channelList[index];
              return ChannelListWidget(
                channel: channel,
                index: index,
              );
            }),
      ),
    );
  }
}

class ChannelListWidget extends StatelessWidget {
  const ChannelListWidget({
    Key key,
    @required this.channel,
    this.index,
  }) : super(key: key);

  final ChannelModel channel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return Column(
      children: <Widget>[
        subHead(
          title: 'Top News from ${channel.name}',
          onTap: () {
            ChannelModel channel = channelList[index];
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
        TopNewsListWidget(
            future: newsProv.fetchNewsfromChannel(domain: channel.website)),
      ],
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
}
