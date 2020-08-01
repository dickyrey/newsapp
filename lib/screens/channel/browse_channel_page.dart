import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/channel_model.dart';
import '../../providers/news_provider.dart';
import '../../utils/constants.dart';
import '../country/browse_news_by_country_page.dart';

class BrowseChannelPage extends StatelessWidget {
  final ChannelModel programModel;

  const BrowseChannelPage({Key key, @required this.programModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsProvider>(context);
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                    pinned: true,
                    elevation: 0.0,
                    stretch: true,
                    title: Text(
                      programModel.name ?? '',
                      style: headline2.copyWith(color: Colors.white),
                    ),
                    expandedHeight: 180.0,
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 10.0,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          child: Image.network(
                            programModel.bannerImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black45,
                                  kBackgroundColor,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: CountryNewsDailyTab(
              future:
                  newsProv.fetchNewsfromChannel(domain: programModel.website),
            ),
          )),
    );
  }
}
