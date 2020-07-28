import 'package:flutter/material.dart';
import 'package:newsapp/models/country_model.dart';
import 'package:newsapp/utils/constants.dart';

class NewsLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text('Browse News by Country', style: headline2),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        itemBuilder: (context, index) {
          var country = countryList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListTile(
              leading: Image.asset(country.image),
              title: Text(
                country.name,
                style: headline3,
              ),
            ),
          );
        },
      ),
    );
  }
}
