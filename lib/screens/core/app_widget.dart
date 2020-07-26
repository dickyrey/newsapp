import 'package:flutter/material.dart';

import '../bottom_nav_bar/bottom_nav_bar_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavBarPage(),
    );
  }
}
