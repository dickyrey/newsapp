import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:provider/provider.dart';

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProv = Provider.of<NewsProvider>(context);
    return Scaffold(
      body: FutureBuilder<List<NewsModel>>(
        future: postProv.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<NewsModel> post = snapshot.data;
          return ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              var data = post[index];
              return Text(data.title);
            },
          );
        },
      ),
    );
  }
}
