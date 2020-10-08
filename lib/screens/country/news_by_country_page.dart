import 'package:flutter/material.dart';
import 'package:newsapp/screens/collection/search_news_page.dart';

import '../../models/country_model.dart';
import '../../utils/constants.dart';
import 'browse_news_by_country_page.dart';

class NewsByCountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text('Browse News by Country', style: headline2),
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
      body: ListView.builder(
        itemCount: countryList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        itemBuilder: (context, index) {
          var country = countryList[index];
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BrowseNewsByCountryPage(
                        country: country,
                      ),
                    ),
                  );
                },
                leading: Image.asset(country.image),
                title: Text(
                  country.name,
                  style: headline3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
