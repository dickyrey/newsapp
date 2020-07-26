import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:newsapp/screens/home/home_page.dart';
import 'package:newsapp/utils/constants.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  AnimationController _animationController;
  Animation<Offset> _animation;
  DateTime currentBackPressTime;
  int _currentTab = 0;

  var currentTab = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: currentTab.length);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -1.0))
        .animate(CurvedAnimation(
            curve: Curves.easeOut, parent: _animationController));
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
              icon: Icon(FlutterIcons.home_ant),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.box_fea),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.message1_ant),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.note_oct),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.grid_fea),
              title: Text(''),
            ),
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
