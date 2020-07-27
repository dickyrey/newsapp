import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/screens/home/widgets/custom_carousel_widget.dart';
import 'package:newsapp/test_widget.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:provider/provider.dart';

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
              CustomCarouselWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TestWidget()));
        },
      ),
    );
  }
}
