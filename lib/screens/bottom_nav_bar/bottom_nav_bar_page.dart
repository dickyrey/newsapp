import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../utils/constants.dart';
import '../collection/collection_page.dart';
import '../country/news_by_country_page.dart';
import '../home/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  AnimationController _animationController;
  DateTime currentBackPressTime;
  int _currentTab = 0;

  var currentTab = [
    HomePage(),
    CollectionPage(),
    NewsByCountryPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: currentTab.length);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            NotificationListener<UserScrollNotification>(
              child: TabBarView(
                  children: currentTab,
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics()),
              onNotification: (UserScrollNotification notification) {
                if (true) {
                  if (notification.direction == ScrollDirection.reverse &&
                      notification.metrics.extentAfter > kToolbarHeight &&
                      notification.metrics.axis == Axis.vertical) {
                    _animationController.forward();
                  } else if (notification.direction ==
                      ScrollDirection.forward) {
                    _animationController.reverse();
                  }
                }
                return true;
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (index) {
            setState(() {
              _currentTab = index;
              _tabController.animateTo(_currentTab);
              _animationController.reverse();
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kBlueDeepColor,
          unselectedItemColor: Colors.black45,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.home_fea),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.grid_fea),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.note_oct),
              title: Text(''),
            ),
//            BottomNavigationBarItem(
//              icon: Icon(FlutterIcons.user_fea),
//              title: Text(''),
//            ),
          ],
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
