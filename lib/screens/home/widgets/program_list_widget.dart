import 'package:flutter/material.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/screens/channel/channel_news_list_page.dart';
import 'package:newsapp/screens/collection/widgets/tab_collection_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/channel_model.dart';
import '../../../utils/constants.dart';

class ProgramListWidget extends StatelessWidget {
  const ProgramListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return Container(
      width: double.infinity,
      height: 150.0,
      child: ListView.builder(
        itemCount: channelList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var channel = channelList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChannelNewsListPage(
                    channel: channel,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    margin: const EdgeInsets.only(bottom: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(
                          channel.logo,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    channel.name,
                    style: headline3,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
